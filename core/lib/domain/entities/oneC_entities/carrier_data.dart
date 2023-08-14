import 'package:core/domain/entities/domain_object.dart';
import 'package:core/domain/entities/oneC_entities/carrier_personal_data.dart';

class CarrierData extends DomainObject {
  final String carrierName;
  final String carrierTaxId;
  final String carrierStateRegNum;
  final CarrierPersonalData carrierPersonalData;
  final String carrierAddress;
  final String carrierWorkingHours;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        carrierName,
        carrierTaxId,
        carrierStateRegNum,
        carrierPersonalData,
        carrierAddress,
        carrierWorkingHours,
      ];

  const CarrierData({
    required this.carrierName,
    required this.carrierTaxId,
    required this.carrierStateRegNum,
    required this.carrierPersonalData,
    required this.carrierAddress,
    required this.carrierWorkingHours,
  });

  @override
  CarrierData copyWith() {
    return CarrierData(
      carrierName: carrierName,
      carrierTaxId: carrierTaxId,
      carrierStateRegNum: carrierStateRegNum,
      carrierPersonalData: carrierPersonalData,
      carrierAddress: carrierAddress,
      carrierWorkingHours: carrierWorkingHours,
    );
  }
}
