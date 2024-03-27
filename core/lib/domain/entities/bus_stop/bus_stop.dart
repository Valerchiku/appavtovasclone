import 'package:core/domain/entities/domain_object.dart';

final class BusStop extends DomainObject {
  final String name;
  final String code;
  final String id;
  final String country;
  final String? region;
  final String? district;
  final String automated;
  final String hasDestinations;
  final String uTC;
  final String gPSCoordinates;
  final String? address;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props =>
      [
        name,
        code,
        id,
        country,
        region,
        district,
        automated,
        hasDestinations,
        uTC,
        gPSCoordinates,
        address,
      ];

  const BusStop({
    required this.name,
    required this.code,
    required this.id,
    required this.country,
    required this.automated,
    required this.hasDestinations,
    required this.uTC,
    required this.gPSCoordinates,
    this.address,
    this.region,
    this.district,
  });

  @override
  BusStop copyWith() {
    return BusStop(
      name: name,
      code: code,
      id: id,
      country: country,
      automated: automated,
      hasDestinations: hasDestinations,
      uTC: uTC,
      gPSCoordinates: gPSCoordinates,
      address: address,
      region: region,
      district: district,
    );
  }

  @override
  bool operator ==(Object other) =>
          other is BusStop &&
              runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;
}
