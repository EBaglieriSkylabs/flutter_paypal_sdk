// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payer _$PayerFromJson(Map<String, dynamic> json) => Payer(
      name: json['name'] == null
          ? null
          : Name.fromJson(json['name'] as Map<String, dynamic>),
      emailAddress: json['email_address'] as String?,
      phone: json['phone'] == null
          ? null
          : PhoneWithType.fromJson(json['phone'] as Map<String, dynamic>),
      birthDate: json['birth_date'] as String?,
      address: json['address'] == null
          ? null
          : AddressPortable.fromJson(json['address'] as Map<String, dynamic>),
      payerId: json['payer_id'] as String?,
    );

Map<String, dynamic> _$PayerToJson(Payer instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('email_address', instance.emailAddress);
  writeNotNull('phone', instance.phone);
  writeNotNull('birth_date', instance.birthDate);
  writeNotNull('address', instance.address);
  writeNotNull('payer_id', instance.payerId);
  return val;
}
