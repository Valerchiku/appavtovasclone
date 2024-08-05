import 'package:core/avtovas_core.dart';

final class NotificationInteractor {
  final IUserRepository _userRepository;

  const NotificationInteractor(this._userRepository);

  User get user => _userRepository.entity;

  Future<void> addNewUserEmail({required String email}) {
    final updatedUser = user.copyWith(emails: [email]);

    return _userRepository.updateUser(updatedUser);
  }

  Future<void> updateNotificationsStatus({required bool notificationsStatus}) {
    return _userRepository.updateUser(
      user.copyWith(showNotifications: notificationsStatus),
    );
  }
}
