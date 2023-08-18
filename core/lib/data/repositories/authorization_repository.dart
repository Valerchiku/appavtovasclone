import 'package:core/data/data_sources/interfaces/i_secured_storage_data_source.dart';
import 'package:core/domain/interfaces/i_authorization_repository.dart';
import 'package:rxdart/rxdart.dart';

final class AuthorizationRepository implements IAuthorizationRepository {
  final ISecuredStorageDataSource _securedStorageDataSource;

  AuthorizationRepository(this._securedStorageDataSource) {
    _checkAuthorizationStatus();
    authorize('userUuid');
  }

  final BehaviorSubject<String> _userAuthorizationSubject = BehaviorSubject();

  @override
  Stream<String> get userAuthorizationStream => _userAuthorizationSubject;

  @override
  String get userUuid =>
      _userAuthorizationSubject.hasValue ? _userAuthorizationSubject.value : '';

  @override
  bool get isAuthorized =>
      _userAuthorizationSubject.hasValue &&
      _userAuthorizationSubject.value.isNotEmpty;

  @override
  void authorize(String userUuid) {
    _securedStorageDataSource.saveEncryptedUserUuid(userUuid);
    _userAuthorizationSubject.add(userUuid);
  }

  @override
  void deAuthorize() {
    _securedStorageDataSource.saveEncryptedUserUuid('');
    _userAuthorizationSubject.add('');
  }

  Future<void> _checkAuthorizationStatus() async {
    final userUuid = await _securedStorageDataSource.getEncryptedUserUuid();

    if (userUuid != null) {
      _userAuthorizationSubject.add(userUuid);
    } else {
      _userAuthorizationSubject.add('');
    }
  }
}
