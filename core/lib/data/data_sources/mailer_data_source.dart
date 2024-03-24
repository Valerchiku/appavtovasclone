import 'dart:convert';
import 'dart:typed_data';

import 'package:core/data/data_sources/interfaces/i_mailer_data_source.dart';
import 'package:core/domain/utils/core_logger.dart';
import 'package:http/http.dart' as http;

final class MailerDataSource implements IMailerDataSource {
  @override
  Future<void> sendSupportMail({
    required String userName,
    required String message,
  }) async {
    try {
      final params = {
        'messageType': 'support',
        'customerName': userName,
        'customerMessage': message,
      };

      final response = await http.post(
        Uri.parse('https://functions.yandexcloud.net/d4eme0i6lcm84qb9m4n5'),
        body: jsonEncode(params),
      );

      if (response.statusCode != 200) {
        throw Exception(response.body);
      }

      CoreLogger.infoLog('Send message to support');
    } catch (e) {
      CoreLogger.errorLog(
        'Unsuccessful sending message to support',
        params: {'Exception': e},
      );
    }
  }

  @override
  Future<void> sendTicketMail({
    required String mailAddress,
    required Uint8List ticketBytes,
    required String html,
  }) async {
    try {
      final params = {
        'messageType': 'ticket',
        'customerEmail': mailAddress,
        'ticketBytes': ticketBytes,
        'html': html,
      };

      final response = await http.post(
        Uri.parse('https://functions.yandexcloud.net/d4eme0i6lcm84qb9m4n5'),
        body: jsonEncode(params),
      );

      if (response.statusCode != 200) {
        throw Exception(response.body);
      }

      CoreLogger.infoLog('Send message to support, body: ${response.body}');
    } catch (e) {
      CoreLogger.errorLog(
        'Unsuccessful sending message to support',
        params: {'Exception': e},
      );
    }
  }
}
