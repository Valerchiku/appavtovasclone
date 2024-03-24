import 'package:core/domain/entities/yookassa/yookassa_payment.dart';
import 'package:yookassa_payments_flutter/input_data/tokenization_module_input_data.dart';

abstract interface class IPaymentDataSource {
  TokenizationModuleInputData buildTokenizationInputData({
    required String shopToken,
    required String shopId,
    required String value,
    required String title,
    required String subtitle,
  });

  Future<(String, String)> generateConfirmationToken({
    required String cost,
    required String paymentDescription,
    required String customerName,
    required String customerInn,
    required String customerEmail,
    required String customerPhone,
  });

  Future<YookassaPayment> createPaymentObject({
    required TokenizationModuleInputData? tokenizationModuleInputData,
    required String shopToken,
    required String shopId,
    required String cost,
    required String paymentDescription,
    required String customerName,
    required String customerInn,
    required String customerEmail,
    required String customerPhone,
  });

  Future<(String, String)> refundPayment({
    required String paymentId,
    required double refundCostAmount,
    String? dbName,
    String? paymentDescription,
    String? customerName,
    String? customerInn,
    String? customerEmail,
    String? customerPhone,
    String? shopApiToken,
    String? shopId,
  });

  Future<String> fetchPaymentStatus({
    String? dbName,
    String? shopToken,
    String? shopId,
    String? paymentId,
  });
}
