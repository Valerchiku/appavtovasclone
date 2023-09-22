import 'package:core/data/entities/lock_box/encrypted.dart';
import 'package:core/data/mappers/base_mapper.dart';

abstract final class _Fields {
  static const String rsaEncryptedKey = 'rsa_encrypt_key';
  static const String aesMode = 'aes_mode';
  static const String ivEncryptedKey = 'iv_encrypt_key';
}

final class EncryptedMapper implements BaseMapper<Encrypted> {
  @override
  Map<String, dynamic> toJson(Encrypted data) {
    return {
      _Fields.rsaEncryptedKey: data.rsaKey,
      _Fields.aesMode: data.aesMode,
      _Fields.ivEncryptedKey: data.aesMode,
    };
  }

  @override
  Encrypted fromJson(Map<String, dynamic> json) {
    return Encrypted(
      rsaKey: json[_Fields.rsaEncryptedKey],
      aesMode: json[_Fields.aesMode],
      ivKey: json[_Fields.ivEncryptedKey],
    );
  }
}
