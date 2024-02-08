// ignore_for_file: flutter_style_todos

import 'dart:io';

import 'package:common/avtovas_common.dart';
import 'package:core/data/utils/constants/private_info.dart';
import 'package:core/domain/utils/core_logger.dart';
import 'package:intl/intl.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

abstract final class MailSender {
  // ignore: public_member_api_docs, always_declare_return_types, type_annotate_public_apis
  static bookingConfirmation({
    required String recipients,
    required String filePath,
    // TODO: ↓ Replace this with real data ↓
    required String fullName,
    required String departureDate,
    required String departureStation,
    required String arrivalStation,
    required List<String> seats,
    // TODO: ↑ Replace this with real data ↑
  }) async {
    final todayFormat = DateFormat('dd.MM.yyyy HH:mm');
    final todayDate = DateTime.now();

    // SMTP server settings for sending mail
    final smtpServer = SmtpServer(
      PrivateInfo.smtpUrl,
      username: PrivateInfo.smtpEmail,
      password: PrivateInfo.smtpPassword,
    );

    // Creating message
    final message = Message()
      ..from = const Address(PrivateInfo.smtpEmail, 'AO AVTOVAS')
      ..recipients.add(recipients)
      ..subject = 'Уведомление от Автовас ${todayFormat.format(todayDate)}'
      ..attachments = [
        FileAttachment(
          File(filePath),
        ),
      ]
      // Email Design in HTML
      ..html = EmailTemplates.bookingConfirmation(
        fullName: fullName,
        departureDate: departureDate,
        departureStation: departureStation,
        arrivalStation: arrivalStation,
      );

    try {
      final sendReport = await send(message, smtpServer);
      CoreLogger.infoLog('Message sent: $sendReport');
    } on MailerException catch (e) {
      for (final p in e.problems) {
        CoreLogger.errorLog(
          'Message not sent.',
          params: {'Problem': '${p.code}: ${p.msg}'},
        );
      }
    }
  }

  static askQuestion({
    required String fullName,
    required String userEmail,
    required String userPhoneNumber,
    required String userQuestion,
  }) async {
    final todayFormat = DateFormat('dd.MM.yyyy HH:mm');
    final todayDate = DateTime.now();

    // SMTP server settings for sending mail
    // final smtpServer = SimpleMailer(
    //   PrivateInfo.smtpUrl,
    //   username: PrivateInfo.smtpEmail,
    //   password: PrivateInfo.smtpEmail,
    // );
    final smtpServer = SmtpServer(
      PrivateInfo.smtpUrl,
      port: 465,
      username: PrivateInfo.smtpEmail,
      password: PrivateInfo.smtpPassword,
      ssl: true,
      allowInsecure: true,
      ignoreBadCertificate: true,
    );

    // Creating message
    final message = Message()
      ..headers = {
        "Access-Control-Allow-Origin": "https://avtovas.ru",
        "Access-Control-Allow-Methods": "*",
        "Access-Control-Allow-Headers": "*"
      }
      ..from = const Address(PrivateInfo.smtpEmail, 'AO AVTOVAS')
      ..recipients.add('tasm86688@gmail.com')
      // ..recipients.add('it@avtovas.ru')
      ..subject = 'Вопрос от пользователя ${todayFormat.format(todayDate)}'

      // Email Design in HTML
      ..html = EmailTemplates.askQuestion(
        fullName: fullName,
        userEmail: userEmail,
        userPhoneNumber: userPhoneNumber,
        userQuestion: userQuestion,
      );

    try {
      final sendReport = await send(message, smtpServer);
      CoreLogger.infoLog('Message sent: $sendReport');
    } on MailerException catch (e) {
      for (final p in e.problems) {
        CoreLogger.errorLog(
          'Message not sent.',
          params: {'Problem': '${p.code}: ${p.msg}'},
        );
      }
    }
  }
}
