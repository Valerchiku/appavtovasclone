import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/set_ticket_data/set_ticket_data_ticket_additional_attribute.dart';
import 'package:core/data/mappers/set_ticket_data/value_variant_mapper.dart';

abstract final class _Fields {
  static const String name = 'Name';
  static const String caption = 'Caption';
  static const String mandatory = 'Mandatory';
  static const String type = 'Type';
  static const String valueVariants = 'ValueVariants';
  static const String inputMask = 'InputMask';
  static const String value = 'Value';
  static const String costAttribute = 'CostAttribute';
  static const String group = 'Group';
}

final class SetTicketDataTicketAdditionalAttributeMapper implements BaseMapper<SetTicketDataTicketAdditionalAttribute> {
  @override
  Map<String, dynamic> toJson(SetTicketDataTicketAdditionalAttribute data) {
    return {
      _Fields.name: data.name,
      _Fields.caption: data.caption,
      _Fields.mandatory: data.mandatory,
      _Fields.type: data.type,
      _Fields.valueVariants: data.valueVariants?.map(ValueVariantMapper().toJson).toList(),
      _Fields.inputMask: data.inputMask,
      _Fields.value: data.value,
      _Fields.costAttribute: data.costAttribute,
      _Fields.group: data.group,
    };
  }

  @override
  SetTicketDataTicketAdditionalAttribute fromJson(Map<String, dynamic> json) {
    final valueVariants = json[_Fields.valueVariants];
    return SetTicketDataTicketAdditionalAttribute(
      name: json[_Fields.name],
      caption: json[_Fields.caption],
      mandatory: json[_Fields.mandatory],
      type: json[_Fields.type],
      valueVariants: valueVariants != null
          ? (valueVariants as List<dynamic>)
              .map((e) => ValueVariantMapper().fromJson(e))
              .toList()
          : List.empty(),
      inputMask: json[_Fields.inputMask],
      value: json[_Fields.value],
      costAttribute: json[_Fields.costAttribute],
      group: json[_Fields.group],
    );
  }
}
