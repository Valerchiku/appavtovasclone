import 'package:yookassa_payments_flutter/yookassa_payments_flutter.dart';

abstract interface class IPaymentRepository {
  TokenizationModuleInputData buildTokenizationInputData({
    required String value,
    String? title,
    String? subtitle,
  });

  Future<void> startPayment(TokenizationResult result);
}
