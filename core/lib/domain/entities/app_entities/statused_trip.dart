import 'package:core/domain/entities/app_entities/passenger.dart';
import 'package:core/domain/entities/domain_object.dart';
import 'package:core/domain/entities/single_trip/single_trip.dart';
import 'package:core/domain/utils/user_trip_status.dart';

final class StatusedTrip extends DomainObject {
  final String uuid;
  final SingleTrip trip;
  final DateTime saleDate;
  final String saleCost;
  final List<String> places;
  final UserTripStatus tripStatus;
  final UserTripCostStatus tripCostStatus;
  final String? paymentUuid;
  final List<Passenger> passengers;
  final List<String> ticketNumbers;
  final String? orderNum;
  final String tripDbName;

  @override
  List<Object?> get props => [
        uuid,
        trip,
        saleDate,
        saleCost,
        places,
        tripStatus,
        tripCostStatus,
        paymentUuid,
        ticketNumbers,
        passengers,
        orderNum,
        tripDbName,
      ];

  const StatusedTrip({
    required this.uuid,
    required this.tripStatus,
    required this.tripCostStatus,
    required this.saleDate,
    required this.saleCost,
    required this.places,
    required this.trip,
    required this.paymentUuid,
    required this.ticketNumbers,
    required this.passengers,
    required this.orderNum,
    required this.tripDbName,
  });

  @override
  StatusedTrip copyWith({
    DateTime? saleDate,
    String? saleCost,
    List<String>? places,
    UserTripStatus? tripStatus,
    UserTripCostStatus? tripCostStatus,
    String? paymentUuid,
    List<String>? ticketNumbers,
    List<Passenger>? passengers,
    String? orderNum,
    String? tripDbName,
  }) {
    return StatusedTrip(
      uuid: uuid,
      tripStatus: tripStatus ?? this.tripStatus,
      tripCostStatus: tripCostStatus ?? this.tripCostStatus,
      saleDate: saleDate ?? this.saleDate,
      saleCost: saleCost ?? this.saleCost,
      places: places ?? this.places,
      trip: trip ?? this.trip,
      ticketNumbers: ticketNumbers ?? this.ticketNumbers,
      paymentUuid: paymentUuid ?? this.paymentUuid,
      passengers: passengers ?? this.passengers,
      orderNum: orderNum ?? this.orderNum,
      tripDbName: tripDbName ?? this.tripDbName,
    );
  }
}
