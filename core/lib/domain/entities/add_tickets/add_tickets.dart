import 'package:core/domain/entities/domain_object.dart';
import 'package:core/domain/entities/add_tickets/add_tickets_seat.dart';

final class AddTickets extends DomainObject {
  final String orderId;
  final List<AddTicketsSeat> ticketSeats;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        orderId,
        ticketSeats,
      ];

  const AddTickets({
    required this.orderId,
    required this.ticketSeats,
  });

  @override
  AddTickets copyWith() {
    return AddTickets(
      orderId: orderId,
      ticketSeats: ticketSeats,
    );
  }
}
