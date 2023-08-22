import 'dart:convert';

abstract final class PrivateInfo {
  // FULL URL
  static const String fullAvtovasUrl =
      'http://1c-avtovas.avtovas.com:8088/infobase1/ws/saleport?wsdl';
  static const String fullStepanovUrl = 'http://avibus.vokzal21.ru:8081/avibus/ws/saleport?wsdl';

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
  static const String _avtovasLogin = 'mobapl';
  static const String _avtovasPassword = 'Yjd-Aht-Uhs-Cty65';
  static const String _stepanovLogin = 'mobapp';
  static const String _stepanovPassword = 'KU334t23y4';
}
