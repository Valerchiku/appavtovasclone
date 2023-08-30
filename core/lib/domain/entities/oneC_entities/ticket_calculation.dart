import 'package:core/domain/entities/domain_object.dart';
import 'package:core/domain/entities/oneC_entities/ticket_calculation_fee.dart';

final class TicketCalculation extends DomainObject {
  final String fareDiscount;
  final String fareAmount;
  final List<TicketCalculationFee> fees;
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

  const TicketCalculation({
      required this.fareDiscount,
      required this.fareAmount,
      required this.fees,
      required this.totalDiscount,
      required this.totalAmount,
  });

  @override
TicketCalculation copyWith() {
    return TicketCalculation(
      fareDiscount: fareDiscount,
      fareAmount: fareAmount,
      fees: fees,
      totalDiscount: totalDiscount,
      totalAmount: totalAmount,
    );
  }
}
