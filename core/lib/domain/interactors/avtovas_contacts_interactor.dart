import 'package:core/domain/entities/app_entities/user.dart';
import 'package:core/domain/interfaces/i_mailer_repository.dart';
import 'package:core/domain/interfaces/i_user_repository.dart';

final class AvtovasContactsInteractor {
  final IMailerRepository _mailerRepository;
  final IUserRepository _userRepository;

  AvtovasContactsInteractor(
    this._mailerRepository,
    this._userRepository,
  );

  User get _user => _userRepository.entity;

  bool get _isAuth => _user.uuid != '0' && _user.uuid != '-1';

  Future<void> sendMail({
    required String userName,
    required String mailAddress,
    required String phoneNumber,
    required String message,
  }) async {
    final userPhoneNumber = _user.phoneNumber;

    final authorizationStatus = _isAuth
        ? 'Обращение от авторизованного пользователя '
            '(моб. телефон пользователя - $userPhoneNumber)'
        : 'Обращение от неавторизованного пользователя';

    final updatedMessage = '$authorizationStatus.\n\n'
        'Контактная информация:\n\n'
        '$userName (E-mail в обращении - $mailAddress, '
        'моб. телефон в обращении - $phoneNumber)\n\n'
        'Сообщение: $message';

    return _mailerRepository.sendSupportMail(
      userName: userName,
      message: updatedMessage,
    );
  }
}
