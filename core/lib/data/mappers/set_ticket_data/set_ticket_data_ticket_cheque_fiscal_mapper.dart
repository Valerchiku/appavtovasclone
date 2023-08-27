import 'package:core/data/mappers/base_mapper.dart';

abstract final class _Fields {
  static const String sectionNumber = 'sectionNumber';
  static const String sectionSum = 'sectionSum';
  static const String tax = 'tax';
}

final class SetTicketDataTicketChequeFiscalSectionMapper implements BaseMapper<SetTicketDataTicketChequeFiscalSection> {
  @override
  Map<String, dynamic> toJson(SetTicketDataTicketChequeFiscalSection data) {
    return {
      _Fields.sectionNumber: data.sectionNumber,
      _Fields.sectionSum: data.sectionSum,
      _Fields.tax: data.tax,
    };
  }

  @override
  SetTicketDataTicketChequeFiscalSection fromJson(Map<String, dynamic> json) {
    final valueVariants = json[_Fields.valueVariants];
    return SetTicketDataTicketChequeFiscalSection(
      sectionNumber: json[_Fields.sectionNumber],
      sectionSum: json[_Fields.sectionSum],
      tax: json[_Fields.tax],
    );
  }
}
