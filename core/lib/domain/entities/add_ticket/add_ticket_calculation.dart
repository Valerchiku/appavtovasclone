import 'package:core/domain/entities/domain_object.dart';

final class AddTicketCalculation extends DomainObject {
  final String fareDiscount;
  final String fareAmount;
  final String totalDiscount;
  final String totalAmount;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        fareDiscount,
        fareAmount,
        totalDiscount,
        totalAmount,
      ];

  const AddTicketCalculation({
    required this.fareDiscount,
    required this.fareAmount,
    required this.totalDiscount,
    required this.totalAmount,
  });

  @override
  AddTicketCalculation copyWith() {
    return AddTicketCalculation(
      fareDiscount: fareDiscount,
      fareAmount: fareAmount,
      totalDiscount: totalDiscount,
      totalAmount: totalAmount,
    );
  }
}
