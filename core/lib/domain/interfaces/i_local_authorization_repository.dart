abstract interface class ILocalAuthorizationRepository {
  Stream<String> get userAuthorizationStream;

  String get userUuid;

  Future<String> fetchLocalUserUuid();

  void saveUserLocally(String encryptedUuid);

  void removeUserLocally();
}
