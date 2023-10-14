import 'dart:convert';
import 'dart:ui';

import 'package:core/avtovas_core.dart';
import 'package:core/data/data_sources/interfaces/i_payment_data_source.dart';
import 'package:core/data/mappers/yookassa/yookassa.dart';
import 'package:core/data/utils/yookassa_methods/yokassa_methods.dart';
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
    String? title,
    String? subtitle,
  }) {
    final cost = double.tryParse(value);

    try {
      if (cost != null) {
        final amount = Amount(value: cost, currency: Currency.rub);

        final tokenizationModuleInputData = TokenizationModuleInputData(
          clientApplicationKey: shopToken,
          title: 'Онлайн билет АО "АВТОВАС"',
          subtitle: 'Онлайн билет АО "АВТОВАС"',
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
          'test_BCUb_u3SxG8tL0LfN6TWcVUPixbJ1HXVoGysivRBVUY',
          shopId,
          idempotenceKeyV4,
        );

        final requestBody = YookassaMethods.createPayment(
          paymentToken: paymentToken,
          cost: double.parse(cost),
          paymentDescription: 'ОНЛАЙН БИЛЕТ "АО АВТОВАС"',
          customerName: 'АО "АВТОВАС"',
          customerInn: '2126000549',
          customerEmail: 'aoavtovas@mail.ru',
          customerPhone: '79000000000',
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
}
