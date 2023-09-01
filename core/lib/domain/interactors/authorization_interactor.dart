import 'package:core/avtovas_core.dart';

final class AuthorizationInteractor {
  final ILocalAuthorizationRepository _localAuthorizationRepository;
  final ICallerRepository _callerRepository;
  final IUserRepository _userRepository;

  AuthorizationInteractor(
    this._localAuthorizationRepository,
    this._callerRepository,
    this._userRepository,
  );

  Future<String> initCall(int phoneNumber) {
    return _callerRepository.initCall(phoneNumber);
  }

  Future<void> addUser(User user) {
    return _userRepository.addUser(user);
  }

  Future<User> fetchUserByPhone(String phoneNumber) {
    return _userRepository.fetchUserByPhone(phoneNumber);
  }

  void localAuthorize(String userUuid) {
    _localAuthorizationRepository.saveUserLocally(userUuid);
  }
}
