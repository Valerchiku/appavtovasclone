import 'package:equatable/equatable.dart';

final class MockTicket extends Equatable {
  final String purchaseDateTime;
  final String receiptID;
  final String ticketType;
  final String passengerName;
  final String passportNum;
  final String fareAmount;
  final String serviceFeeAmount;
  final String totalAmount;
  final String flightNumber;
  final String departureStation;
  final String departureDateTime;
  final String platform;
  final String seat;
  final String arrivalStation;
  final String arrivalStationArrival;
  final String transportCompany;
  final String transportType;
  final String paid;
  final String address;
  final String totalPaymentAmount;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        purchaseDateTime,
        receiptID,
        ticketType,
        passengerName,
        passportNum,
        fareAmount,
        serviceFeeAmount,
        totalAmount,
        flightNumber,
        departureStation,
        departureDateTime,
        platform,
        seat,
        arrivalStation,
        arrivalStationArrival,
        transportCompany,
        transportType,
        paid,
        address,
        totalPaymentAmount,
      ];

  const MockTicket({
    required this.purchaseDateTime,
    required this.receiptID,
    required this.ticketType,
    required this.passengerName,
    required this.passportNum,
    required this.fareAmount,
    required this.serviceFeeAmount,
    required this.totalAmount,
    required this.flightNumber,
    required this.departureStation,
    required this.departureDateTime,
    required this.platform,
    required this.seat,
    required this.arrivalStation,
    required this.arrivalStationArrival,
    required this.transportCompany,
    required this.transportType,
    required this.paid,
    required this.address,
    required this.totalPaymentAmount,
  });
}

abstract final class TicketMocks {
  static const ticketPDF = MockTicket(
    purchaseDateTime: '28.09.2023 00:00',
    receiptID: 'ЦБ002559816942',
    ticketType: 'Пассажирский',
    passengerName: 'Панов Вальтер Улебович',
    passportNum: '**** **7312',
    fareAmount: '500',
    serviceFeeAmount: '0',
    totalAmount: '500',
    flightNumber: 'Чебоксары Центральный АВ — Йошкар-Ола АВ , Междугородное',
    departureStation: 'Чебоксары Центральный АВ',
    departureDateTime: '28.09.2023 05:40',
    platform: '10',
    seat: '2',
    arrivalStation: 'Йошкар-Ола АВ',
    arrivalStationArrival: '28.09.2023 07:00',
    transportCompany: 'ЧЕБОКСАРЫ ТРАНСПОРТ ИП',
    transportType: 'Автобус Газель (16), д262ав21',
    paid: '500',
    address: 'Чебоксары Центральный АВ',
    totalPaymentAmount: '500',
  );
}
