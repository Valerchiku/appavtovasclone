import 'package:core/data/data_sources/interfaces/i_postgres_user_data_source.dart';
import 'package:core/domain/entities/app_entities/user.dart';
import 'package:core/domain/interfaces/i_user_repository.dart';
import 'package:rxdart/rxdart.dart';

final class UserRepository implements IUserRepository {
  final IPostgresUserDataSource _postgresDataSource;

  UserRepository(this._postgresDataSource);

  @override
  Stream<bool> get remoteConnectionStream =>
      _postgresDataSource.remoteConnectionStream;

  @override
  ValueStream<User> get entityStream =>
      _postgresDataSource.userStream.shareValue();

  @override
  User get entity => entityStream.value;

  @override
  Future<void> addUser(User user) {
    return _postgresDataSource.addUser(user);
  }

  @override
  Future<User> fetchUser(String userUuid) {
    return _postgresDataSource.fetchUser(userUuid);
  }

  @override
  Future<User> fetchUserByPhone(String phoneNumber) {
    return _postgresDataSource.fetchUserByPhone(phoneNumber);
  }

  @override
  Future<void> updateUser(String userUuid, User user) {
    return _postgresDataSource.updateUser(userUuid, user);
  }
}
