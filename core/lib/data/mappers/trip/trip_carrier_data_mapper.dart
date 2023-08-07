// ignore_for_file: lines_longer_than_80_chars

import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/data/mappers/trip/carrier_personal_data_mapper.dart';
import 'package:core/domain/entities/trip/trip_carrier_data.dart';

final class TripCarrierDataMapper implements BaseMapper<TripCarrierData> {
  @override
  Map<String, dynamic> toJson(TripCarrierData data) {
    return {
      _Fields.carrierName: data.carrierName,
      _Fields.carrierTaxId: data.carrierTaxId,
      _Fields.carrierStateRegNum: data.carrierStateRegNum,
      _Fields.carrierPersonalData: data.carrierPersonalData,
      _Fields.carrierAddress: data.carrierAddress,
      _Fields.carrierWorkingHours: data.carrierWorkingHours,
    };
  }

  @override
  TripCarrierData fromJson(Map<String, dynamic> json) {
    return TripCarrierData(
      carrierName: _Fields.carrierName,
      carrierTaxId: _Fields.carrierTaxId,
      carrierStateRegNum: _Fields.carrierStateRegNum,
      carrierPersonalData: CarrierPersonalDataMapper().fromJson(
        json[_Fields.carrierPersonalData],
      ),
      carrierAddress: _Fields.carrierAddress,
      carrierWorkingHours: _Fields.carrierWorkingHours,
    );
  }
}

abstract final class _Fields {
  static const String carrierName = 'Name';
  static const String carrierTaxId = 'CarrierTaxId';
  static const String carrierStateRegNum = 'CarrierStateRegNum';
  static const String carrierPersonalData = 'CarrierPersonalData';
  static const String carrierAddress = 'CarrierAddress';
  static const String carrierWorkingHours = 'CarrierWorkingHours';
}
