import 'dart:convert';

import 'package:core/avtovas_core.dart';
import 'package:core/domain/utils/core_logger.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

final class IamYandexToken implements IIamYandexToken {
  IamYandexToken() {
    _fetchIamToken();
  }

  final BehaviorSubject<String?> _iamTokenSubject = BehaviorSubject();

  @override
  Stream<String?> get iamTokenStream => _iamTokenSubject;

  @override
  Future<void> tryFetchToken() {
    return _fetchIamToken();
  }

  Future<void> _fetchIamToken() async {
    http
        .post(
      Uri.parse(PrivateInfo.iamYandexTokenUrl),
      headers: {
        ...PrivateInfo.jsonContentType,
      },
      body: json.encode(PrivateInfo.iamYandexRequest),
    )
        .then(
      (response) {
        if (response.statusCode == 200) {
          CoreLogger.infoLog('Successfully getting IAM Token');

          final jsonData = jsonDecode(response.body);

          _iamTokenSubject.add((jsonData as Map<String, dynamic>)['iamToken']);
        } else {
          CoreLogger.errorLog(
            'Error receiving IAM token (statusCode != 200)',
            params: {
              'status code': response.statusCode,
              'response body': response.body,
            },
          );

          _iamTokenSubject.add(null);
        }
      },
    ).catchError(
      (value) {
        CoreLogger.errorLog(
          'Error receiving IAM token (Future catchError)',
          params: {
            'dynamic value': value,
          },
        );

        _iamTokenSubject.add(null);
      },
    );
  }
}
