import 'dart:async';
import 'dart:convert';

import 'package:core/data/connectivity/interfaces/i_iam_yandex_token.dart';
import 'package:core/data/connectivity/interfaces/i_lock_box_connection.dart';
import 'package:core/data/entities/lock_box/encrypted.dart';
import 'package:core/data/entities/lock_box/local_postgres_connection.dart';
import 'package:core/data/mappers/lock_box/encrypted_mapper.dart';
import 'package:core/data/mappers/lock_box/postgres_connection_mapper.dart';
import 'package:core/data/utils/constants/private_info.dart';
import 'package:core/domain/utils/core_logger.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

final class FireStoreLockBoxConnection implements ILockBoxConnection {
  FireStoreLockBoxConnection();

  final BehaviorSubject<LocalPostgresConnection> _postgresConnectionSubject =
      BehaviorSubject();

  final BehaviorSubject<Encrypted> _encryptedSubject = BehaviorSubject();

  @override
  Stream<LocalPostgresConnection> get postgresConnectionStream =>
      _postgresConnectionSubject;

  @override
  Stream<Encrypted> get encryptedStream => _encryptedSubject;

  @override
  Encrypted get encrypted =>
      _encryptedSubject.hasValue ? _encryptedSubject.value : throw Exception();

  @override
  LocalPostgresConnection get localPostgresConnection =>
      _postgresConnectionSubject.hasValue
          ? _postgresConnectionSubject.value
          : throw Exception();

  Future<void> _fetchLockBox(String iamToken) {
    return http.get(
      Uri.parse(PrivateInfo.lockBoxUrl),
      headers: {
        ...PrivateInfo.lockBoxHeaders(iamToken),
      },
    ).then(
      (response) {
        if (response.statusCode == 200) {
          final lockBoxMap = <String, dynamic>{};

          final jsonData = (json.decode(response.body)
              as Map<String, dynamic>)['entries'] as List<dynamic>;

          for (final Map<String, dynamic> data in jsonData) {
            if (data.containsValue('cloud_table_names')) {
              lockBoxMap.addAll(
                {data['key']: data['textValue'].toString().split(', ')},
              );
            } else {
              lockBoxMap.addAll({data['key']: data['textValue']});
            }
          }

          _postgresConnectionSubject.add(
            PostgresConnectionMapper().fromJson(lockBoxMap),
          );

          _encryptedSubject.add(
            EncryptedMapper().fromJson(lockBoxMap),
          );
        } else {
          CoreLogger.errorLog(
            'Error receiving IAM token (statusCode != 200)',
            params: {
              'status code': response.statusCode,
              'response body': response.body,
            },
          );
        }
      },
    ).catchError(
      (value) {
        CoreLogger.errorLog(
          'Error receiving IAM token (Future catchError)',
          params: {
            'dynamic value': value,
          },
        );
      },
    );
  }
}
