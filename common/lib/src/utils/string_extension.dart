import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore_for_file: join_return_with_assignment

extension StringExtension on String {
  /// formatHmdM - HH:mm, dd MMMM (20:00, 10 августа)
  String formatHmdM([BuildContext? context]) {
    final dateTime = DateTime.tryParse(this) ?? DateTime.now();
    final formattedTime = DateFormat('HH:mm').format(dateTime);
    final formattedDate =
        DateFormat('dd MMMM', context?.locale.localeName ?? 'ru').format(
      dateTime,
    );
    return '$formattedTime, $formattedDate';
  }

  String formatTime() {
    final dateTime = DateTime.parse(this);
    return DateFormat.Hm().format(dateTime);
  }

  String formatDay(BuildContext context) {
    final dateTime = DateTime.parse(this);
    return DateFormat('dd MMM', context.locale.localeName).format(dateTime);
  }

  String ticketDateFormat() {
    final dateTime = DateTime.parse(this);
    return DateFormat('yyyy-MM-dd HH:mm').format(dateTime);
  }

  String formatDuration() {
    final minutes = int.tryParse(this) ?? 0;

    final hours = minutes ~/ 60;
    final remainingMinutes = minutes % 60;

    var formattedTime = '';
    hours > 0 ? formattedTime += '$hoursч ' : formattedTime += '0ч ';
    formattedTime += '$remainingMinutes';

    return formattedTime;
  }

  String stringE164PhoneFormat() {
    final cleanedNumber = replaceAll(RegExp(r'\D'), '');

    if (cleanedNumber.startsWith('+')) {
      if (int.tryParse(cleanedNumber.substring(1, length)) == null) {
        return '-1';
      }

      return cleanedNumber;
    }

    if (int.tryParse(cleanedNumber) == null) return '-1';

    return '+$cleanedNumber';
  }

  int integerE164PhoneFormat() {
    final integerCleanedNumber = int.tryParse(
      replaceAll(RegExp(r'\D'), ''),
    );

    return integerCleanedNumber ?? -1;
  }

  String capitalizeFirstLetter() {
    if (isEmpty) {
      return this;
    } else {
      return '${this[0].toUpperCase()}${substring(1)}';
    }
  }

  String formatSeconds() {
    var seconds = int.parse(this);

    final minutes = seconds ~/ 60;
    seconds %= 60;

    final minutesStr = minutes.toString().padLeft(1);
    final secondsStr = seconds.toString().padLeft(2, '0');

    return '$minutesStr:$secondsStr';
  }

  String getUserFullName(
    String firstName,
    String lastName,
    String? surname,
  ) {
    if (surname == null || surname == '') {
      return '$firstName $lastName';
    }
    return '$firstName $lastName $surname';
  }
}
