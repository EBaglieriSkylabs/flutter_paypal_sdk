import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_paypal_sdk/core.dart';
import 'package:flutter_paypal_sdk/orders.dart';
import 'package:flutter_paypal_sdk/src/views/paypal_checkout_view_model.dart';

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
  final void Function(Object) onError;

  @override
  State<PaypalCheckoutView> createState() => _PaypalCheckoutViewState();
}

class _PaypalCheckoutViewState extends State<PaypalCheckoutView> {
  InAppWebViewController? _webView;
  StreamSubscription<CheckoutState>? _stateListener;
  late final PaypalCheckoutViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = PaypalCheckoutViewModel(
        environment: widget.environment,
        isExpress: widget.isExpress,
        purchaseUnits: widget.purchaseUnits,
        returnUrl: widget.returnUrl,
        cancelUrl: widget.cancelUrl,
        onSuccess: widget.onSuccess,
        onCancel: widget.onCancel,
        onError: widget.onError);
    _stateListener = viewModel.stateStream.listen((state) {
      if (state.pageStatus == CheckoutPageStatus.orderCreated) {
        final checkoutUrl = state.checkoutUrl;
        _webView?.loadUrl(urlRequest: URLRequest(url: checkoutUrl));
      }
    });
  }

  @override
  void dispose() {
    _stateListener?.cancel();
    _stateListener = null;
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CheckoutState>(
        stream: viewModel.stateStream,
        builder: (context, snapshot) {
          final state = snapshot.data ?? CheckoutState.initial();
          final currentUrl = state.webViewUrl ?? Uri();
          final isWebViewLoading = state.pageStatus == CheckoutPageStatus.webViewLoading;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: false,
              leadingWidth: 48.0,
              leading: IconButton(
                onPressed: () => viewModel.cancel(null),
                icon: Icon(Icons.close),
              ),
              title: _AppBarContent(
                currentUrl: currentUrl,
                isLoading: isWebViewLoading,
              ),
              elevation: 0,
            ),
            body: Stack(
              children: [
                InAppWebView(
                  initialOptions: InAppWebViewGroupOptions(
                    android: AndroidInAppWebViewOptions(
                      useHybridComposition: true,
                    ),
                    ios: IOSInAppWebViewOptions(
                      allowsInlineMediaPlayback: true,
                      disableLongPressContextMenuOnLinks: true,
                      allowsLinkPreview: false,
                    ),
                    crossPlatform: InAppWebViewOptions(
                      useShouldOverrideUrlLoading: true,
                      mediaPlaybackRequiresUserGesture: false,
                    ),
                  ),
                  onWebViewCreated: (controller) {
                    _webView = controller;
                    viewModel.createOrder();
                  },
                  onLoadStart: (_, url) => viewModel.webViewDidStartLoading(url),
                  onLoadStop: (_, url) => viewModel.webViewDidFinishLoading(url),
                  shouldOverrideUrlLoading: (controller, navigationAction) async {
                    final uri = navigationAction.request.url;
                    final urlString = navigationAction.request.url.toString();
                    if (urlString.contains(widget.returnUrl)) {
                      viewModel.capturePayment();
                    }
                    if (urlString.contains(widget.cancelUrl)) {
                      viewModel.cancel(uri?.queryParameters);
                    }
                    return NavigationActionPolicy.ALLOW;
                  },
                ),
                if (state.pageStatus == CheckoutPageStatus.initial) ...[
                  const Center(child: CircularProgressIndicator())
                ],
              ],
            ),
          );
        });
  }
}

class _AppBarContent extends StatelessWidget {
  const _AppBarContent({
    super.key,
    required this.currentUrl,
    required this.isLoading,
  });

  final Uri currentUrl;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3), borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Icon(
                  Icons.lock_outline,
                  color: currentUrl.hasScheme ? Colors.green : Colors.blue,
                  size: 18,
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    currentUrl.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                SizedBox(width: isLoading ? 5 : 0),
                isLoading
                    ? SizedBox.square(
                        dimension: 10.0,
                        child: CircularProgressIndicator(
                          color: Color(0xFFEB920D),
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          ),
        )
      ],
    );
  }
}
