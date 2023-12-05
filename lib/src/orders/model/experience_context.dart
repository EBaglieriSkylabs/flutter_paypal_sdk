import 'package:flutter_paypal_sdk/orders.dart';
import 'package:json_annotation/json_annotation.dart';

part 'experience_context.g.dart';

/// ExperienceContext object
@JsonSerializable(fieldRename: FieldRename.snake)
class ExperienceContext {
  /// The label that overrides the business name in the PayPal account on the PayPal site.
  /// The pattern is defined by an external party and supports Unicode.
  final String? brandName;

  /// The location from which the shipping address is derived.
  final ShippingPreference? shippingPreference;

  /// The type of landing page to show on the PayPal site for customer checkout.
  final LandingPage? landingPage;

  /// Configures a Continue or Pay Now checkout flow.
  final UserAction? userAction;

  /// The merchant-preferred payment methods.
  final PayeePreferred? paymentMethodPreference;

  /// The BCP 47-formatted locale of pages that the PayPal payment experience shows.
  /// PayPal supports a five-character code.
  final String? locale;

  /// The URL where the customer is redirected after the customer approves the payment.
  final String? returnUrl;

  /// The URL where the customer is redirected after the customer cancels the payment.
  final String? cancelUrl;

  ExperienceContext({
    this.brandName,
    this.shippingPreference,
    this.landingPage,
    this.userAction,
    this.paymentMethodPreference,
    this.locale,
    this.returnUrl,
    this.cancelUrl,
  });

  Map<String, dynamic> toJson() => _$ExperienceContextToJson(this);

  factory ExperienceContext.fromJson(Map<String, dynamic> json) =>
      _$ExperienceContextFromJson(json);
}
