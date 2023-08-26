import 'package:core/domain/interfaces/i_local_authorization_repository.dart';

final class ProfileInteractor {
  final ILocalAuthorizationRepository _authorizationRepository;

  ProfileInteractor(this._authorizationRepository) {
    _authorizationRepository.checkAuthorizationStatus();
  }

  Stream<String> get userAuthorizationStream =>
      _authorizationRepository.userAuthorizationStream;

  String get userUuid => _authorizationRepository.userUuid;

  bool get isAuthorized => _authorizationRepository.isAuthorized;

  void deAuthorize() {
    _authorizationRepository.deAuthorize();
  }
}
