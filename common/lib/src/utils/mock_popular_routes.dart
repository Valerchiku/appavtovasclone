import 'package:equatable/equatable.dart';

final class MockPopularRoutes extends Equatable {
  final String departure;
  final String arrival;
  final String price;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        departure,
        arrival,
        price,
      ];

  const MockPopularRoutes({
    required this.departure,
    required this.arrival,
    required this.price,
  });
}

abstract final class PopularRoutesMock {
  static const routeFromCheboksary = [
    MockPopularRoutes(
      departure: 'Чебоксары',
      arrival: 'Йошкар-Ола',
      price: '350',
    ),
    MockPopularRoutes(
      departure: 'Чебоксары',
      arrival: 'Казань',
      price: '650',
    ),
    MockPopularRoutes(
      departure: 'Чебоксары',
      arrival: 'Канаш',
      price: '260',
    ),
    MockPopularRoutes(
      departure: 'Чебоксары',
      arrival: 'Москва',
      price: '1250',
    ),
  ];

  static const routeToCheboksary = [
    MockPopularRoutes(
      departure: 'Йошкар-Ола',
      arrival: 'Чебоксары',
      price: '350',
    ),
    MockPopularRoutes(
      departure: 'Казань',
      arrival: 'Чебоксары',
      price: '650',
    ),
    MockPopularRoutes(
      departure: 'Канаш',
      arrival: 'Чебоксары',
      price: '260',
    ),
    MockPopularRoutes(
      departure: 'Пенза',
      arrival: 'Чебоксары',
      price: '1800',
    ),
  ];
  static const routeFromYoshkar = [
    MockPopularRoutes(
      departure: 'Йошкар-Ола',
      arrival: 'Чебоксары',
      price: '350',
    ),
    MockPopularRoutes(
      departure: 'Йошкар-Ола',
      arrival: 'Саратов',
      price: '920',
    ),
    MockPopularRoutes(
      departure: 'Йошкар-Ола',
      arrival: 'Канаш',
      price: '340',
    ),
    MockPopularRoutes(
      departure: 'Йошкар-Ола',
      arrival: 'Пенза',
      price: '1800',
    ),
  ];
  static const routeToYoshkar = [
    MockPopularRoutes(
      departure: 'Чебоксары',
      arrival: 'Йошкар-Ола',
      price: '350',
    ),
    MockPopularRoutes(
      departure: 'Казань',
      arrival: 'Йошкар-Ола',
      price: '550',
    ),
    MockPopularRoutes(
      departure: 'Канаш',
      arrival: 'Йошкар-Ола',
      price: '340',
    ),
    MockPopularRoutes(
      departure: 'Пенза',
      arrival: 'Йошкар-Ола',
      price: '1900',
    ),
  ];
}
