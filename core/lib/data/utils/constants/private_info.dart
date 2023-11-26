import 'dart:convert';

import 'package:core/domain/entities/db_info/db_info.dart';

abstract final class PrivateInfo {
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
  static Map<String, String> avtovasHeaders = {
    'Content-Type': 'text/xml',
    'Authorization': 'Basic ${base64Encode(
      utf8.encode('$_avtovasLogin:$_avtovasPassword'),
    )}',
  };

  // STEPANOV HEADER
  static Map<String, String> stepanovHeaders = {
    'Content-Type': 'text/xml',
    'Authorization': 'Basic ${base64Encode(
      utf8.encode('$_stepanovLogin:$_stepanovPassword'),
    )}',
    'Accept': '*/*',
  };

  static const iamYandexRequest = <String, String>{
    'yandexPassportOauthToken': _oAuthYandexToken,
  };

  static Map<String, String> lockBoxHeaders(String iamToken) =>
      <String, String>{'Authorization': 'Bearer $iamToken'};

  static const String iamYandexTokenUrl =
      'https://iam.api.cloud.yandex.net/iam/v1/tokens';
  static const String lockBoxUrl =
      'https://payload.lockbox.api.cloud.yandex.net/lockbox/v1/secrets/$_lockBoxId/payload';
  static const String _oAuthYandexToken =
      'y0_AgAAAAAHvQudAATuwQAAAADqidBlTtFT2GllR8-kvdk9KTtolidNEOA';
  static const String _lockBoxId = 'e6qf5gobm8tkcan1j5dh';

  // LOGIN & PASSWORD
  // CALLER
  static const String baseConnectionUrl = 'http://api.ucaller.net/';
  static const String callerSecretKey = 'HXJcRNRTJVlDteZ233uPYiO4MjhrBnsN';
  static const String callerServiceId = '815684';

  // AVIBUS
  static const String _avtovasLogin = 'mobapl';
  static const String _avtovasPassword = 'Yjd-Aht-Uhs-Cty65';
  static const String _stepanovLogin = 'mobapp';
  static const String _stepanovPassword = 'KU334t23y4';

  // SMTP SERVER LOGIN & PASSWORD & URL
  static const String smtpUrl = 'smtp.mail.ru';
  static const int smtpPort = 465;
  static const String smtpEmail = 'aoavtovas@mail.ru';
  static const String smtpPassword = 'FHqmv4zbnXYsvPa2yV8S';

  static List<DbInfo> dbInfo = [
    DbInfo(
      url: avtovasUrl,
      header: avtovasHeaders,
      dbName: 'Avtovas',
    ),
    /*DbInfo(
      url: stepanovUrl,
      header: stepanovHeaders,
      dbName: 'Stepanov',
    ),*/
  ];

  static const jsonContentType = <String, String>{
    'Content-Type': 'application/json',
  };

  static const String yookassaApiUrl = 'https://api.yookassa.ru/v3/payments';

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
