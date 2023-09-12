extension DateTimeExt on DateTime {
  bool isEqualDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
