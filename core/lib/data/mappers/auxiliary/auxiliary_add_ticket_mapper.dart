import 'package:core/avtovas_core.dart';
import 'package:core/data/mappers/base_mapper.dart';

final class AuxiliaryAddTicketMapper implements BaseMapper<AuxiliaryAddTicket> {
  @override
  Map<String, dynamic> toJson(AuxiliaryAddTicket data) {
    throw UnimplementedError();
  }

  @override
  AuxiliaryAddTicket fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  AuxiliaryAddTicket auxiliaryAddTicketFromPassenger(String rate) {
    return AuxiliaryAddTicket(
      fares: rate,
      seats: '',
    );
  }
}
