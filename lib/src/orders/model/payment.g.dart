// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) =>
    PaymentMethod(
      payerSelected: json['payer_selected'] as String?,
      payeePreferred:
          $enumDecodeNullable(_$PayeePreferredEnumMap, json['payee_preferred']),
      standardEntryClassCode: $enumDecodeNullable(
          _$StandardEntryClassCodeEnumMap, json['standard_entry_class_code']),
    );

Map<String, dynamic> _$PaymentMethodToJson(PaymentMethod instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('payer_selected', instance.payerSelected);
  writeNotNull(
      'payee_preferred', _$PayeePreferredEnumMap[instance.payeePreferred]);
  writeNotNull('standard_entry_class_code',
      _$StandardEntryClassCodeEnumMap[instance.standardEntryClassCode]);
  return val;
}

const _$PayeePreferredEnumMap = {
  PayeePreferred.unrestricted: 'UNRESTRICTED',
  PayeePreferred.immediatePaymentRequired: 'IMMEDIATE_PAYMENT_REQUIRED',
};

const _$StandardEntryClassCodeEnumMap = {
  StandardEntryClassCode.tel: 'TEL',
  StandardEntryClassCode.web: 'WEB',
  StandardEntryClassCode.ccd: 'CCD',
  StandardEntryClassCode.ppd: 'PPD',
};

