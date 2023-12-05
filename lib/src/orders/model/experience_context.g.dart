// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExperienceContext _$ExperienceContextFromJson(Map<String, dynamic> json) =>
    ExperienceContext(
      brandName: json['brand_name'] as String?,
      shippingPreference: $enumDecodeNullable(
          _$ShippingPreferenceEnumMap, json['shipping_preference']),
      landingPage:
          $enumDecodeNullable(_$LandingPageEnumMap, json['landing_page']),
      userAction: $enumDecodeNullable(_$UserActionEnumMap, json['user_action']),
      paymentMethodPreference: $enumDecodeNullable(
          _$PayeePreferredEnumMap, json['payment_method_preference']),
      locale: json['locale'] as String?,
      returnUrl: json['return_url'] as String?,
      cancelUrl: json['cancel_url'] as String?,
    );

Map<String, dynamic> _$ExperienceContextToJson(ExperienceContext instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('brand_name', instance.brandName);
  writeNotNull('shipping_preference',
      _$ShippingPreferenceEnumMap[instance.shippingPreference]);
  writeNotNull('landing_page', _$LandingPageEnumMap[instance.landingPage]);
  writeNotNull('user_action', _$UserActionEnumMap[instance.userAction]);
  writeNotNull('payment_method_preference',
      _$PayeePreferredEnumMap[instance.paymentMethodPreference]);
  writeNotNull('locale', instance.locale);
  writeNotNull('return_url', instance.returnUrl);
  writeNotNull('cancel_url', instance.cancelUrl);
  return val;
}

const _$ShippingPreferenceEnumMap = {
  ShippingPreference.getFromFile: 'GET_FROM_FILE',
  ShippingPreference.noShipping: 'NO_SHIPPING',
  ShippingPreference.setProvidedAddress: 'SET_PROVIDED_ADDRESS',
};

const _$LandingPageEnumMap = {
  LandingPage.login: 'LOGIN',
  LandingPage.billing: 'BILLING',
  LandingPage.noPreference: 'NO_PREFERENCE',
};

const _$UserActionEnumMap = {
  UserAction.continue_: 'CONTINUE',
  UserAction.payNow: 'PAY_NOW',
};

const _$PayeePreferredEnumMap = {
  PayeePreferred.unrestricted: 'UNRESTRICTED',
  PayeePreferred.immediatePaymentRequired: 'IMMEDIATE_PAYMENT_REQUIRED',
};
