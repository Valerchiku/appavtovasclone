import 'package:common/avtovas_common_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore_for_file: join_return_with_assignment

extension StringExtension on String {
  /// formatHmdM - HH:mm, dd MMMM (20:00, 10 августа)
  String formatHmdM(BuildContext context, String inputDateTime) {
    final dateTime = DateTime.parse(inputDateTime);
    final formattedTime = DateFormat('HH:mm').format(dateTime);
    final formattedDate =
        DateFormat('dd MMMM', context.locale.localeName).format(dateTime);
    return '$formattedTime, $formattedDate';
  }

  String formatDuration(String duration) {
    final minutes = int.tryParse(duration) ?? 0;

    final hours = minutes ~/ 60;
    final remainingMinutes = minutes % 60;

    var formattedTime = '';
    if (hours > 0) {
      formattedTime += '$hoursч ';
    } else {
      formattedTime += '0ч ';
    }
    formattedTime += '$remainingMinutes';

    return formattedTime;
  }
}
