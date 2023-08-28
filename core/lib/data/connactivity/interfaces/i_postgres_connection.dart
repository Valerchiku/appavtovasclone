import 'package:postgres/postgres.dart';

abstract interface class IPostgresConnection {
  PostgreSQLConnection get connection;

  Stream<bool> get postgresConnectionStream;

  bool get hasConnection;

  Future<void> tryReconnect();

  Future<void> closeConnection();
}
