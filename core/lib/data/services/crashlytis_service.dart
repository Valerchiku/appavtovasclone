import 'dart:convert';

import 'package:core/avtovas_core.dart';
import 'package:core/domain/utils/core_logger.dart';
import 'package:http/http.dart' as http;

final class CrashlyticsService {
  Future<void> sendCrashlytics({
    required String error,
    required String stackTrace,
    required String errorPlace,
    String? userUid,
  }) async {
    try {
      const crashlyticsEndpoint =
          'https://functions.yandexcloud.net/d4ed3tag2a2it63t0mj2';

      final requestBody = {
        'uid': generateUuid(),
        'error': error,
        'stackTrace': stackTrace,
        'errorPlace': errorPlace,
        'userUid': userUid,
      };

      final response = await http.post(
        Uri.parse(crashlyticsEndpoint),
        body: jsonEncode(requestBody),
      );

      CoreLogger.errorLog('$stackTrace');

      CoreLogger.infoLog('Crashlytics sent: ${response.statusCode}');
    } on Object catch (e) {
      CoreLogger.errorLog('Crashlytics sending finished with error $e');
      return;
    }
  }
}
