import 'package:core/domain/entities/domain_object.dart';

class SetTicketDataTicketDeparture extends DomainObject {
  final String locationType;
  final String locality;
  final String stoppingPlace;
  final String phone;
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
  List<Object?> get props => [
        locationType,
        locality,
        stoppingPlace,
        phone,
      ];

  const SetTicketDataTicketDeparture({
      required this.region,
      required this.district,
      required this.address,
      required this.locationType,
      required this.locality,
      required this.stoppingPlace,
      required this.phone,
      required this.name,
      required this.code,
      required this.id,
      required this.country,
      required this.automated,
      required this.hasDestinations,
      required this.uTC,
      required this.gPSCoordinates,
  });

  @override
  SetTicketDataTicketDeparture copyWith() {
    return SetTicketDataTicketDeparture(
      locationType: locationType,
      locality: locality,
      stoppingPlace: stoppingPlace,
      phone: phone,
      name: name,
      code: code,
      id: id,
      country: country,
      automated: automated,
      hasDestinations: hasDestinations,
      uTC: uTC,
      gPSCoordinates: gPSCoordinates,
      region: region,
      district: district,
      address: address,
    );
  }
}
