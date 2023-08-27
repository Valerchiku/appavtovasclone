import 'package:core/domain/entities/domain_object.dart';

abstract final class _Fields {
  static const String fareDiscount = 'FareDiscount';
  static const String fareAmount = 'FareAmount';
  static const String fees = 'Fees';
  static const String totalDiscount = 'TotalDiscount';
  static const String totalAmount = 'TotalAmount';
}

final class SetTicketDataTicketCalculationMapper implements BaseMapper<SetTicketDataTicketCalculation> {
  @override
  Map<String, dynamic> toJson(SetTicketDataTicketCalculation data) {
    return {
      _Fields.fareDiscount: data.fareDiscount,
      _Fields.fareAmount: data.fareAmount,
      _Fields.fees:
          data.fees?.map(SetTicketDataTicketCalculationFeeMapper().toJson).toList(),
      _Fields.totalDiscount: data.totalDiscount,
      _Fields.totalAmount: data.totalAmount,
    };
  }

  @override
  SetTicketDataTicketCalculation fromJson(Map<String, dynamic> json) {
    final fees = json[_Fields.fees];
    return const SetTicketDataTicketCalculation(
      fareDiscount: _Fields.fareDiscount,
      fareAmount: _Fields.fareAmount,
      fees: fees != null
          ? (fees as List<Map<String, dynamic>>)
              .map(SetTicketDataTicketCalculationFeeMapper().fromJson)
              .toList()
          : null,
      totalDiscount: _Fields.totalDiscount,
      totalAmount: _Fields.totalAmount,
    );
  }
}
