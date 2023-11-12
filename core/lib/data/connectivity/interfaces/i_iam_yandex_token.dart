abstract interface class IIamYandexToken {
  Stream<String?> get iamTokenStream;

  Future<void> tryFetchToken();
}
