import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/data/mappers/set_ticket_data/set_ticket_data_ticket_cheque_pos_purveyor_mapper.dart';
import 'package:core/domain/entities/set_ticket_data/set_ticket_data_ticket_cheque_pos.dart';
import 'package:core/domain/entities/set_ticket_data/set_ticket_data_ticket_cheque_pos_purveyor.dart';

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

final class SetTicketDataTicketChequePosMapper
    implements BaseMapper<SetTicketDataTicketChequePos> {
  @override
  Map<String, dynamic> toJson(SetTicketDataTicketChequePos data) {
    return {
      _Fields.name: data.name,
      _Fields.sumWithDiscount: data.sumWithDiscount,
      _Fields.sum54FLWithDiscount: data.sum54FLWithDiscount,
      _Fields.fiscalSectionNumber: data.fiscalSectionNumber,
      _Fields.vat: data.vat,
      _Fields.vat54fl: data.vat54fl,
      _Fields.purveyorData: data.purveyorData
          .map(SetTicketDataTicketChequePosPurveyorDataMapper().toJson)
          .toList(),
      _Fields.signCalculationObject: data.signCalculationObject,
      _Fields.signMethodCalculation: data.signMethodCalculation,
    };
  }

  @override
  SetTicketDataTicketChequePos fromJson(Map<String, dynamic> json) {
    final jsonPurveyorData = json[_Fields.purveyorData];

    final purveyorData = <SetTicketDataTicketChequePosPurveyorData>[];

    if (jsonPurveyorData is Map<String, dynamic>) {
      purveyorData.add(
        SetTicketDataTicketChequePosPurveyorDataMapper()
            .fromJson(jsonPurveyorData),
      );
    } else if (jsonPurveyorData is List<dynamic>) {
      purveyorData.addAll(
        jsonPurveyorData.map(
          (el) => SetTicketDataTicketChequePosPurveyorDataMapper().fromJson(
            el as Map<String, dynamic>,
          ),
        ),
      );
    }
    return SetTicketDataTicketChequePos(
      name: json[_Fields.name],
      sumWithDiscount: json[_Fields.sumWithDiscount],
      sum54FLWithDiscount: json[_Fields.sum54FLWithDiscount],
      fiscalSectionNumber: json[_Fields.fiscalSectionNumber],
      vat: json[_Fields.vat],
      vat54fl: json[_Fields.vat54fl],
      purveyorData: purveyorData,
      signCalculationObject: json[_Fields.signCalculationObject],
      signMethodCalculation: json[_Fields.signMethodCalculation],
    );
  }
}
