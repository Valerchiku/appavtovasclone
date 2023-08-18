abstract interface class IAuthorizationRepository {
  Stream<String> get userAuthorizationStream;

  String get userUuid;

  bool get isAuthorized;

  void authorize(String encryptedUuid);

  void deAuthorize();
}
