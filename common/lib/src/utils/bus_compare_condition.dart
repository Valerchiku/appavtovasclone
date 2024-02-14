bool basicBusStopComparator(String busStop, String comparator) {
  final busStopLowerCase = busStop.toLowerCase();

  return busStopLowerCase.contains(comparator);
}

const stationComparators = [
  ' ас',
  'автовокзал ',
  ' ав',
];

const cityComparators = <String>[
  'казань ',
  'ульяновск ',
  'алатырь ',
  'йошкар-ола',
  'новочебоксарск',
  'чебоксары ',
];
