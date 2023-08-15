import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/app_entities/payment.dart';

abstract final class _Fields {
  static const String paymentPrice = 'paymentPrice';
  static const String paymentDate = 'paymentDate';
  static const String paymentDescription = 'paymentDescription';
}

final class PaymentMapper implements BaseMapper<Payment> {
  @override
  Map<String, dynamic> toJson(Payment data) {
    return {
      _Fields.paymentPrice: data.paymentPrice,
      _Fields.paymentDate: data.paymentDate.toString(),
      _Fields.paymentDescription: data.paymentDescription,
    };
  }

  @override
  Payment fromJson(Map<String, dynamic> json) {
    return Payment(
      paymentPrice: json[_Fields.paymentPrice],
      paymentDate: DateTime.parse(json[_Fields.paymentDate]),
      paymentDescription: json[_Fields.paymentDescription],
    );
  }
}