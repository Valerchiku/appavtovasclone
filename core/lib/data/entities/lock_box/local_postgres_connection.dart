import 'package:core/data/entities/api_object.dart';

class LocalPostgresConnection extends ApiObject {
  final String cloudHost;
  final String cloudPort;
  final String cloudUsername;
  final String cloudPassword;
  final String cloudDbName;
  final List<String> tableNames;

  const LocalPostgresConnection({
    required this.cloudHost,
    required this.cloudPort,
    required this.cloudUsername,
    required this.cloudPassword,
    required this.cloudDbName,
    required this.tableNames,
  });

  @override
  List<Object?> get props => [
        cloudHost,
        cloudPort,
        cloudUsername,
        cloudPassword,
        cloudDbName,
        tableNames,
      ];

  @override
  LocalPostgresConnection copyWith({
    String? cloudHost,
    String? cloudPort,
    String? cloudUsername,
    String? cloudPassword,
    String? cloudDbName,
    List<String>? tableNames,
  }) {
    return LocalPostgresConnection(
      cloudHost: cloudHost ?? this.cloudHost,
      cloudPort: cloudPort ?? this.cloudPort,
      cloudUsername: cloudUsername ?? this.cloudUsername,
      cloudPassword: cloudPassword ?? this.cloudPassword,
      cloudDbName: cloudDbName ?? this.cloudDbName,
      tableNames: tableNames ?? this.tableNames,
    );
  }
}
