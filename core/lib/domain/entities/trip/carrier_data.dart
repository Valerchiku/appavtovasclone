import 'package:core/domain/entities/trip/carrier_personal_data.dart';
import 'package:equatable/equatable.dart';

class CarrierData extends Equatable {
  final String? carrierName;
  final String? carrierTaxId;
  final String? carrierStateRegNum;
  final List<CarrierPersonalData>? carrierPersonalData;
  final String? carrierAddress;
  final String? carrierWorkingHours;

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
    this.carrierName,
    this.carrierTaxId,
    this.carrierStateRegNum,
    this.carrierPersonalData,
    this.carrierAddress,
    this.carrierWorkingHours,
  });
}
