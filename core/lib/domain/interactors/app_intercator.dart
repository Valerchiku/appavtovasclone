import 'package:core/avtovas_core.dart';
import 'package:core/domain/interfaces/i_notifications_repository.dart';

final class AppIntercator {
  final INotificationsRepository? _notificationsRepository;
  final ILocalAuthorizationRepository _localAuthorizationRepository;
  final IUserRepository _userRepository;

  AppIntercator(
    this._localAuthorizationRepository,
    this._userRepository, [
    this._notificationsRepository,
  ]);

  User get _user => _userRepository.entity;

  String get userUuid => _localAuthorizationRepository.userUuid;

  Future<String> fetchLocalUserUuid() {
    return _localAuthorizationRepository.fetchLocalUserUuid();
  }

  Future<void> fetchUser(String userUuid) {
    return _userRepository.fetchUser(userUuid);
  }

  Future<void> saveNewFcmToken() async {
    final currentUsersFcmTokens = _user.availableFcmTokens;

    final fcmToken = await _notificationsRepository?.fetchFcmToken();

    if (fcmToken == null) return;

    if (currentUsersFcmTokens == null) {
      _userRepository.updateUser(
        _user.copyWith(availableFcmTokens: [fcmToken]),
      );
    } else {
      if (currentUsersFcmTokens.contains(fcmToken)) return;

      _userRepository.updateUser(
        _user.copyWith(
          availableFcmTokens: [
            fcmToken,
            ...currentUsersFcmTokens,
          ],
        ),
      );
    }
  }

  void saveUserLocally(String userUuid) {
    _localAuthorizationRepository.saveUserLocally(userUuid);
  }
}
