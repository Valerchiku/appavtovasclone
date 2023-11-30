import 'package:core/domain/entities/yookassa/yookassa_payment.dart';
import 'package:yookassa_payments_flutter/yookassa_payments_flutter.dart';

abstract interface class IPaymentRepository {
  TokenizationModuleInputData buildTokenizationInputData({
    required String value,
    required String paymentDescription,
  });

  Future<(String, String)> generateConfirmationToken({required String value});

  Future<YookassaPayment> createPaymentObject({
    required TokenizationModuleInputData tokenizationModuleInputData,
    required String value,
  });

  Future<String> fetchPaymentStatus({required String paymentId});
}
