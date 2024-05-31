import 'package:core/avtovas_core.dart';
import 'package:core/domain/entities/yookassa/yookassa_payment.dart';
import 'package:yookassa_payments_flutter/yookassa_payments_flutter.dart';

abstract interface class IPaymentRepository {
  TokenizationModuleInputData buildTokenizationInputData({
    required String dbName,
    required String value,
    required String paymentDescription,
  });

  Future<(String, String)> generateConfirmationToken({
    required String dbName,
    required String value,
  });

  Future<YookassaPayment> createPaymentObject({
    required User user,
    required String dbName,
    required TokenizationModuleInputData tokenizationModuleInputData,
    required String value,
  });

  Future<(String, String)> refundPayment({
    required String dbName,
    required String paymentId,
    required double refundCostAmount,
  });

  Future<String> fetchPaymentStatus({
    required String dbName,
    required String paymentId,
  });
}
