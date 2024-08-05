import 'dart:convert';

import 'package:core/avtovas_core.dart';
import 'package:core/data/utils/sql_support/sql_fields.dart';
import 'package:core/data/utils/sql_support/sql_requests.dart';
import 'package:core/domain/utils/core_logger.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

final class PostgresUserDataSource implements IRemoteUserDataSource {
  PostgresUserDataSource();

  final BehaviorSubject<User> _userSubject = BehaviorSubject.seeded(
    const User.unauthorized(),
  );

  @override
  Stream<User> get userStream => _userSubject;

  @override
  User get userEntity => _userSubject.value;

  @override
  String get userEmail => userEntity.emails![0];

  @override
  Future<void> addUser(User user) async {
    try {
      final iamResponse = await http.get(
        Uri.parse(PrivateInfo.iamTokenEndpoint),
      );

      final iamToken = (jsonDecode(iamResponse.body)
          as Map<String, dynamic>)['access_token'];

      final response = await http.post(
        Uri.parse(PrivateInfo.addUserSqlRequestEndpoint),
        headers: PrivateInfo.apiAuthorizationHeaders(iamToken),
        body: jsonEncode({'params': UserMapper().toJson(user)}),
      );

      if (response.statusCode == 200) {
        _userSubject.add(user);

        CoreLogger.infoLog('Query was sent successfully');
      }
    } catch (e) {
      CoreLogger.errorLog(
        'Error user adding',
        params: {'Exception params': e},
      );
    }
  }

  @override
  Future<User> fetchUser(String userUuid) async {
    try {
      final iamResponse = await http.get(
        Uri.parse(PrivateInfo.iamTokenEndpoint),
      );

      final iamToken = (jsonDecode(iamResponse.body)
          as Map<String, dynamic>)['access_token'];

      final userResponse = await http.post(
        Uri.parse(PrivateInfo.userFetchingEndpoint),
        headers: PrivateInfo.apiAuthorizationHeaders(iamToken),
        body: jsonEncode(SQLFields.uuidBodyEndpoint(userUuid)),
      );

      print(userResponse.body);

      final responseJson =
          (jsonDecode(userResponse.body) as List<dynamic>).firstOrNull;

      if (responseJson == null) {
        throw Exception('User with uid $userUuid not found');
      }

      final user = UserMapper().fromJson(responseJson);

      _userSubject.add(user);

      CoreLogger.infoLog('Successful user fetching');

      return user;
    } catch (e) {
      CoreLogger.errorLog(
        'Error on user fetch',
        params: {'Exception params': e},
      );

      return const User.unfounded();
    }
  }

  @override
  Future<User> fetchUserByPhone(String phoneNumber) async {
    try {
      final iamResponse = await http.get(
        Uri.parse(PrivateInfo.iamTokenEndpoint),
      );

      final iamToken = (jsonDecode(iamResponse.body)
          as Map<String, dynamic>)['access_token'];

      final userResponse = await http.post(
        Uri.parse(PrivateInfo.userFetchingEndpoint),
        headers: PrivateInfo.apiAuthorizationHeaders(iamToken),
        body: jsonEncode(SQLFields.phoneBodyEndpoint(phoneNumber)),
      );

      print(userResponse.body);

      final responseJson =
          (jsonDecode(userResponse.body) as List<dynamic>).firstOrNull;

      if (responseJson == null) {
        throw Exception('User with phone $phoneNumber not found');
      }

      final user = UserMapper().fromJson(responseJson);

      _userSubject.add(user);

      CoreLogger.infoLog('Successful user fetching');

      return user;
    } catch (e, sT) {

      print(sT);

      CoreLogger.errorLog(
        'Error on user fetch',
        params: {'Exception params': e},
      );

      return const User.unfounded();
    }
  }

  @override
  Future<void> updateUser(User user) async {
    try {
      final iamResponse = await http.get(
        Uri.parse(PrivateInfo.iamTokenEndpoint),
      );

      final iamToken = (jsonDecode(iamResponse.body)
          as Map<String, dynamic>)['access_token'];

      final response = await http.post(
        Uri.parse(PrivateInfo.updateUserSqlRequestEndpoint),
        headers: PrivateInfo.apiAuthorizationHeaders(iamToken),
        body: jsonEncode({'params': UserMapper().toJson(user)}),
      );

      if (response.statusCode == 200) {
        _userSubject.add(user);

        CoreLogger.infoLog('Query was sent successfully');
      }
    } catch (e) {
      CoreLogger.errorLog(
        'Error user updating',
        params: {'Exception params': e},
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
