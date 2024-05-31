import 'dart:convert';

import 'package:core/data/data_sources/interfaces/i_payment_data_source.dart';
import 'package:core/data/utils/constants/private_info.dart';
import 'package:core/data/utils/yookassa_helper/payment_statuses.dart';
import 'package:core/data/utils/yookassa_helper/yokassa_requests.dart';
import 'package:core/domain/entities/app_entities/user.dart';
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
  }) async {
    try {
      if (shopApiToken != null || shopId != null) {
        throw Exception('Error: shopApiToken or shopId must be null!');
      }

      final response = await http.post(
        Uri.parse(PrivateInfo.yookassaRefundsWebApiUrl),
        body: jsonEncode(
          YookassaRequests.refundWebPayment(
            dbName: dbName!,
            paymentId: paymentId,
            refundCostAmount: refundCostAmount,
          ),
        ),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

        final refundStatus = jsonResponse['status'].toString();

        CoreLogger.infoLog('Refund process passed successfully!');

        return (refundStatus, '');
      }

      throw Exception('Something went wrong\nResponse body: ${response.body}');
    } catch (e) {
      CoreLogger.errorLog(
        'Refund exception',
        params: {'Params': e},
      );

      return ('error', 'error');
    }
  }

  @override
  Future<(String, String)> generateConfirmationToken({
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
    String? dbName,
    String? shopToken,
    String? shopId,
    String? paymentId,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('https://functions.yandexcloud.net/d4e0raprgvqm49vr4alg'),
        body: json.encode({'dbName': dbName, 'paymentId': paymentId}),
      );

      if (response.statusCode == 200) {
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
    required User user,
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
