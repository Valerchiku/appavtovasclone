abstract interface class ICallerDataSource {
  Future<String> initCall(int phoneNumber, {String? expectedCode});

  Future<String> sendSms(int phoneNumber, {String? expectedCode});

  Future<Map<String, dynamic>> getInfo();
}
