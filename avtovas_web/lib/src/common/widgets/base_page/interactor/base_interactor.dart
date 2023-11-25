import 'package:core/avtovas_core.dart';

final class BaseInteractor {
  final IUserRepository _userRepository;

  const BaseInteractor(this._userRepository);

  Stream<User> get userStream => _userRepository.entityStream;
}
