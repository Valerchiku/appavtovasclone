// ignore_for_file: lines_longer_than_80_chars

import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/data/mappers/one_c_mappers/carrier_personal_data_mapper.dart';
import 'package:core/domain/entities/one_c_entities/carrier_data.dart';

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

    return CarrierData(
      carrierName: json[_Fields.carrierName] ?? '',
      carrierTaxId: json[_Fields.carrierTaxId] ?? '',
      carrierStateRegNum: json[_Fields.carrierStateRegNum] ?? '',
      carrierPersonalData: jsonCarrierPersonalData is List<dynamic>
          ? jsonCarrierPersonalData
              .map((e) => CarrierPersonalDataMapper().fromJson(e))
              .toList()
          : jsonCarrierPersonalData == null
              ? []
              : [CarrierPersonalDataMapper().fromJson(jsonCarrierPersonalData)],
      carrierAddress: json[_Fields.carrierAddress] ?? '',
      carrierWorkingHours: json[_Fields.carrierWorkingHours] ?? '',
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
