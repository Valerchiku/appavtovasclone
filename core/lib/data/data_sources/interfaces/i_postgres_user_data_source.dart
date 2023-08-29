import 'package:core/domain/entities/app_entities/user.dart';

abstract interface class IPostgresUserDataSource {
  Stream<User> get userStream;

  User get userEntity;

  Stream<bool> get remoteConnectionStream;

  Future<void> addUser(User user);

  Future<User> fetchUser(String userUuid);

  Future<User> fetchUserByPhone(String phoneNumber);

  Future<void> updateUser(String userUuid, User user);

  void clearUser();
}
