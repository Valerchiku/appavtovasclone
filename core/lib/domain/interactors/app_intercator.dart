import 'package:core/avtovas_core.dart';

final class AppIntercator {
  final ILocalAuthorizationRepository _localAuthorizationRepository;
  final IUserRepository _userRepository;

  AppIntercator(
    this._localAuthorizationRepository,
    this._userRepository,
  );

  Stream<bool> get remoteConnectionStream =>
      _userRepository.remoteConnectionStream;

  String get userUuid => _localAuthorizationRepository.userUuid;

  Future<void> fetchUser(String userUuid) {
    return _userRepository.fetchUser(userUuid);
  }

  void saveUserLocally(String userUuid) {
    _localAuthorizationRepository.saveUserLocally(userUuid);
  }
}
