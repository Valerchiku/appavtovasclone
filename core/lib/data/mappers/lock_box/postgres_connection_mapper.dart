import 'package:core/data/entities/lock_box/local_postgres_connection.dart';
import 'package:core/data/mappers/base_mapper.dart';

abstract final class _Fields {
  static const String cloudHost = 'cloud_host';
  static const String cloudPort = 'cloud_port';
  static const String cloudUsername = 'cloud_username';
  static const String cloudPassword = 'cloud_password';
  static const String cloudDbName = 'cloud_db_name';
  static const String tableNames = 'cloud_table_names';
}

final class PostgresConnectionMapper
    implements BaseMapper<LocalPostgresConnection> {
  @override
  Map<String, dynamic> toJson(LocalPostgresConnection data) {
    return {
      _Fields.cloudHost: data.cloudHost,
      _Fields.cloudPort: data.cloudPort,
      _Fields.cloudUsername: data.cloudUsername,
      _Fields.cloudPassword: data.cloudPassword,
      _Fields.cloudDbName: data.cloudDbName,
      _Fields.tableNames: data.tableNames,
    };
  }

  @override
  LocalPostgresConnection fromJson(Map<String, dynamic> json) {
    return LocalPostgresConnection(
      cloudHost: json[_Fields.cloudHost],
      cloudPort: json[_Fields.cloudPort],
      cloudUsername: json[_Fields.cloudUsername],
      cloudPassword: json[_Fields.cloudPassword],
      cloudDbName: json[_Fields.cloudDbName],
      tableNames: json[_Fields.tableNames],
    );
  }
}
