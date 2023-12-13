import 'package:flutter_paypal_sdk/core.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payer.g.dart';

/// The payer of an order.
@JsonSerializable(fieldRename: FieldRename.snake)
class Payer {
  /// The name of the payer. Supports only the given_name and surname properties.
  final Name? name;

  /// The email address of the payer.
  final String? emailAddress;

  /// The phone number of the customer.
  /// Available only when you enable the Contact Telephone Number option in the Profile & Settings for the merchant's PayPal account
  final PhoneWithType? phone;

  /// The birth date of the payer in YYYY-MM-DD format.
  final String? birthDate;

  /// The address of the payer.
  /// Supports only the address_line_1, address_line_2, admin_area_1, admin_area_2, postal_code, and country_code properties.
  /// Also referred to as the billing address of the customer.
  final AddressPortable? address;

  /// The PayPal-assigned ID for the payer.
  final String? payerId;

  const Payer({
    this.name,
    this.emailAddress,
    this.phone,
    this.birthDate,
    this.address,
    this.payerId,
  });

  Map<String, dynamic> toJson() => _$PayerToJson(this);

  factory Payer.fromJson(Map<String, dynamic> json) => _$PayerFromJson(json);

  @override
  String toString() {
    return 'Payer(name: $name, emailAddress: $emailAddress, phone: $phone, birthDate: $birthDate, address: $address, payerId: $payerId)';
  }
}
