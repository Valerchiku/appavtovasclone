import 'dart:convert';
import 'dart:ui';

import 'package:avtovas_mobile/src/features/main/widgets/my_trips_widgets/core/data/data_source/interfaces/i_payment_data_source.dart';
import 'package:yookassa_payments_flutter/yookassa_payments_flutter.dart';
import 'package:http/http.dart' as http;

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

    if (cost != null) {
      final amount = Amount(
        value: cost,
        currency: Currency.rub,
      );

      return TokenizationModuleInputData(
        clientApplicationKey: shopToken,
        title: title ?? '',
        subtitle: subtitle ?? '',
        amount: amount,
        savePaymentMethod: SavePaymentMethod.on,
        tokenizationSettings: const TokenizationSettings(
          PaymentMethodTypes.bankCard,
        ),
        shopId: shopId,
        customizationSettings: const CustomizationSettings(
          Color.fromARGB(255, 0, 112, 240),
          false,
        ),
        testModeSettings: TestModeSettings(
          false,
          1,
          amount,
          false,
        ),
      );
    } else {
      throw Exception();
    }
  }

  @override
  Future<void> createPaymentObject() async {}

  @override
  Future<void> startPayment(TokenizationResult result) async {
    if (result is SuccessTokenizationResult) {
      // Define the API URL
      final url = Uri.parse('https://api.yookassa.ru/v3/payments');

      // Define the request headers
      final headers = {
        'Content-Type': 'application/json',
        'Idempotence-Key': '+375291515860',
        'Authorization': 'Basic ${base64Encode(
          utf8.encode(
              '769931:test_BCUb_u3SxG8tL0LfN6TWcVUPixbJ1HXVoGysivRBVUY'),
        )}',
      };

      // Define the request body
      final body = jsonEncode(
        {
          'amount': {
            'value': '2.00',
            'currency': 'RUB',
          },
          'payment_token': result.token,
          'confirmation': {
            'type': 'redirect',
            'return_url': 'https://www.example.com/return_url',
          },
          'description': 'Заказ №72',
        },
      );

      try {
        // Send the POST request
        final response = await http.post(
          url,
          headers: headers,
          body: body,
        );

        // Check if the request was successful (status code 200)
        if (response.statusCode == 200) {
          // You can handle the response data here
          print('Payment Request Successful: ${response.body}');
        } else {
          // Handle the error case
          print('Payment Request Failed: ${response.statusCode}');
          print('Response Body: ${response.body}');
        }
      } catch (e) {
        // Handle any exceptions that occur during the request
        print('Error: $e');
      }
    }
  }
}
