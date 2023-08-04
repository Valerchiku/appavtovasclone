import 'package:core/domain/entities/domain_object.dart';

final class TripBus extends DomainObject {
  final String id;
  final String model;
  final String licencePlate;
  final String name;
  final String seatsClass;
  final String seatCapacity;
  final String standCapacity;
  final String baggageCapacity;
  final String garageNum;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        id,
        model,
        licencePlate,
        name,
        seatsClass,
        seatCapacity,
        standCapacity,
        baggageCapacity,
        garageNum,
      ];

  const TripBus({
    required this.id,
    required this.model,
    required this.licencePlate,
    required this.name,
    required this.seatsClass,
    required this.seatCapacity,
    required this.standCapacity,
    required this.baggageCapacity,
    required this.garageNum,
  });

  @override
  TripBus copyWith() {
    return TripBus(
      id: id,
      model: model,
      licencePlate: licencePlate,
      name: name,
      seatsClass: seatsClass,
      seatCapacity: seatCapacity,
      standCapacity: standCapacity,
      baggageCapacity: baggageCapacity,
      garageNum: garageNum,
    );
  }
}
