import 'package:core/data/data_sources/interfaces/i_postgres_user_data_source.dart';
import 'package:core/domain/entities/app_entities/user.dart';
import 'package:core/domain/interfaces/i_user_repository.dart';

final class UserRepository implements IUserRepository {
  final IPostgresUserDataSource _postgresUserDataSource;

  UserRepository(this._postgresUserDataSource);

  @override
  Stream<bool> get remoteConnectionStream =>
      _postgresUserDataSource.remoteConnectionStream;

  @override
  Stream<User> get entityStream => _postgresUserDataSource.userStream;

  @override
  User get entity => _postgresUserDataSource.userEntity;

  @override
  Future<void> addUser(User user) {
    return _postgresUserDataSource.addUser(user);
  }

  @override
  Future<User> fetchUser(String userUuid) {
    return _postgresUserDataSource.fetchUser(userUuid);
  }

  @override
  Future<User> fetchUserByPhone(String phoneNumber) {
    return _postgresUserDataSource.fetchUserByPhone(phoneNumber);
  }

  @override
  Future<void> updateUser(String userUuid, User user) {
    return _postgresUserDataSource.updateUser(userUuid, user);
  }

  @override
  void clearUser() {
    _postgresUserDataSource.clearUser();
  }
}
