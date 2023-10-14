import 'package:core/domain/entities/yookassa/yookassa_payment.dart';
import 'package:yookassa_payments_flutter/yookassa_payments_flutter.dart';

abstract interface class IPaymentRepository {
  TokenizationModuleInputData buildTokenizationInputData({
    required String value,
    String? title,
    String? subtitle,
  });

  Future<YookassaPayment> createPaymentObject(
    TokenizationModuleInputData tokenizationModuleInputData,
    String value,
  );
}
