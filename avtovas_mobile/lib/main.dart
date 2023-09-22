import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:avtovas_mobile/src/features/app/pages/app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  injectDependencies();

  runApp(const App());
}

/*Uint8List encryptWithPublicKey(RSAPublicKey publicKey, Uint8List data) {
  final encryptor = OAEPEncoding(RSAEngine())
    ..init(true, PublicKeyParameter<RSAPublicKey>(publicKey));
  return encryptor.process(data);
}

Uint8List decryptWithPrivateKey(RSAPrivateKey privateKey, Uint8List encryptedData) {
  final decryptor = OAEPEncoding(RSAEngine())
    ..init(false, PrivateKeyParameter<RSAPrivateKey>(privateKey));
  return decryptor.process(encryptedData);
}*/
