abstract interface class ISecuredStorageDataSource {
  void saveEncryptedUserUuid(String value);
  Future<String?> getEncryptedUserUuid();
}
