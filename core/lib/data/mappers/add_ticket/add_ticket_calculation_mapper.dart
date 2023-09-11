import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/add_ticket/add_ticket_calculation.dart';

final class AddTicketCalculationMapper
    implements BaseMapper<AddTicketCalculation> {
  @override
  Map<String, dynamic> toJson(AddTicketCalculation data) {
    return {
      _Fields.fareDiscount: data.fareDiscount,
      _Fields.fareAmount: data.fareAmount,
      _Fields.totalDiscount: data.totalDiscount,
      _Fields.totalAmount: data.totalDiscount,
    };
  }

  @override
  AddTicketCalculation fromJson(Map<String, dynamic> json) {
    return AddTicketCalculation(
      fareDiscount: json[_Fields.fareDiscount] ?? '',
      fareAmount: json[_Fields.fareAmount] ?? '',
      totalDiscount: json[_Fields.totalDiscount] ?? '',
      totalAmount: json[_Fields.totalAmount] ?? '',
    );
  }
}

abstract final class _Fields {
  static const String fareDiscount = 'FareDiscount';
  static const String fareAmount = 'FareAmount';
  static const String totalDiscount = 'TotalDiscount';
  static const String totalAmount = 'TotalAmount';
}
