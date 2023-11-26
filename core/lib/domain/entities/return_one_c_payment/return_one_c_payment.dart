import 'package:core/domain/entities/domain_object.dart';
import 'package:core/domain/entities/one_c_entities/ticket_returns.dart';
import 'package:core/domain/entities/return_one_c_payment/return_one_c_payment_doc.dart';

final class ReturnOneCPayment extends DomainObject {
  final String number;
  final String date;
  final TicketReturns ticketReturns;
  final String amount;
  final ReturnOneCPaymentDoc paymentDoc;
  final String currency;
  final String returnFares;

  @override
  List<Object?> get props => [
        number,
        date,
        ticketReturns,
        amount,
        paymentDoc,
        currency,
        returnFares,
      ];

  const ReturnOneCPayment({
    required this.number,
    required this.date,
    required this.ticketReturns,
    required this.amount,
    required this.paymentDoc,
    required this.currency,
    required this.returnFares,
  });

  @override
  ReturnOneCPayment copyWith() {
    return ReturnOneCPayment(
      number: number,
      date: date,
      ticketReturns: ticketReturns,
      amount: amount,
      paymentDoc: paymentDoc,
      currency: currency,
      returnFares: returnFares,
    );
  }
}
