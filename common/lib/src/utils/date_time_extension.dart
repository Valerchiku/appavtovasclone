import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore_for_file: join_return_with_assignment

extension DateTimeExtension on DateTime {
  String yMMMdFormat() => DateFormat.yMMMd().format(this);

  /// formatDME - dd MM , EEE (10 авг.,ср)
  String formatDME(BuildContext context) {
    return DateFormat('dd MMM, EEE', context.locale.localeName).format(this);
  }

  // requestDateFormat - YYYY-MM-DD (2023-08-10)
  String requestDateFormat() {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  DateTime leaveDateOnly() {
    return DateTime(year, month, day);
  }

  bool isSame(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
