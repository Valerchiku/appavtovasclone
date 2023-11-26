import 'package:core/data/mappers/add_ticket_return_mapper/add_ticket_return_payment.dart';
import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/data/mappers/one_c_mappers/ticket_returns_mapper.dart';
import 'package:core/domain/entities/add_ticket_return/add_ticket_return.dart';

final class AddTicketReturnMapper implements BaseMapper<AddTicketReturn> {
  @override
  Map<String, dynamic> toJson(AddTicketReturn data) {
    return {};
  }

  @override
  AddTicketReturn fromJson(Map<String, dynamic> json) {
    return AddTicketReturn(
      number: json[_Fields.number],
      date: json[_Fields.date],
      ticketReturns: TicketReturnsMapper().fromJson(
        json[_Fields.ticketReturns],
      ),
      amount: json[_Fields.amount],
      paymentItems: AddTicketReturnPaymentItemMapper().fromJson(
        json[_Fields.paymentItems],
      ),
      currency: json[_Fields.currency],
      returnFares: json[_Fields.returnFares],
    );
  }
}

abstract final class _Fields {
  static const number = 'Number';
  static const date = 'Date';
  static const ticketReturns = 'TicketReturns';
  static const amount = 'Amount';
  static const paymentItems = 'PaymentItems';
  static const currency = 'Currency';
  static const returnFares = 'ReturnFares';
}
