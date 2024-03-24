import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/app_entities/payment.dart';

abstract final class _Fields {
  static const String paymentUuid = 'payment_uuid';
  static const String paymentPrice = 'payment_price';
  static const String paymentDate = 'payment_date';
  static const String paymentDescription = 'payment_description';
  static const String paymentStatus = 'payment_status';
}

final class PaymentMapper implements BaseMapper<Payment> {
  @override
  Map<String, dynamic> toJson(Payment data) {
    return {
      _Fields.paymentUuid: data.paymentUuid,
      _Fields.paymentPrice: data.paymentPrice,
      _Fields.paymentDate: data.paymentDate.toString(),
      _Fields.paymentDescription: data.paymentDescription,
      _Fields.paymentStatus: data.paymentStatus,
    };
  }

  @override
  Payment fromJson(Map<String, dynamic> json) {
    return Payment(
      paymentUuid: json[_Fields.paymentUuid],
      paymentPrice: json[_Fields.paymentPrice],
      paymentDate: DateTime.parse(json[_Fields.paymentDate]),
      paymentDescription: json[_Fields.paymentDescription],
      paymentStatus: json[_Fields.paymentStatus] ?? 'paid',
    );
  }
}
