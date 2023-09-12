// ignore_for_file: lines_longer_than_80_chars

import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/data/mappers/one_c_mappers/carrier_personal_data_mapper.dart';
import 'package:core/domain/entities/one_c_entities/carrier_data.dart';
import 'package:core/domain/entities/one_c_entities/carrier_personal_data.dart';

final class CarrierDataMapper implements BaseMapper<CarrierData> {
  @override
  Map<String, dynamic> toJson(CarrierData data) {
    return {
      _Fields.carrierName: data.carrierName,
      _Fields.carrierTaxId: data.carrierTaxId,
      _Fields.carrierStateRegNum: data.carrierStateRegNum,
      _Fields.carrierPersonalData: data.carrierPersonalData
          .map(CarrierPersonalDataMapper().toJson)
          .toList(),
      _Fields.carrierAddress: data.carrierAddress,
      _Fields.carrierWorkingHours: data.carrierWorkingHours,
    };
  }

  @override
  CarrierData fromJson(Map<String, dynamic> json) {
    final jsonCarrierPersonalData = json[_Fields.carrierPersonalData];

    final carrierPersonalData = <CarrierPersonalData>[];

    if (jsonCarrierPersonalData is Map<String, dynamic>) {
      carrierPersonalData.add(
        CarrierPersonalDataMapper().fromJson(jsonCarrierPersonalData),
      );
    } else if (jsonCarrierPersonalData is List<dynamic>) {
      carrierPersonalData.addAll(
        jsonCarrierPersonalData.map(
          (el) => CarrierPersonalDataMapper().fromJson(
            el as Map<String, dynamic>,
          ),
        ),
      );
    }

    return CarrierData(
      carrierName: _Fields.carrierName,
      carrierTaxId: _Fields.carrierTaxId,
      carrierStateRegNum: _Fields.carrierStateRegNum,
      carrierPersonalData: carrierPersonalData,
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
