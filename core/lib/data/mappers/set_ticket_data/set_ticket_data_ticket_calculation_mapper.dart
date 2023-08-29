import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/data/mappers/set_ticket_data/set_ticket_data_ticket_calculation_fee_mapper.dart';
import 'package:core/domain/entities/set_ticket_data/set_ticket_data_ticket_calculation.dart';
import 'package:core/domain/entities/set_ticket_data/set_ticket_data_ticket_calculation_fee.dart';

final class SetTicketDataTicketCalculationMapper
    implements BaseMapper<SetTicketDataTicketCalculation> {
  @override
  Map<String, dynamic> toJson(SetTicketDataTicketCalculation data) {
    return {
      _Fields.fareDiscount: data.fareDiscount,
      _Fields.fareAmount: data.fareAmount,
      _Fields.fees: data.fees
          .map(SetTicketDataTicketCalculationFeeMapper().toJson)
          .toList(),
      _Fields.totalDiscount: data.totalDiscount,
      _Fields.totalAmount: data.totalAmount,
    };
  }

  @override
  SetTicketDataTicketCalculation fromJson(Map<String, dynamic> json) {
    final jsonFees = json[_Fields.fees];

    final fees = <SetTicketDataTicketCalculationFee>[];

    if (jsonFees is Map<String, dynamic>) {
      fees.add(
        SetTicketDataTicketCalculationFeeMapper().fromJson(jsonFees),
      );
    } else if (jsonFees is List<dynamic>) {
      fees.addAll(
        jsonFees.map(
          (el) => SetTicketDataTicketCalculationFeeMapper().fromJson(
            el as Map<String, dynamic>,
          ),
        ),
      );
    }
    return SetTicketDataTicketCalculation(
      fareDiscount: json[_Fields.fareDiscount],
      fareAmount: json[_Fields.fareAmount],
      fees: fees,
      totalDiscount: json[_Fields.totalDiscount],
      totalAmount: json[_Fields.totalAmount],
    );
  }
}

abstract final class _Fields {
  static const String fareDiscount = 'FareDiscount';
  static const String fareAmount = 'FareAmount';
  static const String fees = 'Fees';
  static const String totalDiscount = 'TotalDiscount';
  static const String totalAmount = 'TotalAmount';
}
