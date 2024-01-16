import 'package:core/domain/entities/app_entities/user.dart';
import 'package:core/domain/interfaces/entity_repository.dart';

abstract interface class IUserRepository extends EntityRepository<User> {
  Future<void> addUser(User user);

  Future<User> fetchUser(String userUuid);

  Future<User> fetchUserByPhone(String phoneNumber);

  Future<void> updateUser(User user);

  String get userEmail;

  void clearUser();
}
