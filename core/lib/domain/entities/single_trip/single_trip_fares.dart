import 'package:core/domain/entities/domain_object.dart';

final class SingleTripFares extends DomainObject {
  final String name;
  final String caption;
  final String seatType;
  final String lowAgeLimit;
  final String highAgeLimit;
  final String onlyWithPassenger;
  final String cost;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        name,
        caption,
        seatType,
        lowAgeLimit,
        highAgeLimit,
        onlyWithPassenger,
        cost,
      ];

  const SingleTripFares({
    required this.name,
    required this.caption,
    required this.seatType,
    required this.lowAgeLimit,
    required this.highAgeLimit,
    required this.onlyWithPassenger,
    required this.cost,
  });

  @override
  SingleTripFares copyWith() {
    return SingleTripFares(
      name: name,
      caption: caption,
      seatType: seatType,
      lowAgeLimit: lowAgeLimit,
      highAgeLimit: highAgeLimit,
      onlyWithPassenger: onlyWithPassenger,
      cost: cost,
    );
  }
}
