import 'package:common/avtovas_common_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String tripsScheduleFormat(BuildContext context) {
    return DateFormat('dd MMM, EEE', context.locale.localeName).format(this);
  }
}
