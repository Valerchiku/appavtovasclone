import 'dart:convert';

import 'package:core/data/data_sources/interfaces/i_payment_data_source.dart';
import 'package:core/data/utils/constants/private_info.dart';
import 'package:core/data/utils/yookassa_helper/payment_statuses.dart';
import 'package:core/data/utils/yookassa_helper/yokassa_requests.dart';
import 'package:core/domain/entities/yookassa/yookassa_payment.dart';
import 'package:core/domain/utils/core_logger.dart';
import 'package:core/domain/utils/uuid_generator.dart';
import 'package:http/http.dart' as http;
import 'package:yookassa_payments_flutter/input_data/tokenization_module_input_data.dart';

final class WebPaymentDataSource implements IPaymentDataSource {
  @override
  TokenizationModuleInputData buildTokenizationInputData({
    required String shopToken,
    required String shopId,
    required String value,
    required String title,
    required String subtitle,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> cancelPayment() {
    throw UnimplementedError();
  }

  @override
  Future<(String, String)> generateConfirmationToken({
    required String shopToken,
    required String shopId,
    required String cost,
    required String paymentDescription,
    required String customerName,
    required String customerInn,
    required String customerEmail,
    required String customerPhone,
  }) async {
    try {
      final iamResponse = await http.get(
        Uri.parse(PrivateInfo.iamTokenEndpoint),
      );

      final iamToken = (jsonDecode(iamResponse.body)
          as Map<String, dynamic>)['access_token'];

      final requestBody = jsonEncode(
        YookassaRequests.webCreatePayment(
          cost: double.parse(cost),
          paymentDescription: paymentDescription,
          customerName: customerName,
          customerInn: customerInn,
          customerEmail: customerEmail,
          customerPhone: customerPhone,
        ),
      );

      final response = await http.post(
        Uri.parse('https://functions.yandexcloud.net/d4elf62o7upgi5uip30j'),
        headers: PrivateInfo.apiAuthorizationHeaders(iamToken),
        body: json.encode({'dbName': 'AVTOVAS', 'yookassaBody': requestBody}),
      );

      if (response.statusCode == 200) {
        final decodedBody = jsonDecode(response.body) as Map<String, dynamic>;

        final paymentId = decodedBody['paymentId'] as String;
        final confirmationToken = decodedBody['confirmationToken'] as String;

        return (paymentId, confirmationToken);
      } else {
        throw Exception(
          '''
            Response has errors
            Status code: ${response.statusCode}
            Response body: ${response.body}'
            ''',
        );
      }
    } catch (e) {
      CoreLogger.errorLog(
        'Something went wrong',
        params: {'Description: ': e},
      );

      return ('error_id', 'error_token');
    }
  }

  @override
  Future<String> fetchPaymentStatus({
    required String shopToken,
    required String shopId,
    required String paymentId,
  }) async {
    try {
      final iamResponse = await http.get(
        Uri.parse(PrivateInfo.iamTokenEndpoint),
      );

      final iamToken = (jsonDecode(iamResponse.body)
          as Map<String, dynamic>)['access_token'];

      final response = await http.post(
        Uri.parse('https://functions.yandexcloud.net/d4e0raprgvqm49vr4alg'),
        headers: PrivateInfo.apiAuthorizationHeaders(iamToken),
        body: json.encode({'dbName': 'AVTOVAS', 'paymentId': paymentId}),
      );

      if (response.statusCode == 200) {
        print((jsonDecode(response.body) as Map<String, dynamic>)['status']);

        return (jsonDecode(response.body) as Map<String, dynamic>)['status'];


      } else {
        throw Exception(
          '''
            Response has errors
            Status code: ${response.statusCode}
            Response body: ${response.body}'
            ''',
        );
      }
    } catch (e) {
      CoreLogger.errorLog(
        'Something went wrong',
        params: {'Description: ': e},
      );

      return PaymentStatuses.undefinedStatus;
    }
  }

  @override
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
  }) async {
    throw UnimplementedError();
  }
}
