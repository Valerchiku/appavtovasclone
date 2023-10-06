import 'package:encrypt/encrypt.dart' as e;

abstract final class AvtovasEncrypter {
  static String encryptedLine({
    required String line,
    required String rsaKey,
    required String ivKey,
    required e.AESMode aesMode,
  }) {
    final rsaEncryptedKey = e.Key.fromUtf8(rsaKey);
    final ivEncryptedKey = e.IV.fromUtf8(ivKey);

    final aesEncryptedData = e.Encrypter(e.AES(rsaEncryptedKey, mode: aesMode));
    return aesEncryptedData.encrypt(line, iv: ivEncryptedKey).base64;
  }

  static String decryptedLine({
    required String line,
    required String rsaKey,
    required String ivKey,
    required e.AESMode aesMode,
  }) {
    final rsaEncryptedKey = e.Key.fromUtf8(rsaKey);
    final ivEncryptedKey = e.IV.fromUtf8(ivKey);

    final aesDecryptedData = e.Encrypter(e.AES(rsaEncryptedKey, mode: aesMode));
    return aesDecryptedData.decrypt(
      e.Encrypted.fromBase64(line),
      iv: ivEncryptedKey,
    );
  }
}
