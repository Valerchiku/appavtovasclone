import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/reserve_order/reserve_order_reserve.dart';

final class ReserveOrderReserveMapper
    implements BaseMapper<ReserveOrderReserve> {
  @override
  Map<String, dynamic> toJson(ReserveOrderReserve data) {
    return {
      _Fields.reserveKind: data.reserveKind,
      _Fields.reserveCost: data.reserveCost,
    };
  }

  @override
  ReserveOrderReserve fromJson(Map<String, dynamic> json) {
    return ReserveOrderReserve(
      reserveKind: json[_Fields.reserveKind] ?? '',
      reserveCost: json[_Fields.reserveCost] ?? '',
    );
  }
}

abstract final class _Fields {
  static const reserveKind = 'ReserveKind';
  static const reserveCost = 'ReserveCost';
}
