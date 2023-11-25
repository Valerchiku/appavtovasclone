import 'dart:convert';

import 'package:avtovas_web/firebase_options.dart';
import 'package:avtovas_web/src/common/di/injector.dart';
import 'package:avtovas_web/src/features/app/pages/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void sendEmail(String to, String subject, String userEmail) async {
  final String apiUrl = "http://localhost:3000/send-email";

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({"to": to, "subject": subject, "userEmail": userEmail}),
  );

  if (response.statusCode == 200) {
    print("Email sent successfully");
  } else {
    print("Failed to send email. Error: ${response.statusCode}");
  }
}

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  injectDependencies();
  sendEmail('tasm86688@gmail.com', 'TEST FLUTTER', 'test@gmail.com');
  runApp(const App());
}
