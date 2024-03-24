abstract interface class ICallerDataSource {
  Future<String> initCall(
    int phoneNumber, {
    String? expectedCode,
  });

  Future<Map<String, dynamic>> getInfo();
}
