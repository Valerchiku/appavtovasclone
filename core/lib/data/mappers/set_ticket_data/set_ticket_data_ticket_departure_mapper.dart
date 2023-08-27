import 'package:core/domain/entities/domain_object.dart';

final class SetTicketDataTicketDepartureMapper extends Departure {
  
final String locationType;
final String locality;
final String stoppingPlace;
final String phone;

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
      this.locationType,
      this.locality,
      this.stoppingPlace,
      this.phone,
  });

  @override
  SetTicketDataTicketDeparture copyWith() {
    return SetTicketDataTicketDeparture(
      locationType: locationType,
      locality: locality,
      stoppingPlace: stoppingPlace,
      phone: phone,
    );
  }
}
