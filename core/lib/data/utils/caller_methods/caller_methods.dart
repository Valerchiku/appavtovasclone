abstract final class CallerMethods {
  static String initCall({
    required String secretKey,
    required String serviceId,
    required int phoneNumber,
    required String uniqueV4,
    String? expectedCode,
  }) {
    return expectedCode == null
        ? 'https://api.ucaller.ru/v1.0/initCall?'
            'phone=$phoneNumber&'
            'client=$phoneNumber&'
            'unique=$uniqueV4&'
            'voice=false&'
            'key=$secretKey&service_id=$serviceId'
        : 'https://api.ucaller.ru/v1.0/initCall?'
            'phone=$phoneNumber&'
            'code=$expectedCode&'
            'client=$phoneNumber&'
            'unique=$uniqueV4&'
            'voice=false&'
            'key=$secretKey&service_id=$serviceId';
  }

  static const String getInfo = 'https://api.ucaller.ru/v1.0/getInfo';
}
