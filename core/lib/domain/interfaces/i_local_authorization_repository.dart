abstract interface class ILocalAuthorizationRepository {
  Stream<String> get userAuthorizationStream;

  String get userUuid;

  void saveUserLocally(String encryptedUuid);

  void removeUserLocally();

  Future<void> checkSavedUser();
}
