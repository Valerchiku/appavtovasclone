import 'dart:convert';

abstract final class PrivateInfo {
  // URL
  static const String avtovasUrl =
      'http://1c-avtovas.avtovas.com:8088/infobase1/ws/saleport';
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
  };

  // LOGIN & PASSWORD
  // CALLER
  static const String baseConnectionUrl = 'http://api.ucaller.net/';
  static const String callerSecretKey = 'HXJcRNRTJVlDteZ233uPYiO4MjhrBnsN';
  static const String callerServiceId = '815684';

  // POSTGRES
  static const String host = 'rc1b-2eohvm8qkm13l4oa.mdb.yandexcloud.net';
  static const int port = 6432;
  static const String username = 'avtovas-main';
  static const String password = 'iMtFcEINZxK4';
  static const String dbName = 'avtovas-cloud';
  static const String usersTableName = 'users';

  // AVIBUS
  static const String _avtovasLogin = 'mobapl';
  static const String _avtovasPassword = 'Yjd-Aht-Uhs-Cty65';
  static const String _stepanovLogin = 'mobapp';
  static const String _stepanovPassword = 'KU334t23y4';
}
