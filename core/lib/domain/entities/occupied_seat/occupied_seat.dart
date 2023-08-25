import 'package:core/domain/entities/domain_object.dart';
import 'package:core/domain/entities/oneC_entities/seats_scheme.dart';

final class OccupiedSeat extends DomainObject {
  final String id;
  final String model;
  final String licencePlate;
  final String name;
  final String seatsClass;
  final String seatsCapacity;
  final String standCapacity;
  final String baggageCapacity;
  final List<SeatsScheme>? seatsScheme;
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
        seatsCapacity,
        standCapacity,
        baggageCapacity,
        seatsScheme,
        garageNum,
      ];

  const OccupiedSeat({
    required this.id,
    required this.model,
    required this.licencePlate,
    required this.name,
    required this.seatsClass,
    required this.seatsCapacity,
    required this.standCapacity,
    required this.baggageCapacity,
    required this.seatsScheme,
    required this.garageNum,
  });

  @override
  OccupiedSeat copyWith() {
    return OccupiedSeat(
      id: id,
      model: model,
      licencePlate: licencePlate,
      name: name,
      seatsClass: seatsClass,
      seatsCapacity: seatsCapacity,
      standCapacity: standCapacity,
      baggageCapacity: baggageCapacity,
      seatsScheme: seatsScheme,
      garageNum: garageNum,
    );
  }
}
