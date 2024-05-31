abstract interface class ICallerRepository {
  Future<String> initCall(
    int phoneNumber, {
    String? expectedCode,
  });

  Future<String> sendSms(int phoneNumber, {String? expectedCode});

  Future<Map<String, dynamic>> getInfo();
}
