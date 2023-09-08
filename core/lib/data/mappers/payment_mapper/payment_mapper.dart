import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/payment/payment.dart';

final class PaymentMapper implements BaseMapper<Payment> {
  @override
  Map<String, dynamic> toJson(Payment data) {
    return {
      /*
      _Fields.number: data.number,
      _Fields.trip: TripMapper().toJson(data.trip),
      _Fields.departure: DepartureMapper().toJson(data.departure),
      _Fields.departureTime: data.departureTime,
      _Fields.destination: DestinationMapper().toJson(data.destination),
      _Fields.ticket: TicketMapper().toJson(data.ticket),
      _Fields.occupiedSeats: data.occupiedSeats.map((seat) => 
      OccupiedSeatsMapper().toJson(seat)).toList(),
      _Fields.amount: data.amount,
      _Fields.services: data.services,
      _Fields.currency: data.currency,
       */
    };
  }

  @override
  Payment fromJson(Map<String, dynamic> json) {
    // final jsonOccupiedSeats = json[_Fields.occupiedSeats];

    // final occupiedSeats = <OccupiedSeats>[];

    // if (jsonOccupiedSeats is Map<String, dynamic>) {
    //   occupiedSeats.add(
    //     OccupiedSeatsMapper().fromJson(jsonOccupiedSeats),
    //   );
    // } else if (jsonOccupiedSeats is List<dynamic>) {
    //   occupiedSeats.addAll(
    //     jsonOccupiedSeats.map(
    //       (el) => OccupiedSeatsMapper().fromJson(
    //         el as Map<String, dynamic>,
    //       ),
    //     ),
    //   );
    // }
    return const Payment(
        /*
      number: json[_Fields.number] ?? '',
      trip: TripMapper().fromJson(json[_Fields.trip]),
      departure:DepartureMapper().fromJson(json[_Fields.departure]),
      departureTime: json[_Fields.departureTime] ?? ''
      destination: DestinationMapper().fromJson(json[_Fields.destination]),
      ticket: TicketMapper().fromJson(json[_Fields.ticket]),
      occupiedSeats: occupiedSeats,
      amount: json[_Fields.amount] ?? '',
      services: json[_Fields.services] ?? '',
      currency: json[_Fields.currency] ?? '',
       */
        );
  }
}

/*
abstract final class _Fields {
  static const number = 'Number';
  static const trip = 'Trip';
  static const departure = 'Departure';
  static const departureTime = 'DepartureTime';
  static const destination = 'Destination';
  static const ticket = 'Ticket';
  static const occupiedSeats = 'OccupiedSeats';
  static const amount = 'Amount';
  static const services = 'Services';
  static const currency = 'Currency';
}
*/
