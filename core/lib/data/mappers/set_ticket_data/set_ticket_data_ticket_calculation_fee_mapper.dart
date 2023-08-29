import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/set_ticket_data/set_ticket_data_ticket_calculation_fee.dart';

abstract final class _Fields {
  static const String name = 'Name';
  static const String discount = 'Discount';
  static const String amount = 'Amount';
  static const String carriersFee = 'CarriersFee';
}

final class SetTicketDataTicketCalculationFeeMapper implements BaseMapper<SetTicketDataTicketCalculationFee> {
  @override
  Map<String, dynamic> toJson(SetTicketDataTicketCalculationFee data) {
    return {
      _Fields.name: data.name,
      _Fields.discount: data.discount,
      _Fields.amount: data.amount,
      _Fields.carriersFee: data.carriersFee,
    };
  }

  @override
  SetTicketDataTicketCalculationFee fromJson(Map<String, dynamic> json) {
    return SetTicketDataTicketCalculationFee(
      name: json[_Fields.name],
      discount: json[_Fields.discount],
      amount: json[_Fields.amount],
      carriersFee: json[_Fields.carriersFee],
    );
  }
}
