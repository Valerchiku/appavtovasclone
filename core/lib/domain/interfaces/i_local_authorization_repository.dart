abstract interface class ILocalAuthorizationRepository {
  Stream<String> get userAuthorizationStream;

  String get userUuid;

  bool get isAuthorized;

  void authorize(String encryptedUuid);

  void deAuthorize();

  Future<void> checkAuthorizationStatus();
}
