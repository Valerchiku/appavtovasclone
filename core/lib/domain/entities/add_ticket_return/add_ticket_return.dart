import 'package:core/domain/entities/add_ticket_return/add_ticket_return_payment_item.dart';
import 'package:core/domain/entities/domain_object.dart';
import 'package:core/domain/entities/one_c_entities/ticket_returns.dart';

final class AddTicketReturn extends DomainObject {
  final String number;
  final String date;
  final TicketReturns ticketReturns;
  final String amount;
  final AddTicketReturnPaymentItem paymentItems;
  final String currency;
  final String returnFares;

  @override
  List<Object?> get props => [
        number,
        date,
        ticketReturns,
        amount,
        paymentItems,
        currency,
        returnFares,
      ];

  const AddTicketReturn({
    required this.number,
    required this.date,
    required this.ticketReturns,
    required this.amount,
    required this.paymentItems,
    required this.currency,
    required this.returnFares,
  });

  @override
  AddTicketReturn copyWith() {
    return AddTicketReturn(
      number: number,
      date: date,
      ticketReturns: ticketReturns,
      amount: amount,
      paymentItems: paymentItems,
      currency: currency,
      returnFares: returnFares,
    );
  }
}
