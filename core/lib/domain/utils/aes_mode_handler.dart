import 'package:encrypt/encrypt.dart';

abstract final class AesModeHandler {
  static AESMode aesModeFromString(String aesMode) => switch (aesMode) {
        'cbc' => AESMode.cbc,
        'cbc64' => AESMode.cfb64,
        'ctr' => AESMode.ctr,
        _ => throw UnimplementedError(),
      };
}
