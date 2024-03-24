import 'package:core/domain/entities/domain_object.dart';

final class AuxiliaryAddTicket extends DomainObject {
  final String fares;
  final String seats;
  final String? parentTicketSeatNum;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        fares,
        seats,
        parentTicketSeatNum,
      ];

  const AuxiliaryAddTicket({
    required this.fares,
    required this.seats,
    this.parentTicketSeatNum,
  });

  @override
  AuxiliaryAddTicket copyWith({
    String? orderId,
    String? fares,
    String? seats,
    String? parentTicketSeatNum,
  }) {
    return AuxiliaryAddTicket(
      fares: fares ?? this.fares,
      seats: seats ?? this.seats,
      parentTicketSeatNum: parentTicketSeatNum,
    );
  }
}
