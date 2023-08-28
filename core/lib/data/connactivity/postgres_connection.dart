import 'package:core/avtovas_core.dart';
import 'package:core/domain/utils/core_logger.dart';
import 'package:postgres/postgres.dart';
import 'package:rxdart/rxdart.dart';

final class PostgresConnection implements IPostgresConnection {
  @override
  PostgreSQLConnection get connection => _connection;

  @override
  Stream<bool> get postgresConnectionStream => _postgresConnectionSubject;

  @override
  bool get hasConnection => _postgresConnectionSubject.value;

  PostgresConnection() {
    _connect();
  }

  @override
  Future<void> tryReconnect() {
    return _connect();
  }

  @override
  Future<void> closeConnection() async {
    await _connection.close();
    _postgresConnectionSubject.add(false);
    CoreLogger.log('Connection to PostgreSQL database closed');
  }

  late PostgreSQLConnection _connection;

  final BehaviorSubject<bool> _postgresConnectionSubject =
      BehaviorSubject.seeded(false);

  Future<void> _connect() async {
    try {
      _connection = PostgreSQLConnection(
        PrivateInfo.host,
        PrivateInfo.port,
        PrivateInfo.dbName,
        username: PrivateInfo.username,
        password: PrivateInfo.password,
        useSSL: true,
      );

      await _connection.open();
      _postgresConnectionSubject.add(true);
      CoreLogger.log('Connected to PostgreSQL database');
    } catch (e) {
      CoreLogger.log('Error connecting to PostgreSQL database: $e');
      rethrow;
    }
  }
}
