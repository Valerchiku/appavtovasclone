import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/set_ticket_data/value_variant.dart';

abstract final class _Fields {
  static const String name = 'Name';
  static const String inputMask = 'InputMask';
  static const String value1 = 'Value1';
  static const String value2 = 'Value2';
  static const String value3 = 'Value3';
  static const String value4 = 'Value4';
  static const String value5 = 'Value5';
}

final class ValueVariantMapper implements BaseMapper<ValueVariant> {
  @override
  Map<String, dynamic> toJson(ValueVariant data) {
    return {
      _Fields.name: data.name,
      _Fields.inputMask: data.inputMask,
      _Fields.value1: data.value1,
      _Fields.value2: data.value2,
      _Fields.value3: data.value3,
      _Fields.value4: data.value4,
      _Fields.value5: data.value5,
    };
  }

  @override
  ValueVariant fromJson(Map<String, dynamic> json) {
    return ValueVariant(
      name: json[_Fields.name],
      inputMask: json[_Fields.inputMask],
      value1: json[_Fields.value1],
      value2: json[_Fields.value2],
      value3: json[_Fields.value3],
      value4: json[_Fields.value4],
      value5: json[_Fields.value5],
    );
  }
}
