import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/data/mappers/occupied_seat_mapper/occupied_seat_mapper.dart';
import 'package:core/data/mappers/oneC_mappers/departure_mapper.dart';
import 'package:core/data/mappers/oneC_mappers/destination_mapper.dart';
import 'package:core/data/mappers/oneC_mappers/ticket_mapper.dart';
import 'package:core/data/mappers/reserve_order_mapper/reserve_order_customer_mapper.dart';
import 'package:core/data/mappers/reserve_order_mapper/reserve_order_reserve_mapper.dart';
import 'package:core/data/mappers/trip/trip_mapper.dart';
import 'package:core/domain/entities/occupied_seat/occupied_seat.dart';
import 'package:core/domain/entities/reserve_order/reserve_order.dart';

final class ReserveOrderMapper implements BaseMapper<ReserveOrder> {
  @override
  Map<String, dynamic> toJson(ReserveOrder data) {
    return {};
  }

  @override
  ReserveOrder fromJson(Map<String, dynamic> json) {
    final jsonOccupiedSeats = json[_Fields.occupiedSeat];

    final occupiedSeat = <OccupiedSeat>[];

    if (jsonOccupiedSeats is Map<String, dynamic>) {
      occupiedSeat.add(
        OccupiedSeatMapper().fromJson(jsonOccupiedSeats),
      );
    } else if (jsonOccupiedSeats is List<dynamic>) {
      occupiedSeat.addAll(
        jsonOccupiedSeats.map(
          (el) => OccupiedSeatMapper().fromJson(
            el as Map<String, dynamic>,
          ),
        ),
      );
    }
    
    return ReserveOrder(
      number: json[_Fields.number] ?? '',
      trip: TripMapper().fromJson(json[_Fields.trip]),
      departure: DepartureMapper().fromJson(json[_Fields.departure]),
      departureTime: json[_Fields.departureTime] ?? '',
      destination: DestinationMapper().fromJson(json[_Fields.destination]),
      ticket: TicketMapper().fromJson(json[_Fields.ticket]),
      occupiedSeat: occupiedSeat,
      amount: json[_Fields.amount] ?? '',
      customer: ReserveOrderCustomerMapper().fromJson(json[_Fields.customer]),
      services: json[_Fields.services] ?? '',
      secondsToUnlockSeats: json[_Fields.secondsToUnlockSeats] ?? '',
      reserve: ReserveOrderReserveMapper().fromJson(json[_Fields.reserve]),
      currency: json[_Fields.currency] ?? '',
    );
  }
}

abstract final class _Fields {
  static const number = 'Number';
  static const trip = 'Trip';
  static const departure = 'Departure';
  static const departureTime = 'DepartureTime';
  static const destination = 'Destination';
  static const ticket = 'Tickets';
  static const occupiedSeat = 'OccupiedSeats';
  static const amount = 'Amount';
  static const customer = 'Customer';
  static const services = 'Services';
  static const secondsToUnlockSeats = 'SecondsToUnlockSeats';
  static const reserve = 'Reserve';
  static const currency = 'Currency';
}
