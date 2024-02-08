import 'package:core/data/data_sources/interfaces/i_remote_user_data_source.dart';
import 'package:core/domain/entities/app_entities/user.dart';
import 'package:core/domain/interfaces/i_user_repository.dart';

final class UserRepository implements IUserRepository {
  final IRemoteUserDataSource _postgresUserDataSource;

  UserRepository(this._postgresUserDataSource);

  @override
  Stream<User> get entityStream => _postgresUserDataSource.userStream;

  @override
  User get entity => _postgresUserDataSource.userEntity;

  @override
  String get userEmail => entity.emails!.first;

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
  Future<void> updateUser(User user) {
    return _postgresUserDataSource.updateUser(user);
  }

  @override
  void clearUser() {
    _postgresUserDataSource.clearUser();
  }
}
