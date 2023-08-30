import 'package:core/domain/entities/domain_object.dart';

final class OccupiedSeat extends DomainObject {
  final String type;
  final String number;
  final String status;
  final String parentTicketSeatNum;
  final String forCurrentOrder;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        type,
        number,
        status,
        parentTicketSeatNum,
        forCurrentOrder,
      ];

  const OccupiedSeat({
    required this.type,
    required this.number,
    required this.status,
    required this.parentTicketSeatNum,
    required this.forCurrentOrder,
  });

  @override
  OccupiedSeat copyWith() {
    return OccupiedSeat(
      type: type,
      number: number,
      status: status,
      parentTicketSeatNum: parentTicketSeatNum,
      forCurrentOrder: forCurrentOrder,
    );
  }
}
