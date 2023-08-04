import 'package:equatable/equatable.dart';

final class BusStop extends Equatable {
  final String? name;
  final String? code;
  final String? id;
  final String? country;
  final String? region;
  final String? district;
  final String? automated;
  final String? hasDestinations;
  final String? uTC;
  final String? gPSCoordinates;
  final String? address;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
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
    this.name,
    this.code,
    this.id,
    this.country,
    this.region,
    this.district,
    this.automated,
    this.hasDestinations,
    this.uTC,
    this.gPSCoordinates,
    this.address,
  });
}
