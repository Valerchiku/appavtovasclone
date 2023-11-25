import 'dart:convert';
import 'dart:ui';

import 'package:core/avtovas_core.dart';
import 'package:core/data/data_sources/interfaces/i_payment_data_source.dart';
import 'package:core/data/mappers/yookassa/yookassa.dart';
import 'package:core/domain/entities/yookassa/yookassa_payment.dart';
import 'package:core/domain/utils/core_logger.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:yookassa_payments_flutter/yookassa_payments_flutter.dart';

final class PaymentDataSource implements IPaymentDataSource {
  @override
  TokenizationModuleInputData buildTokenizationInputData({
    required String shopToken,
    required String shopId,
    required String value,
    required String title,
    required String subtitle,
  }) {
    final cost = double.tryParse(value);

    try {
      if (cost != null) {
        final amount = Amount(value: cost, currency: Currency.rub);

        final tokenizationModuleInputData = TokenizationModuleInputData(
          clientApplicationKey: shopToken,
          title: title,
          subtitle: subtitle,
          amount: amount,
          savePaymentMethod: SavePaymentMethod.on,
          isLoggingEnabled: true,
          tokenizationSettings: const TokenizationSettings(
            PaymentMethodTypes.bankCard,
          ),
          shopId: shopId,
          customizationSettings: const CustomizationSettings(
            Color.fromARGB(255, 0, 112, 240),
            false,
          ),
        );

        return tokenizationModuleInputData;
      } else {
        CoreLogger.errorLog(
          'Payment error (value not recognized)',
          params: {'Parsed value': value},
        );

        throw Exception();
      }
    } catch (e) {
      CoreLogger.errorLog(
        'Payment error',
        params: {'error': e},
      );

      throw Exception();
    }
  }

  @override
  Future<YookassaPayment> createPaymentObject({
    required TokenizationModuleInputData tokenizationModuleInputData,
    required String shopToken,
    required String shopId,
    required String cost,
    required String paymentDescription,
    required String customerName,
    required String customerInn,
    required String customerEmail,
    required String customerPhone,
  }) async {
    final result = await YookassaPaymentsFlutter.tokenization(
      tokenizationModuleInputData,
    );

    try {
      if (result is SuccessTokenizationResult) {
        final paymentToken = result.token;
        final idempotenceKeyV4 = generateUuid();
        const apiUrl = PrivateInfo.yookassaApiUrl;

        final headers = PrivateInfo.yookassaHeaders(
          secretKey: shopToken,
          shopId: shopId,
          idempotenceKey: idempotenceKeyV4,
        );

        final requestBody = YookassaRequests.createPayment(
          paymentToken: paymentToken,
          cost: double.parse(cost),
          paymentDescription: paymentDescription,
          customerName: customerName,
          customerInn: customerInn,
          customerEmail: customerEmail,
          customerPhone: customerPhone,
        );

        final response = await http.post(
          Uri.parse(apiUrl),
          headers: headers,
          body: json.encode(requestBody),
        );

        if (response.statusCode == 200) {
          return YookassaPaymentMapper().fromJson(
            jsonDecode(response.body),
          );
        } else {
          throw Exception(
            '''
            Response has errors
            Status code: ${response.statusCode}
            Response body: ${response.body}'
            ''',
          );
        }
      } else {
        throw Exception('Result from [YookassaPaymentsFlutter] is not success');
      }
    } catch (e) {
      CoreLogger.errorLog(
        'Something went wrong',
        params: {'Description: ': e},
      );

      return YookassaPayment.error();
    }
  }

  @override
  Future<String> fetchPaymentStatus({
    required String shopToken,
    required String shopId,
    required String paymentId,
  }) async {
    try {
      final apiUrl = '${PrivateInfo.yookassaApiUrl}/$paymentId';

      final headers = PrivateInfo.yookassaHeaders(
        secretKey: shopToken,
        shopId: shopId,
        withContentType: false,
      );

      final response = await http.get(
        Uri.parse(apiUrl),
        headers: headers,
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
}
