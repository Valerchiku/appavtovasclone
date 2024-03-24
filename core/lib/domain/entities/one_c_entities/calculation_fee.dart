import 'package:core/domain/entities/domain_object.dart';

final class CalculationFee extends DomainObject {
  
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

  const CalculationFee({
      required this.name,
      required this.discount,
      required this.amount,
      required this.carriersFee,
  });

  @override
  CalculationFee copyWith() {
    return CalculationFee(
      name: name,
      discount: discount,
      amount: amount,
      carriersFee: carriersFee,
    );
  }
}
