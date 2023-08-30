import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/oneC_entities/ticket_calculation_fee.dart';

abstract final class _Fields {
  static const String name = 'Name';
  static const String discount = 'Discount';
  static const String amount = 'Amount';
  static const String carriersFee = 'CarriersFee';
}

final class TicketCalculationFeeMapper implements BaseMapper<TicketCalculationFee> {
  @override
  Map<String, dynamic> toJson(TicketCalculationFee data) {
    return {
      _Fields.name: data.name,
      _Fields.discount: data.discount,
      _Fields.amount: data.amount,
      _Fields.carriersFee: data.carriersFee,
    };
  }

  @override
  TicketCalculationFee fromJson(Map<String, dynamic> json) {
    return TicketCalculationFee(
      name: json[_Fields.name],
      discount: json[_Fields.discount],
      amount: json[_Fields.amount],
      carriersFee: json[_Fields.carriersFee],
    );
  }
}
