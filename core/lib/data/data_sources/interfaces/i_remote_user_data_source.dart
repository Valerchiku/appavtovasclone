import 'package:core/domain/entities/app_entities/user.dart';

abstract interface class IRemoteUserDataSource {
  Stream<User> get userStream;

  User get userEntity;

  String get userEmail;

  Future<void> addUser(User user);

  Future<User> fetchUser(String userUuid);

  Future<User> fetchUserByPhone(String phoneNumber);

  Future<void> updateUser(User user);

  void clearUser();
}
