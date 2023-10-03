import 'package:yookassa_payments_flutter/input_data/tokenization_module_input_data.dart';
import 'package:yookassa_payments_flutter/models/tokenization_result.dart';

abstract interface class IPaymentDataSource {
  TokenizationModuleInputData buildTokenizationInputData({
    required String shopToken,
    required String shopId,
    required String value,
    String? title,
    String? subtitle,
  });

  Future<void> createPaymentObject();

  Future<void> startPayment(TokenizationResult result);
}
