import 'package:core/domain/entities/domain_object.dart';

final class AddTicketSeat extends DomainObject {
  final String fareName;
  final String seatNum;
  final String destination;
  final String ticketNumber;
  final String parentTicketSeatNum;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        fareName,
        seatNum,
        destination,
        ticketNumber,
        parentTicketSeatNum,
      ];

  const AddTicketSeat({
    required this.fareName,
    required this.seatNum,
    this.destination,
    this.ticketNumber,
    this.parentTicketSeatNum,
  });

  @override
  AddTicketSeat copyWith() {
    return AddTicketSeat(
      fareName: fareName,
      seatNum: seatNum,
      destination: destination,
      ticketNumber: ticketNumber,
      parentTicketSeatNum: parentTicketSeatNum,
    );
  }
}
