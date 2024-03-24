import 'package:core/avtovas_core.dart';
import 'package:core/domain/entities/domain_object.dart';


final class SingleTripRoute extends DomainObject {
  final BusStop busStop;
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
        busStop,
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
    required this.busStop,
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
      busStop: busStop,
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
