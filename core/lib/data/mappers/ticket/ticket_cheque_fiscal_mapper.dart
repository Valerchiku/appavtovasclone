import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/oneC_entities/ticket_cheque_fiscal.dart';

abstract final class _Fields {
  static const String sectionNumber = 'sectionNumber';
  static const String sectionSum = 'sectionSum';
  static const String tax = 'tax';
}

final class TicketChequeFiscalSectionMapper implements BaseMapper<TicketChequeFiscalSection> {
  @override
  Map<String, dynamic> toJson(TicketChequeFiscalSection data) {
    return {
      _Fields.sectionNumber: data.sectionNumber,
      _Fields.sectionSum: data.sectionSum,
      _Fields.tax: data.tax,
    };
  }

  @override
  TicketChequeFiscalSection fromJson(Map<String, dynamic> json) {
    return TicketChequeFiscalSection(
      sectionNumber: json[_Fields.sectionNumber],
      sectionSum: json[_Fields.sectionSum],
      tax: json[_Fields.tax],
    );
  }
}
