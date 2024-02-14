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
  
  Future<String> get userUid =>
      _localAuthorizationRepository.fetchLocalUserUuid();

  Future<String> initCall(int phoneNumber) {
    return _callerRepository.initCall(phoneNumber);
  }

  Future<void> addUser(User user) {
    final userForAdding = user.phoneNumber.contains('+')
        ? user
        : user.copyWith(
      phoneNumber: '+${user.phoneNumber}',
    );

    return _userRepository.addUser(userForAdding);
  }

  Future<User> fetchUserByPhone(String phoneNumber) {
    return _userRepository.fetchUserByPhone(phoneNumber);
  }

  void localAuthorize(String userUuid) {
    _localAuthorizationRepository.saveUserLocally(userUuid);
  }
}
