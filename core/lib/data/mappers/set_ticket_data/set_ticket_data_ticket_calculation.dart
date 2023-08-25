import 'package:core/domain/entities/domain_object.dart';

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
        fareDiscount: fareDiscount,
        fareAmount: fareAmount,
        totalDiscount: totalDiscount,
        totalAmount: totalAmount,
      ];

  const SetTicketDataTicketPersonalDataCalculation({
      this.fareDiscount,
      required this.fareAmount,
      required this.fees,
      this.totalDiscount,
      this.totalAmount,
  });

  @override
  SetTicketDataTicketPersonalDataCalculation copyWith() {
    return SetTicketDataTicketPersonalDataCalculation(
      fareDiscount: fareDiscount,
      fareAmount: fareAmount,
      totalDiscount: totalDiscount,
      totalAmount: totalAmount,
    );
  }
}
