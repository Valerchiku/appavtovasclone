import 'package:equatable/equatable.dart';

final class Bus extends Equatable {
  final String? id;
  final String? model;
  final String? licencePlate;
  final String? name;
  final String? seatsClass;
  final String? seatCapacity;
  final String? standCapacity;
  final String? baggageCapacity;
  final String? garageNum;

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

  const Bus({
    this.id,
    this.model,
    this.licencePlate,
    this.name,
    this.seatsClass,
    this.seatCapacity,
    this.standCapacity,
    this.baggageCapacity,
    this.garageNum,
  });
}
