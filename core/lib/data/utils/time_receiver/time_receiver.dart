import 'dart:convert';

import 'package:core/domain/utils/core_logger.dart';
import 'package:http/http.dart' as http;

abstract final class TimeReceiver {
  static Future<DateTime> fetchUnifiedTime() async {
    const url = 'https://worldtimeapi.org/api/timezone/Europe/Moscow';

    final response = await http.get(
      Uri.parse(url),
    );

    try {
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        final unifiedTime = (jsonData as Map<String, dynamic>)['datetime'];

        return DateTime.parse(unifiedTime);
      } else {
        throw Exception('Time fetch error');
      }
    } catch (e) {
      CoreLogger.errorLog('$e');

      return DateTime.now();
    }
  }
}
