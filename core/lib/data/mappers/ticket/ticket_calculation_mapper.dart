import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/data/mappers/ticket/ticket_calculation_fee_mapper.dart';
import 'package:core/domain/entities/oneC_entities/ticket_calculation.dart';

abstract final class _Fields {
  static const String fareDiscount = 'FareDiscount';
  static const String fareAmount = 'FareAmount';
  static const String fees = 'Fees';
  static const String totalDiscount = 'TotalDiscount';
  static const String totalAmount = 'TotalAmount';
}

final class TicketCalculationMapper implements BaseMapper<TicketCalculation> {
  @override
  Map<String, dynamic> toJson(TicketCalculation data) {
    return {
      _Fields.fareDiscount: data.fareDiscount,
      _Fields.fareAmount: data.fareAmount,
      _Fields.fees:
          data.fees.map(TicketCalculationFeeMapper().toJson).toList(),
      _Fields.totalDiscount: data.totalDiscount,
      _Fields.totalAmount: data.totalAmount,
    };
  }

  @override
  TicketCalculation fromJson(Map<String, dynamic> json) {
    final fees = json[_Fields.fees];
    return TicketCalculation(
      fareDiscount: _Fields.fareDiscount,
      fareAmount: _Fields.fareAmount,
      fees: fees != null
          ? (fees as List<Map<String, dynamic>>)
              .map(TicketCalculationFeeMapper().fromJson)
              .toList()
          : List.empty(),
      totalDiscount: _Fields.totalDiscount,
      totalAmount: _Fields.totalAmount,
    );
  }
}
