import 'package:common/avtovas_common.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

abstract final class AppDateFormats {
  static String tripsScheduleFormat(
    BuildContext context,
    DateTime dateTime,
  ) {
    return DateFormat(
      'dd MMM, EEE',
      context.locale.localeName,
    ).format(dateTime);
  }
}
