import 'package:core/data/data_sources/interfaces/i_secured_storage_data_source.dart';
import 'package:core/domain/interfaces/i_local_authorization_repository.dart';
import 'package:rxdart/rxdart.dart';

final class LocalAuthorizationRepository
    implements ILocalAuthorizationRepository {
  final ISecuredStorageDataSource _securedStorageDataSource;

  LocalAuthorizationRepository(this._securedStorageDataSource);

  final BehaviorSubject<String> _userAuthorizationSubject = BehaviorSubject();

  @override
  Stream<String> get userAuthorizationStream => _userAuthorizationSubject;

  @override
  String get userUuid =>
      _userAuthorizationSubject.hasValue ? _userAuthorizationSubject.value : '';

  @override
  Future<String> fetchLocalUserUuid() {
    return _checkSavedUser();
  }

  @override
  void saveUserLocally(String userUuid) {
    _securedStorageDataSource.saveEncryptedUserUuid(userUuid);
    _userAuthorizationSubject.add(userUuid);
  }

  @override
  void removeUserLocally() {
    _securedStorageDataSource.saveEncryptedUserUuid('');
    _userAuthorizationSubject.add('');
  }

  Future<String> _checkSavedUser() async {
    final userUuid = await _securedStorageDataSource.getEncryptedUserUuid();

    if (userUuid != null) {
      _userAuthorizationSubject.add(userUuid);
    } else {
      _userAuthorizationSubject.add('');
    }

    return userUuid ?? '';
  }
}
