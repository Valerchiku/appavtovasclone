import 'dart:async';

import 'package:avtovas_mobile/background_notification_handler.dart';
import 'package:avtovas_mobile/firebase_options.dart';
import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:avtovas_mobile/src/features/app/pages/app.dart';
import 'package:core/avtovas_platform.dart';
import 'package:core/avtovas_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  runZonedGuarded(
    () async {
      final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      await AppInfoClient.initializeInstance();

      await FirebaseMessaging.instance.requestPermission();
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );

      await FirebaseMessaging.instance.setAutoInitEnabled(false);

      FirebaseMessaging.onBackgroundMessage(onNewBackgroundNotification);
      FirebaseMessaging.onMessage.listen((event) {});

      injectDependencies();

      runApp(const App());
    },
    (error, stackTrace) {
      CrashlyticsService().sendCrashlytics(
        error: error.toString(),
        stackTrace: stackTrace.toString(),
        errorPlace: stackTrace.toString(),
      );
    },
  );
}
