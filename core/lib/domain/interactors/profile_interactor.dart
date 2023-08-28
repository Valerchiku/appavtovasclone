import 'package:core/domain/entities/app_entities/user.dart';
import 'package:core/domain/interfaces/i_local_authorization_repository.dart';
import 'package:core/domain/interfaces/i_user_repository.dart';

final class ProfileInteractor {
  final IUserRepository _userRepository;
  final ILocalAuthorizationRepository _localAuthorizationRepository;

  ProfileInteractor(
    this._userRepository,
    this._localAuthorizationRepository,
  );

  Stream<User> get userStream => _userRepository.entityStream;

  bool get isAuth =>
      _userRepository.entity.uuid != '-1' && _userRepository.entity.uuid != '0';

  void deAuthorize() {
    _localAuthorizationRepository.removeUserLocally();
    _userRepository.clearUser();
  }
}
