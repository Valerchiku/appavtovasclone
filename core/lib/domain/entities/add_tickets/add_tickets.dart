import 'package:core/domain/entities/domain_object.dart';

final class AddTickets extends DomainObject {
  final String orderId;
  final String fareName;
  final String seatNum;
  final List<AddTicketItem> items

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        orderId,
        fareName,
        seatNum,
        items,
      ];

  const AddTickets({
    required this.orderId,
    required this.fareName,
    required this.seatNum,
    required this.items,
  });

  @override
  AddTickets copyWith() {
    return AddTickets(
      orderId: orderId,
      fareName: fareName,
      seatNum: seatNum,
      items: items,
    );
  }
}
