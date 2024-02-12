import 'package:core/avtovas_core.dart';

final class BaseInteractor {
  final IUserRepository _userRepository;
  final ILocalAuthorizationRepository _localAuthorizationRepository;

  const BaseInteractor(
    this._userRepository,
    this._localAuthorizationRepository,
  );

  Stream<User> get userStream => _userRepository.entityStream;

  void deAuthorize() {
    _localAuthorizationRepository.removeUserLocally();
    _userRepository.clearUser();
  }
}
