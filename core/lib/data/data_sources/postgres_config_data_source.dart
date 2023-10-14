import 'dart:convert';

import 'package:core/data/connectivity/interfaces/i_postgres_connection.dart';
import 'package:core/data/data_sources/interfaces/i_postgres_config_data_source.dart';
import 'package:core/data/mappers/avibus/avibus_mapper.dart';
import 'package:core/data/utils/constants/config_keys.dart';
import 'package:core/data/utils/sql_support/sql_requests.dart';
import 'package:core/domain/entities/avibus/avibus.dart';
import 'package:core/domain/utils/core_logger.dart';
import 'package:rxdart/rxdart.dart';

final class PostgresConfigDataSource implements IPostgresConfigDataSource {
  final IPostgresConnection _postgresConnection;

  PostgresConfigDataSource(this._postgresConnection) {
    _fetchConfig();
  }

  @override
  Stream<Map<String, List<String>>> get configStream => _configSubject;

  @override
  Map<String, List<String>> get config =>
      _configSubject.hasValue ? _configSubject.value : {};

  final BehaviorSubject<Map<String, List<String>>> _configSubject =
      BehaviorSubject();

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
              final configExpandedMap = <String, List<String>>{};

              for (final entry in config) {
                final configMap = entry['config'];

                configExpandedMap.addAll(
                  {configMap!['key']: configMap['values']},
                );
              }

              CoreLogger.infoLog(
                'Successful config fetching',
                params: {'Config': configExpandedMap},
              );

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

  Future<void> _temporaryInsert() async {
    const avtovasModel = Avibus(
      dbName: 'AVTOVAS',
      apiUrl: 'http://1c-avtovas.avtovas.com:8088/infobase1/ws/saleport',
      apiLogin: 'mobapl',
      apiPassword: 'Yjd-Aht-Uhs-Cty65',
      inn: '2126000549',
      yookassaShopName: 'АО "АВТОВАС"',
      yookassaSdkToken: 'test_NzY5OTMxgOEfwbWp559NVT328GWyYFk--efJBtiVi1Q',
      yookassaApiToken: 'test_BCUb_u3SxG8tL0LfN6TWcVUPixbJ1HXVoGysivRBVUY',
      yookassaShopId: '769931',
      serviceDescription: 'Онлайн билет',
      clientPhoneNumber: '79000000000',
      clientEmail: 'aoavtovas@mail.ru',
      smptPassword: 'FHqmv4zbnXYsvPa2yV8S',
      enabled: true,
    );

    final jsonList = [avtovasModel];

    final query = SQLRequests.insertInto(
      tableName: 'config',
      fieldsMap: {
        'key': "'clients_data'",
        'values': 'ARRAY ${jsonList.map(
              (e) => "'${jsonEncode(
                AvibusMapper().toJson(e),
              )}'",
            ).toList()}',
      },
    );

    print(query);

    final sqlQuery = _postgresConnection.connection.query(query);
  }
}
