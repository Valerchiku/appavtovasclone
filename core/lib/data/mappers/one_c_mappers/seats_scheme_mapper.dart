import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/one_c_entities/seats_scheme.dart';

final class SeatsSchemeMapper implements BaseMapper<SeatsScheme> {
  @override
  Map<String, dynamic> toJson(SeatsScheme data) {
    return {
      _Fields.xPos: data.xPos,
      _Fields.yPos: data.yPos,
      _Fields.seatNum: data.seatNum,
    };
  }

  @override
  SeatsScheme fromJson(Map<String, dynamic> json) {
    return SeatsScheme(
      xPos: json[_Fields.xPos] ?? '',
      yPos: json[_Fields.yPos] ?? '',
      seatNum: json[_Fields.seatNum] ?? '',
    );
  }
}

abstract final class _Fields {
  static const xPos = 'XPos';
  static const yPos = 'YPos';
  static const seatNum = 'SeatNum';
}
