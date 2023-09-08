import 'package:core/domain/entities/domain_object.dart';
import 'package:core/domain/entities/return_payment/return_payment_doc.dart';
import 'package:core/domain/entities/return_payment/return_payment_ticket_returns.dart';

final class ReturnPayment extends DomainObject {
  final String number;
  final String date;
  final ReturnPaymentTicketReturns ticketReturns;
  final String amount;
  final ReturnPaymentDoc paymentDoc;
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

  const ReturnPayment({
    required this.number,
    required this.date,
    required this.ticketReturns,
    required this.amount,
    required this.paymentDoc,
    required this.currency,
    required this.returnFares,
  });

  @override
  ReturnPayment copyWith() {
    return ReturnPayment(
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
