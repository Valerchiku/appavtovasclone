

import 'package:postgres/postgres.dart';

abstract interface class IMobilePostgresConnection {
  PostgreSQLConnection get connection;

  Stream<bool> get postgresConnectionStream;

  bool get hasConnection;

  String get postgresUsersTableName;
  String get postgresConfigTableName;

  Future<void> tryReconnect();

  Future<void> closeConnection();
}
