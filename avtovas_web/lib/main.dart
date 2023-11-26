import 'package:avtovas_web/firebase_options.dart';
import 'package:avtovas_web/src/common/di/injector.dart';
import 'package:avtovas_web/src/features/app/pages/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  injectDependencies();
  usePathUrlStrategy();

  runApp(const App());
}
