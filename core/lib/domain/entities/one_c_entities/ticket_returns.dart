import 'package:core/domain/entities/domain_object.dart';
import 'package:core/domain/entities/one_c_entities/cheques.dart';
import 'package:core/domain/entities/one_c_entities/ticket.dart';

final class TicketReturns extends DomainObject {
  final String number;
  final List<Ticket> ticket;
  final String returnKind;
  final String needExplanation;
  final String explanation;
  final List<Cheque>? cheques;
  final String? returnKindDescription;
  final String? fareToReturn;
  final String? sumToReturn;
  final String? faultDistance;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        number,
        ticket,
        returnKind,
        needExplanation,
        explanation,
        cheques,
        returnKindDescription,
        fareToReturn,
        sumToReturn,
        faultDistance,
      ];

  const TicketReturns({
    required this.number,
    required this.ticket,
    required this.returnKind,
    required this.needExplanation,
    required this.explanation,
    required this.cheques,
    required this.returnKindDescription,
    required this.fareToReturn,
    required this.sumToReturn,
    required this.faultDistance,
  });

  @override
  TicketReturns copyWith() {
    return TicketReturns(
      number: number,
      ticket: ticket,
      returnKind: returnKind,
      needExplanation: needExplanation,
      explanation: explanation,
      cheques: cheques,
      returnKindDescription: returnKindDescription,
      fareToReturn: fareToReturn,
      sumToReturn: sumToReturn,
      faultDistance: faultDistance,
    );
  }
}
