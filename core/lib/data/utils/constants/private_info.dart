import 'dart:convert';

import 'package:core/domain/entities/db_info/db_info.dart';

abstract final class PrivateInfo {
  /// REGION - FUNCTIONS URLS.

  static const String iamTokenEndpoint =
      'https://functions.yandexcloud.net/d4epgkr61mrfhn52j9cq';
  static const String phoneFetchingEndpoint =
      'https://functions.yandexcloud.net/d4ekmo1gonma2ae7br67';
  static const String userFetchingEndpoint =
      'https://functions.yandexcloud.net/d4e0plotb5hkjsivsp7b';
  static const String addUserSqlRequestEndpoint =
      'https://functions.yandexcloud.net/d4elo52idmn6aortgfrk';
  static const String updateUserSqlRequestEndpoint =
      'https://functions.yandexcloud.net/d4epauslhsscikq1gnno';
  static const String yookassaShopsFetchingEndpoint =
      'https://functions.yandexcloud.net/d4e8p9tgm14ioin4503k';
  static const String notificationsEndpoint =
      'https://functions.yandexcloud.net/d4edabho9g2mjqp3odgl';

  static Map<String, String> apiAuthorizationHeaders(String iamToken) =>
      {'Authorization': 'Bearer $iamToken'};

  /// END REGION.

  // FULL URL
  static const String fullAvtovasUrl =
      'https://1c-avtovas.avtovas.com:443/infobase1/ws/saleport?wsdl';
  static const String fullStepanovUrl =
      'http://avibus.vokzal21.ru:8081/avibus/ws/saleport?wsdl';

  // URL
  static const String avtovasUrl =
      'https://1c-avtovas.avtovas.com:443/infobase1/ws/saleport';
  static const String stepanovUrl =
      'http://avibus.vokzal21.ru:8081/avibus/ws/saleport';

  // AVTOVAS HEADER
  static Map<String, String> avibisHeaders({
    required String avibusLogin,
    required String avibusPassword,
  }) {
    return {
      'Content-Type': 'text/xml',
      'Authorization': 'Basic ${base64Encode(
        utf8.encode('$avibusLogin:$avibusPassword'),
      )}',
      'Accept': '*/*',
    };
  }

  static Map<String, String> lockBoxHeaders(String iamToken) =>
      <String, String>{'Authorization': 'Bearer $iamToken'};

  // LOGIN & PASSWORD
  // CALLER
  static const String callerEndpoint = 'https://functions.yandexcloud.net/d4e4j2q7snkk9uurfgsp';

  static const jsonContentType = <String, String>{
    'Content-Type': 'application/json',
  };

  static const String yookassaPaymentsApiUrl =
      'https://api.yookassa.ru/v3/payments';
  static const String yookassaRefundsApiUrl =
      'https://api.yookassa.ru/v3/refunds';
  static const String yookassaRefundsWebApiUrl = 'https://functions.yandexcloud.net/d4ebe74civ37iq9j1cfh';

  static Map<String, String> yookassaHeaders({
    required String secretKey,
    required String shopId,
    String? idempotenceKey,
    bool withContentType = true,
  }) {
    return {
      'Authorization': 'Basic ${base64Encode(
        utf8.encode('$shopId:$secretKey'),
      )}',
      if (idempotenceKey != null) 'Idempotence-Key': idempotenceKey,
      if (withContentType) 'Content-Type': 'application/json',
    };
  }
}
