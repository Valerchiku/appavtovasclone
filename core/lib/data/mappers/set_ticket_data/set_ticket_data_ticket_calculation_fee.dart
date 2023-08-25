import 'package:core/domain/entities/domain_object.dart';

final class SetTicketDataTicketCalculationFee extends DomainObject {
  
final String name;
final String discount;
final String amount;
final String carriersFee;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        name,
        discount,
        amount,
        carriersFee,
      ];

  const SetTicketDataTicketCalculationFee({
      this.name,
      this.discount,
      this.amount,
      this.carriersFee,
  });

  @override
  SetTicketDataTicketCalculationFee copyWith() {
    return SetTicketDataTicketCalculationFee(
      name: name,
      discount: discount,
      amount: amount,
      carriersFee: carriersFee,
    );
  }
}
