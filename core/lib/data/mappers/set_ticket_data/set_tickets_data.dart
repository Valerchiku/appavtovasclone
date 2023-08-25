import 'package:core/domain/entities/domain_object.dart';

final class SetTicketData extends DomainObject {
  final String orderId;
  final List<SetTicketDataTicket> tickets;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
          orderId,
          tickets,
      ];

  const SetTicketData({
    required this.orderId,
    required this.tickets,
  });

  @override
  SingleTripFares copyWith() {
    return SetTicketData(
      orderId: orderId,
      tickets: tickets,
    );
  }
}
