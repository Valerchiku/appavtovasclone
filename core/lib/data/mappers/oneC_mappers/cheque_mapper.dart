import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/data/mappers/oneC_mappers/cheque_line_mapper.dart';
import 'package:core/domain/entities/oneC_entities/cheque_lines.dart';
import 'package:core/domain/entities/oneC_entities/cheques.dart';

final class ChequeMapper implements BaseMapper<Cheque> {
  @override
  Map<String, dynamic> toJson(Cheque data) {
    return {
      _Fields.chequeLines: data.chequeLines
          ?.map((line) => ChequeLineMapper().toJson(line))
          .toList(),
      _Fields.barcode: data.barcode,
      _Fields.fiscal: data.fiscal,
      _Fields.fiscalSum: data.fiscalSum,
      _Fields.caption: data.caption,
      _Fields.sticker: data.sticker,
      _Fields.fiscalSection: data.fiscalSection,
      _Fields.dBDocNum: data.dBDocNum,
      _Fields.parentDoc: data.parentDoc,
      _Fields.positions: data.positions,
    };
  }

  @override
  Cheque fromJson(Map<String, dynamic> json) {
    final jsonChequeLines = json[_Fields.chequeLines];

    final chequeLines = <ChequeLine>[];

    if (jsonChequeLines is Map<String, dynamic>) {
      chequeLines.add(
        ChequeLineMapper().fromJson(jsonChequeLines),
      );
    } else if (jsonChequeLines is List<dynamic>) {
      chequeLines.addAll(
        jsonChequeLines.map(
          (el) => ChequeLineMapper().fromJson(
            el as Map<String, dynamic>,
          ),
        ),
      );
    }

    return Cheque(
      chequeLines: chequeLines,
      barcode: json[_Fields.barcode] ?? '',
      fiscal: json[_Fields.fiscal] ?? '',
      fiscalSum: json[_Fields.fiscalSum] ?? '',
      caption: json[_Fields.caption] ?? '',
      sticker: json[_Fields.sticker] ?? '',
      fiscalSection: json[_Fields.fiscalSection] ?? '',
      dBDocNum: json[_Fields.dBDocNum] ?? '',
      parentDoc: json[_Fields.parentDoc] ?? '',
      positions: json[_Fields.positions] ?? '',
    );
  }
}

abstract final class _Fields {
  static const chequeLines = 'ChequeLines';
  static const barcode = 'Barcode';
  static const fiscal = 'Fiscal';
  static const fiscalSum = 'FiscalSum';
  static const caption = 'Caption';
  static const sticker = 'Sticker';
  static const fiscalSection = 'FiscalSection';
  static const dBDocNum = 'DBDocNum';
  static const parentDoc = 'ParentDoc';
  static const positions = 'Positions';
}
