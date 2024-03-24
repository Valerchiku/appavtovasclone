import 'package:core/domain/entities/domain_object.dart';
import 'package:core/domain/entities/return_one_c_payment/return_one_c_payment_position.dart';

final class ReturnOneCPaymentPosition extends DomainObject {
  final String name;
  final String sumWithDiscount;
  final String sum54FLWithDiscount;
  final String vAT;
  final String vAT54FL;
  final ReturnOneCPaymentPositionPuryevorData puryevorData;
  final String signCalculationObject;
  final String signMethodCalculation;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        name,
        sumWithDiscount,
        sum54FLWithDiscount,
        vAT,
        vAT54FL,
        puryevorData,
        signCalculationObject,
        signMethodCalculation,
      ];

  const ReturnOneCPaymentPosition({
    required this.name,
    required this.sumWithDiscount,
    required this.sum54FLWithDiscount,
    required this.vAT,
    required this.vAT54FL,
    required this.puryevorData,
    required this.signCalculationObject,
    required this.signMethodCalculation,
  });

  @override
  ReturnOneCPaymentPosition copyWith() {
    return ReturnOneCPaymentPosition(
      name: name,
      sumWithDiscount: sumWithDiscount,
      sum54FLWithDiscount: sum54FLWithDiscount,
      vAT: vAT,
      vAT54FL: vAT54FL,
      puryevorData: puryevorData,
      signCalculationObject: signCalculationObject,
      signMethodCalculation: signMethodCalculation,
    );
  }
}