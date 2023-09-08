import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/app_entities/payment_history.dart';

abstract final class _Fields {
  static const String paymentPrice = 'paymentPrice';
  static const String paymentDate = 'paymentDate';
  static const String paymentDescription = 'paymentDescription';
}

final class PaymentHistoryMapper implements BaseMapper<PaymentHistory> {
  @override
  Map<String, dynamic> toJson(PaymentHistory data) {
    return {
      _Fields.paymentPrice: data.paymentPrice,
      _Fields.paymentDate: data.paymentDate.toString(),
      _Fields.paymentDescription: data.paymentDescription,
    };
  }

  @override
  PaymentHistory fromJson(Map<String, dynamic> json) {
    return PaymentHistory(
      paymentPrice: json[_Fields.paymentPrice],
      paymentDate: DateTime.parse(json[_Fields.paymentDate]),
      paymentDescription: json[_Fields.paymentDescription],
    );
  }
}
