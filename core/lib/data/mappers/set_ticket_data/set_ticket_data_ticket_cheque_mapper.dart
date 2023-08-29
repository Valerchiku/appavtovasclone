import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/data/mappers/set_ticket_data/set_ticket_data_ticket_cheque_pos_mapper.dart';
import 'package:core/domain/entities/set_ticket_data/set_ticket_data_ticket_cheque.dart';
import 'package:core/domain/entities/set_ticket_data/set_ticket_data_ticket_cheque_pos.dart';

abstract final class _Fields {
  static const String chequeLines = 'ChequeLines';
  static const String barcode = 'Barcode';
  static const String fiscal = 'Fiscal';
  static const String fiscalSum = 'FiscalSum';
  static const String caption = 'Caption';
  static const String sticker = 'Sticker';
  static const String printed = 'Printed';
  static const String fiscalSection = 'FiscalSection';
  static const String chequeID = 'ChequeID';
  static const String dbDocNum = 'DbDocNum';
  static const String parentDoc = 'ParentDoc';
  static const String positions = 'Positions';
  static const String qrCode = 'QrCode';
}

final class SetTicketDataTicketChequeMapper
    implements BaseMapper<SetTicketDataTicketCheque> {
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
      _Fields.positions: data.positions
          .map(SetTicketDataTicketChequePosMapper().toJson)
          .toList(),
      _Fields.qrCode: data.qrCode,
    };
  }

  @override
  SetTicketDataTicketCheque fromJson(Map<String, dynamic> json) {
    final jsonPositions = json[_Fields.positions];

    final positions = <SetTicketDataTicketChequePos>[];

    if (jsonPositions is Map<String, dynamic>) {
      positions.add(
        SetTicketDataTicketChequePosMapper().fromJson(jsonPositions),
      );
    } else if (jsonPositions is List<dynamic>) {
      positions.addAll(
        jsonPositions.map(
          (el) => SetTicketDataTicketChequePosMapper().fromJson(
            el as Map<String, dynamic>,
          ),
        ),
      );
    }
    return SetTicketDataTicketCheque(
      chequeLines: json[_Fields.chequeLines],
      barcode: json[_Fields.barcode],
      fiscal: json[_Fields.fiscal],
      fiscalSum: json[_Fields.fiscalSum],
      caption: json[_Fields.caption],
      sticker: json[_Fields.sticker],
      printed: json[_Fields.printed],
      fiscalSection: json[_Fields.fiscalSection],
      chequeID: json[_Fields.chequeID],
      dbDocNum: json[_Fields.dbDocNum],
      positions: positions,
      qrCode: json[_Fields.qrCode],
      parentDoc: json[_Fields.parentDoc],
    );
  }
}
