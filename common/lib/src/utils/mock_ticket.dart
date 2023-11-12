import 'package:equatable/equatable.dart';

final class MockTicket extends Equatable {
  final String receiptID;
  final String flightNumber;
  final String date;
  final List<MockTicketPassenger> passengers;
  final String flight;
  final String transportType;
  final String departureStation;
  final String departureDateTime;
  final String arrivalStation;
  final String arrivalDateTime;
  final String platform;
  final String carrier;
  final String ticketPrice;
  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        receiptID,
        receiptID,
        flightNumber,
        date,
        passengers,
        flight,
        transportType,
        departureStation,
        departureDateTime,
        arrivalStation,
        arrivalDateTime,
        platform,
        carrier,
        ticketPrice,
      ];

  const MockTicket({
    required this.receiptID,
    required this.flightNumber,
    required this.date,
    required this.passengers,
    required this.flight,
    required this.transportType,
    required this.departureStation,
    required this.departureDateTime,
    required this.arrivalStation,
    required this.arrivalDateTime,
    required this.platform,
    required this.carrier,
    required this.ticketPrice,
  });
}

final class MockTicketPassenger extends Equatable {
  final String fullName;
  final String documentNumber;
  final String fare;
  final String seat;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        fullName,
        documentNumber,
        fare,
        seat,
      ];

  const MockTicketPassenger({
    required this.fullName,
    required this.documentNumber,
    required this.fare,
    required this.seat,
  });
}

abstract final class TicketMocks {
  static const mock = MockTicket(
    receiptID: 'ЦБ002559816019',
    flightNumber: '№91',
    date: '29.09.2023 14:30',
    passengers: [
      MockTicketPassenger(
        fullName: 'Шашков Архип Павлович',
        documentNumber: '**** **3203',
        fare: 'Пассажирский',
        seat: '2',
      ),
      MockTicketPassenger(
        fullName: 'Богданов Юстин Рубенович',
        documentNumber: '**** **2103',
        fare: 'Пассажирский',
        seat: '3',
      ),
    ],
    flight: 'Чебоксары Центральный АВ — Яльчики с. ДКП 534, Междугородное',
    transportType: 'Автобус Газель (16), е082хо21',
    departureStation: 'Чебоксары Центральный АВ',
    departureDateTime: '30.09.2023 15:30',
    arrivalStation: 'Яльчики с. ДКП 534',
    arrivalDateTime: '30.09.2023 18:30',
    platform: '19',
    carrier: 'БЕЛЯЕВ З А ИП',
    ticketPrice: '1100',
  );
}
