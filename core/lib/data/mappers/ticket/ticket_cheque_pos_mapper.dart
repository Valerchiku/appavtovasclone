import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/data/mappers/ticket/ticket_cheque_pos_purveyor_mapper.dart';
import 'package:core/domain/entities/oneC_entities/ticket_cheque_pos.dart';

abstract final class _Fields {
  static const String name = 'Name';
  static const String sumWithDiscount = 'SumWithDiscount';
  static const String sum54FLWithDiscount = 'Sum54FLWithDiscount';
  static const String fiscalSectionNumber = 'FiscalSectionNumber';
  static const String vat = 'Vat';
  static const String vat54fl = 'Vat54fl';
  static const String purveyorData = 'PurveyorData';
  static const String signCalculationObject = 'SignCalculationObject';
  static const String signMethodCalculation = 'SignMethodCalculation';
}

final class TicketChequePosMapper implements BaseMapper<TicketChequePos> {
  @override
  Map<String, dynamic> toJson(TicketChequePos data) {
    return {
      _Fields.name: data.name,
      _Fields.sumWithDiscount: data.sumWithDiscount,
      _Fields.sum54FLWithDiscount: data.sum54FLWithDiscount,
      _Fields.fiscalSectionNumber: data.fiscalSectionNumber,
      _Fields.vat: data.vat,
      _Fields.vat54fl: data.vat54fl,
      _Fields.purveyorData: data.purveyorData?.map(TicketChequePosPurveyorDataMapper().toJson).toList(),
      _Fields.signCalculationObject: data.signCalculationObject,
      _Fields.signMethodCalculation: data.signMethodCalculation,
    };
  }

  @override
  TicketChequePos fromJson(Map<String, dynamic> json) {
    final purveyorData = json[_Fields.purveyorData];
    return TicketChequePos(
      name: json[_Fields.name],
      sumWithDiscount: json[_Fields.sumWithDiscount],
      sum54FLWithDiscount: json[_Fields.sum54FLWithDiscount],
      fiscalSectionNumber: json[_Fields.fiscalSectionNumber],
      vat: json[_Fields.vat],
      vat54fl: json[_Fields.vat54fl],
      purveyorData: purveyorData != null
        ? (purveyorData as List<dynamic>)
            .map((e) => TicketChequePosPurveyorDataMapper().fromJson(e))
            .toList()
            : List.empty(),
      signCalculationObject: json[_Fields.signCalculationObject],
      signMethodCalculation: json[_Fields.signMethodCalculation],
    );
  }
}
