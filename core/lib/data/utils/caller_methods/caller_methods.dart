abstract final class CallerParams {
  static Map<String, dynamic> initCallParams({
    required int phoneNumber,
    required String uniqueV4,
  }) {
    return {
      'phoneNumber': phoneNumber,
      'uniqueV4': uniqueV4,
    };
  }
}
