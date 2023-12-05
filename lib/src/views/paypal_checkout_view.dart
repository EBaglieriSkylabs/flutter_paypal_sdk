import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_paypal_sdk/core.dart';
import 'package:flutter_paypal_sdk/orders.dart';

class PaypalCheckoutView extends StatefulWidget {
  const PaypalCheckoutView({
    super.key,
    required this.environment,
    required this.isExpress,
    required this.purchaseUnits,
    required this.returnUrl,
    required this.cancelUrl,
    required this.onSuccess,
    required this.onCancel,
    required this.onError,
  });

  final PayPalEnvironment environment;
  final bool isExpress;
  final List<PurchaseUnitRequest> purchaseUnits;
  final String returnUrl;
  final String cancelUrl;
  final void Function(Order) onSuccess;
  final void Function(Map<String, String>) onCancel;
  final void Function(Exception) onError;

  @override
  State<PaypalCheckoutView> createState() => _PaypalCheckoutViewState();
}

class _PaypalCheckoutViewState extends State<PaypalCheckoutView> {
  late final client = PayPalHttpClient(widget.environment);
  InAppWebViewController? webView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text("Paypal Payment"),
      ),
      body: FutureBuilder<Order?>(
          future: createOrder(),
          builder: (context, snapshot) {
            final order = snapshot.data;
            if (order == null) {
              return const Center(child: CircularProgressIndicator());
            }
            final checkoutUrl = extractCheckoutUrlFromOrder(order);
            return InAppWebView(
              initialOptions: InAppWebViewGroupOptions(
                crossPlatform: InAppWebViewOptions(
                  useShouldOverrideUrlLoading: true,
                ),
              ),
              initialUrlRequest: URLRequest(url: checkoutUrl),
              onWebViewCreated: (controller) {
                webView = controller;
              },
              shouldOverrideUrlLoading: (controller, navigationAction) async {
                final uri = navigationAction.request.url;
                final urlString = navigationAction.request.url.toString();
                if (urlString.contains(widget.returnUrl)) {
                  final placedOrder = await capturePaymentForOrderId(order.id);
                  complete(placedOrder);
                }
                if (urlString.contains(widget.cancelUrl)) {
                  cancel(uri?.queryParameters);
                }
                return NavigationActionPolicy.ALLOW;
              },
            );
          }),
    );
  }

  OrderRequest prepareOrderRequest() {
    final paypalExperience = ExperienceContext(
      paymentMethodPreference: PayeePreferred.immediatePaymentRequired,
      landingPage: LandingPage.login,
      shippingPreference: (widget.isExpress)
          ? ShippingPreference.getFromFile
          : ShippingPreference.setProvidedAddress,
      userAction: (widget.isExpress) ? UserAction.payNow : UserAction.continue_,
      cancelUrl: widget.cancelUrl,
      returnUrl: widget.returnUrl,
    );
    return OrderRequest(
        intent: OrderRequestIntent.capture,
        purchaseUnits: widget.purchaseUnits,
        paymentSource: PaymentSourceRequest.paypal(experienceContext: paypalExperience));
  }

  Future<Order> createOrder() async {
    final ordersApi = OrdersApi(client);
    final request = prepareOrderRequest();
    final order = await ordersApi.createOrder(request);
    return order;
  }

  Uri? extractCheckoutUrlFromOrder(Order order) {
    final relValue = (order.status == OrderStatus.payerActionRequired) ? 'payer-action' : 'approve';
    final checkoutLink = order.links?.firstWhere((element) => element.rel == relValue);
    if (checkoutLink == null) return null;
    return Uri.tryParse(checkoutLink.href);
  }

  Future<Order> capturePaymentForOrderId(String? orderId) async {
    final ordersApi = OrdersApi(client);
    return await ordersApi.capturePayment(orderId ?? '');
  }

  void complete(Order order) {
    widget.onSuccess(order);
  }

  void cancel(Map<String, String>? params) {
    widget.onCancel(params ?? {});
  }
}
