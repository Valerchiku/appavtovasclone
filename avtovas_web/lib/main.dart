import 'package:avtovas_web/src/common/di/injector.dart';
import 'package:avtovas_web/src/features/app/pages/app.dart';
import 'package:flutter/material.dart';

void main() {
  injectDependencies();
  
  runApp(const App());
}
