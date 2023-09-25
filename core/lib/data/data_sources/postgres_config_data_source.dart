import 'package:core/data/connectivity/interfaces/i_postgres_connection.dart';
import 'package:core/data/data_sources/interfaces/i_postgres_config_data_source.dart';
import 'package:core/data/utils/constants/config_keys.dart';
import 'package:core/data/utils/sql_support/sql_requests.dart';
import 'package:core/domain/utils/core_logger.dart';
import 'package:rxdart/rxdart.dart';

final class PostgresConfigDataSource implements IPostgresConfigDataSource {
  final IPostgresConnection _postgresConnection;

  PostgresConfigDataSource(this._postgresConnection) {
    _fetchConfig();
  }

  @override
  Stream<Map<String, String>> get configStream => _configSubject;

  @override
  Map<String, String> get config =>
      _configSubject.hasValue ? _configSubject.value : {};

  @override
  Map<String, String> get yookassaConfig => _configSubject.hasValue
      ? {
          ConfigKeys.yookassaApplicationKey:
              config[ConfigKeys.yookassaApplicationKey]!,
          ConfigKeys.yookassaShopId: config[ConfigKeys.yookassaShopId]!,
        }
      : {};

  final BehaviorSubject<Map<String, String>> _configSubject = BehaviorSubject();

  Stream<bool> get _postgresConnectionStream =>
      _postgresConnection.postgresConnectionStream;

  String get _postgresConfigTableName =>
      _postgresConnection.postgresConfigTableName;

  Future<void> _fetchConfig() async {
    _postgresConnectionStream.listen(
      (isConnected) async {
        if (isConnected) {
          try {
            final query = SQLRequests.selectFrom(
              tableName: _postgresConfigTableName,
            );

            final config =
                await _postgresConnection.connection.mappedResultsQuery(query);

            if (config.isNotEmpty) {
              final configExpandedMap = <String, String>{};

              for (final entry in config) {
                final configMap = entry['config'];

                configExpandedMap.addAll(
                  {configMap!['key']: configMap['value']},
                );
              }

              _configSubject.add(configExpandedMap);
            } else {
              throw Exception();
            }
          } catch (e) {
            CoreLogger.errorLog(
              'Config fetching error',
              params: {'Exception': e},
            );
            rethrow;
          }
        }
      },
    );
  }
}
