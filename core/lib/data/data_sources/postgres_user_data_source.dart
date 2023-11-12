import 'package:core/data/connectivity/interfaces/i_postgres_connection.dart';
import 'package:core/data/data_sources/interfaces/i_remote_user_data_source.dart';
import 'package:core/data/mappers/app/user_mapper.dart';
import 'package:core/data/utils/sql_support/sql_fields.dart';
import 'package:core/data/utils/sql_support/sql_requests.dart';
import 'package:core/domain/entities/app_entities/user.dart';
import 'package:core/domain/utils/core_logger.dart';
import 'package:rxdart/rxdart.dart';

final class PostgresUserDataSource implements IRemoteUserDataSource {
  final IPostgresConnection _postgresConnection;

  PostgresUserDataSource(
    this._postgresConnection,
  );

  final BehaviorSubject<User> _userSubject = BehaviorSubject.seeded(
    const User.unauthorized(),
  );

  @override
  Stream<User> get userStream => _userSubject;

  @override
  User get userEntity => _userSubject.value;

  @override
  Stream<bool> get remoteConnectionStream =>
      _postgresConnection.postgresConnectionStream;

  String get _postgresUsersTableName =>
      _postgresConnection.postgresUsersTableName;

  @override
  Future<void> addUser(User user) async {
    if (_postgresConnection.hasConnection) {
      final userForAdding = user.phoneNumber.contains('+')
          ? user
          : user.copyWith(
              phoneNumber: '+${user.phoneNumber}',
            );

      final query = SQLRequests.insertInto(
        tableName: _postgresUsersTableName,
        fieldsMap: SQLFields.addUserFields(userForAdding),
      );

      final queryResult = await _postgresConnection.connection.query(query);

      _userSubject.add(userForAdding);

      CoreLogger.infoLog(
        'Query was sent successfully',
        params: {
          'Result query': queryResult,
        },
      );
    } else {
      CoreLogger.infoLog(
        'No have connection to Postgres',
        params: {'User for adding': user},
      );
    }
  }

  @override
  Future<User> fetchUser(String userUuid) async {
    if (_postgresConnection.hasConnection) {
      final query = SQLRequests.selectSingle(
        tableName: _postgresUsersTableName,
        fieldsMap: SQLFields.selectUserByIdFields(userUuid),
      );

      final queryResult =
          await _postgresConnection.connection.mappedResultsQuery(query);

      if (queryResult.isEmpty) {
        CoreLogger.infoLog(
          'User with this uuid ($userUuid) was not found',
          params: {
            'Result query': queryResult,
          },
        );

        return const User.unfounded();
      } else {
        final user = UserMapper().fromJson(
          queryResult.first['users']!,
          fromPostgres: true,
        );

        CoreLogger.infoLog(
          'Query was sent successfully',
          params: {
            'Result query': queryResult,
          },
        );

        _userSubject.add(user);

        return user;
      }
    } else {
      CoreLogger.infoLog(
        'No have connection to Postgres',
        params: {'Uuid for select': userUuid},
      );

      return const User.unauthorized();
    }
  }

  @override
  Future<User> fetchUserByPhone(String phoneNumber) async {
    if (_postgresConnection.hasConnection) {
      final query = SQLRequests.selectSingle(
        tableName: _postgresUsersTableName,
        fieldsMap: SQLFields.selectUserByPhoneFields(phoneNumber),
      );

      final queryResult =
          await _postgresConnection.connection.mappedResultsQuery(query);

      if (queryResult.isEmpty) {
        CoreLogger.infoLog(
          'User with this phone ($phoneNumber) was not found',
          params: {
            'Result query': queryResult,
          },
        );

        return const User.unfounded();
      } else {
        final user = UserMapper().fromJson(
          queryResult.first['users']!,
          fromPostgres: true,
        );

        _userSubject.add(user);

        CoreLogger.infoLog(
          'Query was sent successfully',
          params: {
            'Result query': queryResult,
          },
        );

        return user;
      }
    } else {
      CoreLogger.infoLog(
        'No have connection to Postgres',
        params: {'Phone for select': phoneNumber},
      );

      return const User.unauthorized();
    }
  }

  @override
  Future<void> updateUser(User user) async {
    if (_postgresConnection.hasConnection) {
      final query = SQLRequests.updateSingle(
        tableName: _postgresUsersTableName,
        fieldsMap: SQLFields.addUserFields(user),
        uniqueMap: SQLFields.selectUserByIdFields(user.uuid),
      );

      final queryResult =
          _postgresConnection.connection.mappedResultsQuery(query);

      _userSubject.add(user);

      CoreLogger.infoLog(
        'Update query was sent successfully',
        params: {'Result query': queryResult},
      );
    } else {
      CoreLogger.infoLog(
        'No have connection to Postgres',
        params: {'User param': user},
      );
    }
  }

  @override
  void clearUser() {
    _userSubject.add(
      const User.unauthorized(),
    );
  }
}
