import 'package:core/domain/entities/domain_object.dart';

final class Waypoint extends DomainObject {
  final String arrivalTime;
  final String name;
  final String? address;
  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        arrivalTime,
        name,
        address,
      ];

  const Waypoint({
    required this.arrivalTime,
    required this.name,
    required this.address,
  });

  @override
  Waypoint copyWith() {
    return Waypoint(
      arrivalTime: arrivalTime,
      name: name,
      address: address,
    );
  }
}