StoredPaymentSource _$StoredPaymentSourceFromJson(Map<String, dynamic> json) =>
    StoredPaymentSource(
      paymentInitiator:
          $enumDecode(_$PaymentInitiatorEnumMap, json['payment_initiator']),
      paymentType: $enumDecode(_$PaymentTypeEnumMap, json['payment_type']),
      usage: $enumDecodeNullable(_$UsageEnumMap, json['usage']),
      networkTransactionReference: json['network_transaction_reference'] == null
          ? null
          : NetworkTransactionReference.fromJson(
              json['network_transaction_reference'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StoredPaymentSourceToJson(StoredPaymentSource instance) {
  final val = <String, dynamic>{
    'payment_initiator': _$PaymentInitiatorEnumMap[instance.paymentInitiator]!,
    'payment_type': _$PaymentTypeEnumMap[instance.paymentType]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('usage', _$UsageEnumMap[instance.usage]);
  writeNotNull(
      'network_transaction_reference', instance.networkTransactionReference);
  return val;
}

const _$PaymentInitiatorEnumMap = {
  PaymentInitiator.customer: 'CUSTOMER',
  PaymentInitiator.merchant: 'MERCHANT',
};

const _$PaymentTypeEnumMap = {
  PaymentType.oneTime: 'ONE_TIME',
  PaymentType.recurring: 'RECURRING',
  PaymentType.unscheduled: 'UNSCHEDULED',
};

const _$UsageEnumMap = {
  Usage.first: 'FIRST',
  Usage.subsequent: 'SUBSEQUENT',
  Usage.derived: 'DERIVED',
};

NetworkTransactionReference _$NetworkTransactionReferenceFromJson(
        Map<String, dynamic> json) =>
    NetworkTransactionReference(
      id: json['id'] as String,
      date: json['date'] as String?,
      network: $enumDecode(_$NetworkEnumMap, json['network']),
    );

Map<String, dynamic> _$NetworkTransactionReferenceToJson(
    NetworkTransactionReference instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('date', instance.date);
  val['network'] = _$NetworkEnumMap[instance.network]!;
  return val;
}

const _$NetworkEnumMap = {
  Network.visa: 'VISA',
  Network.mastercard: 'MASTERCARD',
  Network.discover: 'DISCOVER',
  Network.amex: 'AMEX',
  Network.solo: 'SOLO',
  Network.jcb: 'JCB',
  Network.star: 'STAR',
  Network.delta: 'DELTA',
  Network.switch_: 'SWITCH',
  Network.maestro: 'MAESTRO',
  Network.cbNationale: 'CB_NATIONALE',
  Network.configoga: 'CONFIGOGA',
  Network.confidis: 'CONFIDIS',
  Network.electron: 'ELECTRON',
  Network.cetelem: 'CETELEM',
  Network.chinaUnionPay: 'CHINA_UNION_PAY',
};

PaymentSourceRequest _$PaymentSourceRequestFromJson(
        Map<String, dynamic> json) =>
    PaymentSourceRequest(
      json['paypal'] == null
          ? null
          : PaypalSourceRequest.fromJson(
              json['paypal'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentSourceRequestToJson(
    PaymentSourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('paypal', instance.paypal);
  return val;
}

PaymentSource _$PaymentSourceFromJson(Map<String, dynamic> json) =>
    PaymentSource(
      json['card'] == null
          ? null
          : CardPaymentSource.fromJson(json['card'] as Map<String, dynamic>),
      json['paypal'] == null
          ? null
          : PaypalSource.fromJson(json['paypal'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentSourceToJson(PaymentSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('card', instance.card);
  writeNotNull('paypal', instance.paypal);
  return val;
}

PaymentSourceToken _$PaymentSourceTokenFromJson(Map<String, dynamic> json) =>
    PaymentSourceToken(
      Token.fromJson(json['token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentSourceTokenToJson(PaymentSourceToken instance) =>
    <String, dynamic>{
      'token': instance.token,
    };

Token _$TokenFromJson(Map<String, dynamic> json) => Token(
      json['id'] as String,
      json['type'] as String,
    );

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
    };

CardPaymentSource _$CardPaymentSourceFromJson(Map<String, dynamic> json) =>
    CardPaymentSource(
      name: json['name'] as String?,
      billingAddress: json['billing_address'] == null
          ? null
          : AddressPortable.fromJson(
              json['billing_address'] as Map<String, dynamic>),
      lastDigits: json['last_digits'] as String?,
      brand: $enumDecodeNullable(_$NetworkEnumMap, json['brand']),
    );

Map<String, dynamic> _$CardPaymentSourceToJson(CardPaymentSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('billing_address', instance.billingAddress);
  writeNotNull('last_digits', instance.lastDigits);
  writeNotNull('brand', _$NetworkEnumMap[instance.brand]);
  return val;
}

PaypalSourceRequest _$PaypalSourceRequestFromJson(Map<String, dynamic> json) =>
    PaypalSourceRequest(
      experienceContext: json['experience_context'] == null
          ? null
          : ExperienceContext.fromJson(
              json['experience_context'] as Map<String, dynamic>),
      billingAgreementId: json['billing_agreement_id'] as String?,
      vaultId: json['vault_id'] as String?,
      emailAddress: json['email_address'] as String?,
      name: json['name'] == null
          ? null
          : Name.fromJson(json['name'] as Map<String, dynamic>),
      phone: json['phone'] == null
          ? null
          : PhoneWithType.fromJson(json['phone'] as Map<String, dynamic>),
      birthDate: json['birth_date'] as String?,
      address: json['address'] == null
          ? null
          : AddressPortable.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaypalSourceRequestToJson(PaypalSourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('experience_context', instance.experienceContext);
  writeNotNull('billing_agreement_id', instance.billingAgreementId);
  writeNotNull('vault_id', instance.vaultId);
  writeNotNull('email_address', instance.emailAddress);
  writeNotNull('name', instance.name);
  writeNotNull('phone', instance.phone);
  writeNotNull('birth_date', instance.birthDate);
  writeNotNull('address', instance.address);
  return val;
}

PaypalSource _$PaypalSourceFromJson(Map<String, dynamic> json) => PaypalSource(
      phoneType: $enumDecodeNullable(_$PhoneTypeEnumMap, json['phone_type']),
      emailAddress: json['email_address'] as String?,
      accountId: json['account_id'] as String?,
      name: json['name'] == null
          ? null
          : Name.fromJson(json['name'] as Map<String, dynamic>),
      phoneNumber: json['phone_number'] == null
          ? null
          : Phone.fromJson(json['phone_number'] as Map<String, dynamic>),
      birthDate: json['birth_date'] as String?,
      address: json['address'] == null
          ? null
          : AddressPortable.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaypalSourceToJson(PaypalSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('phone_type', _$PhoneTypeEnumMap[instance.phoneType]);
  writeNotNull('email_address', instance.emailAddress);
  writeNotNull('account_id', instance.accountId);
  writeNotNull('name', instance.name);
  writeNotNull('phone_number', instance.phoneNumber);
  writeNotNull('birth_date', instance.birthDate);
  writeNotNull('address', instance.address);
  return val;
}

const _$PhoneTypeEnumMap = {
  PhoneType.fax: 'FAX',
  PhoneType.home: 'HOME',
  PhoneType.mobile: 'MOBILE',
  PhoneType.other: 'OTHER',
  PhoneType.pager: 'PAGER',
  PhoneType.work: 'WORK',
};

PaymentCollection _$PaymentCollectionFromJson(Map<String, dynamic> json) =>
    PaymentCollection(
      authorizations: (json['authorizations'] as List<dynamic>?)
          ?.map((e) => AuthorizationWithAdditionalData.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      captures: (json['captures'] as List<dynamic>?)
          ?.map((e) => Capture.fromJson(e as Map<String, dynamic>))
          .toList(),
      refunds: (json['refunds'] as List<dynamic>?)
          ?.map((e) => Refund.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaymentCollectionToJson(PaymentCollection instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('authorizations', instance.authorizations);
  writeNotNull('captures', instance.captures);
  writeNotNull('refunds', instance.refunds);
  return val;
}

AuthorizationWithAdditionalData _$AuthorizationWithAdditionalDataFromJson(
        Map<String, dynamic> json) =>
    AuthorizationWithAdditionalData(
      ProcessorResponse.fromJson(
          json['processor_response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthorizationWithAdditionalDataToJson(
        AuthorizationWithAdditionalData instance) =>
    <String, dynamic>{
      'processor_response': instance.processorResponse,
    };

Capture _$CaptureFromJson(Map<String, dynamic> json) => Capture(
      status: json['status'] as String?,
      statusDetails: $enumDecodeNullable(
          _$CaptureStatusReasonEnumMap, json['status_details']),
      id: json['id'] as String?,
      amount: json['amount'] == null
          ? null
          : Money.fromJson(json['amount'] as Map<String, dynamic>),
      invoiceId: json['invoice_id'] as String?,
      customId: json['custom_id'] as String?,
      sellerProtection: json['seller_protection'] == null
          ? null
          : SellerProtection.fromJson(
              json['seller_protection'] as Map<String, dynamic>),
      finalCapture: json['final_capture'] as bool?,
      sellerReceivableBreakdown: json['seller_receivable_breakdown'] == null
          ? null
          : SellerReceivableBreakdown.fromJson(
              json['seller_receivable_breakdown'] as Map<String, dynamic>),
      disbursementMode: json['disbursement_mode'] as String?,
      processorResponse: json['processor_response'] == null
          ? null
          : ProcessorResponse.fromJson(
              json['processor_response'] as Map<String, dynamic>),
      createTime: json['create_time'] as String?,
      updateTime: json['update_time'] as String?,
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => LinkDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CaptureToJson(Capture instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', instance.status);
  writeNotNull(
      'status_details', _$CaptureStatusReasonEnumMap[instance.statusDetails]);
  writeNotNull('id', instance.id);
  writeNotNull('amount', instance.amount);
  writeNotNull('invoice_id', instance.invoiceId);
  writeNotNull('custom_id', instance.customId);
  writeNotNull('seller_protection', instance.sellerProtection);
  writeNotNull('final_capture', instance.finalCapture);
  writeNotNull(
      'seller_receivable_breakdown', instance.sellerReceivableBreakdown);
  writeNotNull('disbursement_mode', instance.disbursementMode);
  writeNotNull('processor_response', instance.processorResponse);
  writeNotNull('create_time', instance.createTime);
  writeNotNull('update_time', instance.updateTime);
  writeNotNull('links', instance.links);
  return val;
}

const _$CaptureStatusReasonEnumMap = {
  CaptureStatusReason.buyerComplaint: 'BUYER_COMPLAINT',
  CaptureStatusReason.chargeback: 'CHARGEBACK',
  CaptureStatusReason.echeck: 'ECHECK',
  CaptureStatusReason.internationalWithdrawal: 'INTERNATIONAL_WITHDRAWAL',
  CaptureStatusReason.other: 'OTHER',
  CaptureStatusReason.pendingReview: 'PENDING_REVIEW',
  CaptureStatusReason.receivingPreferenceMandatesManualAction:
      'RECEIVING_PREFERENCE_MANDATES_MANUAL_ACTION',
  CaptureStatusReason.refunded: 'REFUNDED',
  CaptureStatusReason.transactionApprovedAwaitingFunding:
      'TRANSACTION_APPROVED_AWAITING_FUNDING',
  CaptureStatusReason.unilateral: 'UNILATERAL',
  CaptureStatusReason.verificationRequired: 'VERIFICATION_REQUIRED',
};

Refund _$RefundFromJson(Map<String, dynamic> json) => Refund(
      status: json['status'] as String?,
      statusDetails: json['status_details'] == null
          ? null
          : RefundStatus.fromJson(
              json['status_details'] as Map<String, dynamic>),
      id: json['id'] as String?,
      amount: json['amount'] == null
          ? null
          : Money.fromJson(json['amount'] as Map<String, dynamic>),
      invoiceId: json['invoice_id'] as String?,
      noteToPayer: json['note_to_payer'] as String?,
      sellerPayableBreakdown: json['seller_payable_breakdown'] as String?,
      createTime: json['create_time'] as String?,
      updateTime: json['update_time'] as String?,
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => LinkDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RefundToJson(Refund instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', instance.status);
  writeNotNull('status_details', instance.statusDetails);
  writeNotNull('id', instance.id);
  writeNotNull('amount', instance.amount);
  writeNotNull('invoice_id', instance.invoiceId);
  writeNotNull('note_to_payer', instance.noteToPayer);
  writeNotNull('seller_payable_breakdown', instance.sellerPayableBreakdown);
  writeNotNull('create_time', instance.createTime);
  writeNotNull('update_time', instance.updateTime);
  writeNotNull('links', instance.links);
  return val;
}

RefundStatus _$RefundStatusFromJson(Map<String, dynamic> json) => RefundStatus(
      status: $enumDecodeNullable(_$RefundStatusValueEnumMap, json['status']),
      statusDetails: json['status_details'] == null
          ? null
          : RefundStatusDetails.fromJson(
              json['status_details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RefundStatusToJson(RefundStatus instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', _$RefundStatusValueEnumMap[instance.status]);
  writeNotNull('status_details', instance.statusDetails);
  return val;
}

const _$RefundStatusValueEnumMap = {
  RefundStatusValue.cancelled: 'CANCELLED',
  RefundStatusValue.pending: 'PENDING',
  RefundStatusValue.completed: 'COMPLETED',
};

SellerProtection _$SellerProtectionFromJson(Map<String, dynamic> json) =>
    SellerProtection(
      status:
          $enumDecodeNullable(_$SellerProtectionStatusEnumMap, json['status']),
      disputeCategories: (json['dispute_categories'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$DisputeCategoryValueEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$SellerProtectionToJson(SellerProtection instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', _$SellerProtectionStatusEnumMap[instance.status]);
  writeNotNull(
      'dispute_categories',
      instance.disputeCategories
          ?.map((e) => _$DisputeCategoryValueEnumMap[e]!)
          .toList());
  return val;
}

const _$SellerProtectionStatusEnumMap = {
  SellerProtectionStatus.eligible: 'ELIGIBLE',
  SellerProtectionStatus.partiallyEligible: 'PARTIALLY_ELIGIBLE',
  SellerProtectionStatus.notEligible: 'NOT_ELIGIBLE',
};

const _$DisputeCategoryValueEnumMap = {
  DisputeCategoryValue.itemNotReceived: 'ITEM_NOT_RECEIVED',
  DisputeCategoryValue.unauthorizedTransaction: 'UNAUTHORIZED_TRANSACTION',
};

DisputeCategory _$DisputeCategoryFromJson(Map<String, dynamic> json) =>
    DisputeCategory(
      $enumDecode(_$DisputeCategoryValueEnumMap, json['dispute_category']),
    );

Map<String, dynamic> _$DisputeCategoryToJson(DisputeCategory instance) =>
    <String, dynamic>{
      'dispute_category':
          _$DisputeCategoryValueEnumMap[instance.disputeCategory]!,
    };

SellerReceivableBreakdown _$SellerReceivableBreakdownFromJson(
        Map<String, dynamic> json) =>
    SellerReceivableBreakdown(
      grossAmount: Money.fromJson(json['gross_amount'] as Map<String, dynamic>),
      paypalFee: json['paypal_fee'] == null
          ? null
          : Money.fromJson(json['paypal_fee'] as Map<String, dynamic>),
      paypalFeeInReceivableCurrency:
          json['paypal_fee_in_receivable_currency'] == null
              ? null
              : Money.fromJson(json['paypal_fee_in_receivable_currency']
                  as Map<String, dynamic>),
      netAmount: json['net_amount'] == null
          ? null
          : Money.fromJson(json['net_amount'] as Map<String, dynamic>),
      receivableAmount: json['receivable_amount'] == null
          ? null
          : Money.fromJson(json['receivable_amount'] as Map<String, dynamic>),
      exchangeRate: json['exchange_rate'] == null
          ? null
          : ExchangeRate.fromJson(
              json['exchange_rate'] as Map<String, dynamic>),
      platformFees: (json['platform_fees'] as List<dynamic>?)
          ?.map((e) => PlatformFee.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SellerReceivableBreakdownToJson(
    SellerReceivableBreakdown instance) {
  final val = <String, dynamic>{
    'gross_amount': instance.grossAmount,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('paypal_fee', instance.paypalFee);
  writeNotNull('paypal_fee_in_receivable_currency',
      instance.paypalFeeInReceivableCurrency);
  writeNotNull('net_amount', instance.netAmount);
  writeNotNull('receivable_amount', instance.receivableAmount);
  writeNotNull('exchange_rate', instance.exchangeRate);
  writeNotNull('platform_fees', instance.platformFees);
  return val;
}
