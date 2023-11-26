import 'package:core/avtovas_core.dart';
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
  final List<Passenger> passenger;

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
        passenger,
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
    required this.passenger,
  });

  @override
  StatusedTrip copyWith({
    SingleTrip? trip,
    DateTime? saleDate,
    String? saleCost,
    List<String>? places,
    UserTripStatus? tripStatus,
    UserTripCostStatus? tripCostStatus,
    String? paymentUuid,
    List<Passenger>? passenger,
  }) {
    return StatusedTrip(
      uuid: uuid,
      tripStatus: tripStatus ?? this.tripStatus,
      tripCostStatus: tripCostStatus ?? this.tripCostStatus,
      saleDate: saleDate ?? this.saleDate,
      saleCost: saleCost ?? this.saleCost,
      places: places ?? this.places,
      trip: trip ?? this.trip,
      paymentUuid: paymentUuid ?? this.paymentUuid,
      passenger: passenger ?? this.passenger,
    );
  }
}
