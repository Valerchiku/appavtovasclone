import 'package:core/domain/entities/domain_object.dart';
import 'package:core/domain/entities/one_c_entities/departure.dart';
import 'package:core/domain/entities/one_c_entities/ticket.dart';

final class ReturnPaymentDoc extends DomainObject {
  final String number;
  final String date;
  final String orderNumber;
  // TODO: Edit Ticket model with nullable params
  final Ticket tickets;
  final Departure departure;
  final String amount;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        number,
        date,
        orderNumber,
        tickets,
        departure,
        amount,
      ];

  const ReturnPaymentDoc({
    required this.number,
    required this.date,
    required this.orderNumber,
    required this.tickets,
    required this.departure,
    required this.amount,
  });

  @override
  ReturnPaymentDoc copyWith() {
    return ReturnPaymentDoc(
      number: number,
      date: date,
      orderNumber: orderNumber,
      tickets: tickets,
      departure: departure,
      amount: amount,
    );
  }
}
