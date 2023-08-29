import 'package:core/domain/entities/domain_object.dart';

final class AddTicketsSeat extends DomainObject {
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

  const AddTicketsSeat({
    required this.fareName,
    required this.seatNum,
    required this.destination,
    required this.ticketNumber,
    required this.parentTicketSeatNum,
  });

  @override
  AddTicketsSeat copyWith() {
    return AddTicketsSeat(
      fareName: fareName,
      seatNum: seatNum,
      destination: destination,
      ticketNumber: ticketNumber,
      parentTicketSeatNum: parentTicketSeatNum,
    );
  }
}
