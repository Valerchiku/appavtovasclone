import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/data/mappers/trip/carrier_default_value_variant_mapper.dart';
import 'package:core/domain/entities/trip/carrier_personal_data.dart';

final class CarrierPersonalDataMapper
    implements BaseMapper<CarrierPersonalData> {
  @override
  Map<String, dynamic> toJson(CarrierPersonalData data) {
    return {
      _Fields.name: data.name,
      _Fields.caption: data.caption,
      _Fields.mandatory: data.mandatory,
      _Fields.personIdentifier: data.personIdentifier,
      _Fields.type: data.type,
      _Fields.inputMask: data.inputMask,
      _Fields.value: data.value,
      _Fields.valueKind: data.valueKind,
      _Fields.defaultValueVariant: data.defaultValueVariant,
    };
  }

  @override
  CarrierPersonalData fromJson(Map<String, dynamic> json) {
    return CarrierPersonalData(
      name: json[_Fields.name],
      caption: json[_Fields.caption],
      mandatory: json[_Fields.mandatory],
      personIdentifier: json[_Fields.personIdentifier],
      type: json[_Fields.type],
      inputMask: json[_Fields.inputMask],
      value: json[_Fields.value],
      valueKind: json[_Fields.valueKind],
      defaultValueVariant: CarrierDefaultValueVariantMapper().fromJson(
        json[_Fields.defaultValueVariant],
      ),
    );
  }
}

abstract final class _Fields {
  static const String name = 'Name';
  static const String caption = 'Caption';
  static const String mandatory = 'Mandatory';
  static const String personIdentifier = 'PersonIdentifier';
  static const String type = 'Type';
  static const String inputMask = 'InputMask';
  static const String value = 'Value';
  static const String valueKind = 'ValueKind';
  static const String defaultValueVariant = 'DefaultValueVariant';
}
