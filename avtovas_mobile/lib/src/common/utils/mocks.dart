import 'package:common/avtovas_common.dart';

// ignore_for_file: avoid-non-ascii-symbols

abstract final class Mocks {
  static const trip = MockTrip(
    ticketPrice: '1200,00 руб',
    tripNumber: 'Рейс №567',
    freePlaces: '5',
    tripRoot: '?',
    timeInRoad: '12ч 23 мин.',
    departurePlace: 'Алатырь',
    departureAddress:
        'Автовокзал "Щелковский", метро Щелковская; шоссе Щелковское; дом 75',
    arrivalPlace: 'Ардатов',
    arrivalAddress: 'Автовокзал "Пригородный", улица Привокзальная; дом 3',
    departureTime: '12:14',
    departureDate: '8 июня',
    arrivalTime: '15:45',
    arrivalDate: '8 июня',
    waypoints: [
      '12:00, Новороссийское шоссе, 1Б',
      '12:00, Новороссийское шоссе, 1Б',
      '12:00, Новороссийское шоссе, 1Б',
      '12:00, Новороссийское шоссе, 1Б',
      '12:00, Новороссийское шоссе, 1Б',
    ],
    carrier: 'ООО "НАДЕЖДА"',
    transport: 'Неоплан (55), е444ав161',
  );

  static const routes = [
    'Чебоксары',
    'Новочебоксарск',
    'Алатырь',
    'Канаш',
    'Козловка',
    'Мариинский Посад',
    'Цивильск',
    'Шумерля',
    'Ядрин',
  ];

  static const passengers = <MockPassenger>[
    MockPassenger(
      fullName: 'Кузьмин Юстин Мэлсович',
      seatOnTheBus: '19',
    ),
    MockPassenger(
      fullName: 'Третьяков Мирослав Геннадьевич',
      seatOnTheBus: '21',
    ),
    MockPassenger(
      fullName: 'Юдин Нелли Богуславович',
      seatOnTheBus: '26',
    ),
  ];

  static const booking = MockBooking(
    orderNumber: 'Заказ №1234',
    bookingTimer: 3,
  );
}
