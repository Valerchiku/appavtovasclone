import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/oneC_entities/ticket_cheque_pos_purveyor.dart';

abstract final class _Fields {
  static const String name = 'Name';
  static const String taxId = 'TaxId';
  static const String phone = 'Phone';
}

final class TicketChequePosPurveyorDataMapper implements BaseMapper<TicketChequePosPurveyorData> {
  @override
  Map<String, dynamic> toJson(TicketChequePosPurveyorData data) {
    return {
      _Fields.name: data.name,
      _Fields.taxId: data.taxId,
      _Fields.phone: data.phone,
    };
  }

  @override
  TicketChequePosPurveyorData fromJson(Map<String, dynamic> json) {
    return TicketChequePosPurveyorData(
      name: json[_Fields.name],
      taxId: json[_Fields.taxId],
      phone: json[_Fields.phone],
    );
  }
}
