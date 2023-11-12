import 'package:core/data/connectivity/interfaces/i_lock_box_connection.dart';
import 'package:core/data/connectivity/interfaces/i_postgres_connection.dart';
import 'package:core/data/entities/lock_box/encrypted.dart';
import 'package:core/data/entities/lock_box/local_postgres_connection.dart';
import 'package:core/domain/utils/aes_mode_handler.dart';
import 'package:core/domain/utils/avtovas_encrypter.dart';
import 'package:core/domain/utils/core_logger.dart';
import 'package:postgres/postgres.dart';
import 'package:rxdart/rxdart.dart';

final class PostgresConnection implements IPostgresConnection {
  final ILockBoxConnection _lockBoxConnection;

  @override
  PostgreSQLConnection get connection => _connection;

  @override
  Stream<bool> get postgresConnectionStream => _postgresConnectionSubject;

  @override
  bool get hasConnection => _postgresConnectionSubject.value;

  @override
  String get postgresUsersTableName => _postgresUsersTableName;

  @override
  String get postgresConfigTableName => _postgresConfigTableName;

  PostgresConnection(this._lockBoxConnection) {
    _connect();
  }

  Stream<Encrypted> get _encryptedStream => _lockBoxConnection.encryptedStream;

  LocalPostgresConnection get _localPostgresConnection =>
      _lockBoxConnection.localPostgresConnection;

  @override
  Future<void> tryReconnect() {
    return _connect();
  }

  @override
  Future<void> closeConnection() async {
    await _connection.close();
    _postgresConnectionSubject.add(false);
    CoreLogger.infoLog('Connection to PostgreSQL database closed');
  }

  late PostgreSQLConnection _connection;

  final BehaviorSubject<bool> _postgresConnectionSubject =
      BehaviorSubject.seeded(false);

  String _postgresUsersTableName = '';

  String _postgresConfigTableName = '';

  Future<void> _connect() async {
    _encryptedStream.listen(
      (encrypted) async {
        _postgresUsersTableName = _localPostgresConnection.tableNames.first;
        _postgresConfigTableName = _localPostgresConnection.tableNames.last;

        _connection = PostgreSQLConnection(
          _localPostgresConnection.cloudHost,
          int.parse(_localPostgresConnection.cloudPort),
          _localPostgresConnection.cloudDbName,
          username: _localPostgresConnection.cloudUsername,
          password: AvtovasEncrypter.decryptedLine(
            line: _localPostgresConnection.cloudPassword,
            rsaKey: encrypted.rsaKey,
            ivKey: encrypted.ivKey,
            aesMode: AesModeHandler.aesModeFromString(encrypted.aesMode),
          ),
          useSSL: true,
        );

        try {
          await _connection.open();
          _postgresConnectionSubject.add(true);
          CoreLogger.infoLog('Connected to PostgreSQL database');
        } catch (e) {
          CoreLogger.infoLog('Error connecting to PostgreSQL database: $e');
          rethrow;
        }
      },
    );
  }
}
