import 'package:core/data/entities/lock_box/encrypted.dart';
import 'package:core/data/entities/lock_box/local_postgres_connection.dart';

abstract interface class ILockBoxConnection {
  Stream<LocalPostgresConnection> get postgresConnectionStream;

  Stream<Encrypted> get encryptedStream;

  LocalPostgresConnection get localPostgresConnection;

  Encrypted get encrypted;
}
