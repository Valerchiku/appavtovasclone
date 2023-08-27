import 'package:core/data/mappers/base_mapper.dart';

abstract final class _Fields {
  static const String chequeLines = 'ChequeLines';
  static const String barcode = 'Barcode';
  static const String fiscal = 'Fiscal';
  static const String fiscalSum = 'FiscalSum';
  final const String caption = 'Caption';
  static const String sticker = 'Sticker';
  static const String printed = 'Printed';
  static const String fiscalSection = 'FiscalSection';
  static const String chequeID = 'ChequeID';
  static const String dbDocNum = 'DbDocNum';
  static const String parentDoc = 'ParentDoc';
  static const String positions = 'Positions';
  static const String qrCode = 'QrCode';
}

final class SetTicketDataTicketChequeMapper implements BaseMapper<SetTicketDataTicketCheque> {
  @override
  Map<String, dynamic> toJson(SetTicketDataTicketCheque data) {
    return {
      _Fields.chequeLines: data.chequeLines,
      _Fields.barcode: data.barcode,
      _Fields.fiscal: data.fiscal,
      _Fields.fiscalSum: data.fiscalSum,
      _Fields.caption: data.caption,
      _Fields.sticker: data.sticker,
      _Fields.printed: data.printed,
      _Fields.fiscalSection: data.fiscalSection,
      _Fields.chequeID: data.chequeID,
      _Fields.dbDocNum: data.dbDocNum,
      _Fields.parentDoc: data.parentDoc,
      _Fields.positions: data.positions?.map(ChequePosMapper().toJson).toList(),
      _Fields.qrCode: data.qrCode,
    };
  }

  @override
  SetTicketDataTicketCheque fromJson(Map<String, dynamic> json) {
    final positions = json[_Fields.positions];
    return SetTicketDataTicketCheque(
      chequeLines: json[_Fields.chequeLines],
      barcode: json[_Fields.barcode],
      fiscal: json[_Fields.fiscal],
      fiscalSum: json[_Fields.type],
      caption: json[_Fields.inputMask],
      sticker: json[_Fields.value],
      printed: json[_Fields.costAttribute],
      fiscalSection: json[_Fields.group],
      chequeID: json[_Fields.group],
      dbDocNum: json[_Fields.group],
      positions: positions != null
          ? (positions as List<dynamic>)
              .map((e) => ChequePosMapper().fromJson(e))
              .toList()
          : null,
      qrCode: json[_Fields.group],
    );
  }
}
