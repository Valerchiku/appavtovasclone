import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/trip/carrier_default_value_variant.dart';

final class CarrierDefaultValueVariantMapper
    implements BaseMapper<CarrierDefaultValueVariant> {
  @override
  Map<String, dynamic> toJson(CarrierDefaultValueVariant data) {
    return {
      _Fields.name: data.name,
      _Fields.inputMask: data.inputMask,
    };
  }

  @override
  CarrierDefaultValueVariant fromJson(Map<String, dynamic> json) {
    return CarrierDefaultValueVariant(
      name: json[_Fields.name],
      inputMask: json[_Fields.inputMask],
    );
  }
}

abstract final class _Fields {
  static const String name = 'Name';
  static const String inputMask = 'InputMask';
}
