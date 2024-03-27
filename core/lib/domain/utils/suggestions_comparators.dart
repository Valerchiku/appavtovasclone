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

const destinations = [
  'Чебоксары Центральный АВ',
  'Чебоксары Пригородный АВ',
  'Алатырь ДКП',
  'Аликово с. ДКП',
  'Батырево с. ДКП',
  'Вурнары п. ДКП',
  'Ибреси п. ДКП',
  'Комсомольское с. ДКП',
  'Красные Четаи с. ДКП',
  'Новочебоксарск г. ДКП',
  'Урмары п. ДКП',
  'Шемурша с. ДКП',
  'Шумерля г. ДКП',
  'Ядрин г. ДКП',
  'Яльчики с. ДКП',
  'Янтиково с. ДКП',
];
