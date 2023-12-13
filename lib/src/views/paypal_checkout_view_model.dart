import 'dart:async';

import 'package:flutter_paypal_sdk/core.dart';
import 'package:flutter_paypal_sdk/orders.dart';

class PaypalCheckoutViewModel {
  PaypalCheckoutViewModel({
    required PayPalEnvironment environment,
    required this.isExpress,
    required this.purchaseUnits,
    required this.returnUrl,
    required this.cancelUrl,
    required this.onSuccess,
    required this.onCancel,
    required this.onError,
  }) : _client = PayPalHttpClient(environment) {
    _stateSubscription = _stateController.stream.listen((event) {
      state = event;
    });
    _stateController.add(CheckoutState.initial());
  }

  void dispose() {
    _stateSubscription?.cancel();
    _stateSubscription = null;
    _stateController.close();
  }

  final bool isExpress;
  final List<PurchaseUnitRequest> purchaseUnits;
  final String returnUrl;
  final String cancelUrl;
  final void Function(Order) onSuccess;
  final void Function(Map<String, String>) onCancel;
  final void Function(Object) onError;

  final PayPalHttpClient _client;
  final _stateController = StreamController<CheckoutState>.broadcast();

  StreamSubscription? _stateSubscription;
  CheckoutState state = CheckoutState.initial();
  Stream<CheckoutState> get stateStream => _stateController.stream;

  void emit(CheckoutState newState) {
    if (state == newState) return;
    _stateController.add(newState);
  }

  void complete(Order order) {
    onSuccess(order);
  }

  void cancel(Map<String, String>? params) {
    onCancel(params ?? {});
  }

  void fail(Object e) {
    onError(e);
  }

  Future<void> createOrder() async {
    final ordersApi = OrdersApi(_client);
    final request = _prepareOrderRequest();
    emit(CheckoutState(pageStatus: CheckoutPageStatus.initial));
    try {
      final order = await ordersApi.createOrder(request);
      // TODO: add a check on nullability of url and emit an error
      final url = _extractCheckoutUrlFromOrder(order);
      emit(CheckoutState(
        pageStatus: CheckoutPageStatus.orderCreated,
        checkoutUrl: url,
        order: order,
      ));
    } catch (e) {
      fail(e);
    }
  }

  Future<void> capturePayment() async {
    final ordersApi = OrdersApi(_client);
    // TODO: add a check on nullability of url and emit an error
    final orderId = state.order?.id;
    try {
      final order = await ordersApi.capturePayment(orderId ?? '');
      complete(order);
    } catch (e) {
      fail(e);
    }
  }

  void webViewDidStartLoading(Uri? url) {
    emit(state.copyWith(
      pageStatus: CheckoutPageStatus.webViewLoading,
      webViewUrl: url,
    ));
  }

  void webViewDidFinishLoading(Uri? url) {
    emit(state.copyWith(
      pageStatus: CheckoutPageStatus.webViewLoaded,
      webViewUrl: url,
    ));
  }

  OrderRequest _prepareOrderRequest() {
    final paypalExperience = ExperienceContext(
      paymentMethodPreference: PayeePreferred.immediatePaymentRequired,
      landingPage: LandingPage.login,
      shippingPreference:
          (isExpress) ? ShippingPreference.getFromFile : ShippingPreference.setProvidedAddress,
      userAction: (isExpress) ? UserAction.payNow : UserAction.continue_,
      cancelUrl: cancelUrl,
      returnUrl: returnUrl,
    );
    return OrderRequest(
        intent: OrderRequestIntent.capture,
        purchaseUnits: purchaseUnits,
        paymentSource: PaymentSourceRequest.paypal(experienceContext: paypalExperience));
  }

  Uri? _extractCheckoutUrlFromOrder(Order order) {
    final relValue = (order.status == OrderStatus.payerActionRequired) ? 'payer-action' : 'approve';
    final checkoutLink = order.links?.firstWhere((element) => element.rel == relValue);
    if (checkoutLink == null) return null;
    return Uri.tryParse(checkoutLink.href);
  }
}

enum CheckoutPageStatus { initial, orderCreated, webViewLoading, webViewLoaded }

class CheckoutState {
  const CheckoutState({
    required this.pageStatus,
    this.order,
    this.checkoutUrl,
    this.webViewUrl,
  });

  const CheckoutState.initial()
      : pageStatus = CheckoutPageStatus.initial,
        order = null,
        checkoutUrl = null,
        webViewUrl = null;

  final CheckoutPageStatus pageStatus;
  final Order? order;
  final Uri? checkoutUrl;
  final Uri? webViewUrl;

  CheckoutState copyWith({
    CheckoutPageStatus? pageStatus,
    Order? order,
    Uri? checkoutUrl,
    Uri? webViewUrl,
  }) {
    return CheckoutState(
      pageStatus: pageStatus ?? this.pageStatus,
      order: order ?? this.order,
      checkoutUrl: checkoutUrl ?? this.checkoutUrl,
      webViewUrl: webViewUrl ?? this.webViewUrl,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CheckoutState &&
        other.pageStatus == pageStatus &&
        other.order == order &&
        other.checkoutUrl == checkoutUrl &&
        other.webViewUrl == webViewUrl;
  }

  @override
  int get hashCode {
    return pageStatus.hashCode ^ order.hashCode ^ checkoutUrl.hashCode ^ webViewUrl.hashCode;
  }

  @override
  String toString() {
    return 'CheckoutState(pageStatus: $pageStatus, order: $order, checkoutUrl: $checkoutUrl, webViewUrl: $webViewUrl)';
  }
}
