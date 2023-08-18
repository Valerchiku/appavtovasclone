import 'package:core/data/data_sources/interfaces/i_secured_storage_data_source.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final class SecuredStorageDataSource implements ISecuredStorageDataSource {
  final FlutterSecureStorage _securedStorage;

  SecuredStorageDataSource(this._securedStorage);

  @override
  void saveEncryptedUserUuid(String value) => _writeToStorage(
        key: _Keys.userIdKey,
        value: value,
      );

  @override
  Future<String?> getEncryptedUserUuid() => _readFromStorage(
        key: _Keys.userIdKey,
      );

  Future<String?> _readFromStorage({required String key}) {
    return _securedStorage.read(
      key: key,
      aOptions: _securedStorage.aOptions,
      iOptions: _securedStorage.iOptions,
      webOptions: _securedStorage.webOptions,
    );
  }

  void _writeToStorage({required String key, required String value}) {
    _securedStorage.write(
      key: key,
      value: value,
      aOptions: _securedStorage.aOptions,
      iOptions: _securedStorage.iOptions,
      webOptions: _securedStorage.webOptions,
    );
  }
}

abstract final class _Keys {
  static const String userIdKey = 'user_id_key';
}
