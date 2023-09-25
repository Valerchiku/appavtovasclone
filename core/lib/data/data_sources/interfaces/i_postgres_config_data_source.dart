abstract interface class IPostgresConfigDataSource {
  Stream<Map<String, String>> get configStream;

  Map<String, String> get config;

  Map<String, String> get yookassaConfig;
}
