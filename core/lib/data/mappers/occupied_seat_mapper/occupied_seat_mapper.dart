import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/occupied_seat/occupied_seat.dart';

final class OccupiedSeatMapper implements BaseMapper<OccupiedSeat> {
  @override
  Map<String, dynamic> toJson(OccupiedSeat data) {
    return {
      _Fields.type: data.type,
      _Fields.number: data.number,
      _Fields.status: data.status,
      _Fields.parentTicketSeatNum: data.parentTicketSeatNum,
      _Fields.forCurrentOrder: data.forCurrentOrder,
    };
  }

  @override
  OccupiedSeat fromJson(Map<String, dynamic> json) {
    return OccupiedSeat(
      type: json[_Fields.type] ?? '',
      number: json[_Fields.number] ?? '',
      status: json[_Fields.status] ?? '',
      parentTicketSeatNum: json[_Fields.parentTicketSeatNum] ?? '',
      forCurrentOrder: json[_Fields.forCurrentOrder] ?? '',
    );
  }
}

abstract final class _Fields {
  static const String type = 'Type';
  static const String number = 'Number';
  static const String status = 'Status';
  static const String parentTicketSeatNum = 'ParentTicketSeatNum';
  static const String forCurrentOrder = 'ForCurrentOrder';
}
