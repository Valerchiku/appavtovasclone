import 'dart:convert';

import 'package:core/domain/utils/core_logger.dart';
import 'package:http/http.dart' as http;

abstract final class CurrentDateTimeRequest {
  // ignore: type_annotate_public_apis, public_member_api_docs, always_declare_return_types
  static getCurrentMskDateTime() async {
    final response = await http.get(
      Uri.parse('http://worldtimeapi.org/api/timezone/Europe/Moscow'),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final String utcDatetime = data['utc_datetime'];
      CoreLogger.infoLog(utcDatetime);
      return utcDatetime;
    }
    CoreLogger.errorLog('Failed to fetch Moscow time');
    return DateTime.now();
  }
}
