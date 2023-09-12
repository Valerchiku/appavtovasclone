import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/one_c_entities/cheque_lines.dart';

final class ChequeLineMapper implements BaseMapper<ChequeLine> {
  @override
  Map<String, dynamic> toJson(ChequeLine data) {
    return {
      _Fields.chequeLine: data.chequeLine,
    };
  }

  @override
  ChequeLine fromJson(Map<String, dynamic> json) {
    return ChequeLine(
      chequeLine: json[_Fields.chequeLine] ?? '',
    );
  }
}

abstract final class _Fields {
  static const chequeLine = 'ChequeLines';
}
