bool busStationCompareCondition(String busStop) {
  final busStopLowerCase = busStop.toLowerCase();

  return busStopLowerCase.contains('ав') ||
      busStopLowerCase.contains('автовокзал');
}

bool busCityCompareCondition(String busStop) {
  final busStopLowerCase = busStop.toLowerCase();

  return busStopLowerCase.contains('чебоксар') ||
      busStopLowerCase.contains('казан') ||
      busStopLowerCase.contains('ульяновск центральный');
}
