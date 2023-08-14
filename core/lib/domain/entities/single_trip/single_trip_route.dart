import 'package:core/domain/entities/domain_object.dart';
import 'package:core/domain/entities/oneC_entities/bus.dart';

final class SingleTripRoute extends DomainObject {
  final Bus bus;
  final String distance;
  final String departureTime;
  final String arrivalTime;
  final String stopDuration;
  final String dayOfTrip;
  final String platform;
  final String banSaleFrom;
  final String banSaleTo;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        bus,
        distance,
        departureTime,
        arrivalTime,
        stopDuration,
        dayOfTrip,
        platform,
        banSaleFrom,
        banSaleTo,
      ];

  const SingleTripRoute({
    required this.bus,
    required this.distance,
    required this.departureTime,
    required this.arrivalTime,
    required this.stopDuration,
    required this.dayOfTrip,
    required this.platform,
    required this.banSaleFrom,
    required this.banSaleTo,
  });

  @override
  SingleTripRoute copyWith() {
    return SingleTripRoute(
      bus: bus,
      distance: distance,
      departureTime: departureTime,
      arrivalTime: arrivalTime,
      stopDuration: stopDuration,
      dayOfTrip: dayOfTrip,
      platform: platform,
      banSaleFrom: banSaleFrom,
      banSaleTo: banSaleTo,
    );
  }
}
