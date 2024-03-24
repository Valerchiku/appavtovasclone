abstract interface class ICallerRepository {
  Future<String> initCall(
    int phoneNumber, {
    String? expectedCode,
  });

  Future<Map<String, dynamic>> getInfo();
}
