import 'package:core/domain/entities/domain_object.dart';
import 'package:core/domain/entities/set_ticket_data/set_ticket_data_ticket_calculation_fee.dart';

final class SetTicketDataTicketCalculation extends DomainObject {
  final String fareDiscount;
  final String fareAmount;
  final List<SetTicketDataTicketCalculationFee> fees;
  final String totalDiscount;
  final String totalAmount;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        fareDiscount,
        fareAmount,
        fees,
        totalDiscount,
        totalAmount,
      ];

  const SetTicketDataTicketCalculation({
      required this.fareDiscount,
      required this.fareAmount,
      required this.fees,
      required this.totalDiscount,
      required this.totalAmount,
  });

  @override
SetTicketDataTicketCalculation copyWith() {
    return SetTicketDataTicketCalculation(
      fareDiscount: fareDiscount,
      fareAmount: fareAmount,
      fees: fees,
      totalDiscount: totalDiscount,
      totalAmount: totalAmount,
    );
  }
}
