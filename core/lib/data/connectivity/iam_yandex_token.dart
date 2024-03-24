/*
import 'dart:convert';

import 'package:core/data/connectivity/interfaces/i_iam_yandex_token.dart';
import 'package:core/data/utils/constants/private_info.dart';
import 'package:core/domain/utils/core_logger.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

final class IamYandexToken implements IIamYandexToken {
  IamYandexToken() {
    tryFetchToken();
  }

  final BehaviorSubject<String?> _iamTokenSubject = BehaviorSubject();

  @override
  Stream<String?> get iamTokenStream => _iamTokenSubject;

  @override
  Future<void> tryFetchToken() {
    return _fetchIamToken();
  }

  Future<void> _fetchIamToken() async {
    try {
      final response = await http.get(Uri.parse(PrivateInfo.iamTokenUrl));

      final responseBody = jsonDecode(response.body) as Map<String, dynamic>;

      final iamToken = responseBody['access_token'].toString();

      CoreLogger.infoLog('Successful fetched IAM-token');

      return _iamTokenSubject.add(iamToken);
    } catch (e) {
      CoreLogger.errorLog(
        "Can't fetch IAM-token",
        params: {'Reason': e},
      );
    }
  }
}
*/
