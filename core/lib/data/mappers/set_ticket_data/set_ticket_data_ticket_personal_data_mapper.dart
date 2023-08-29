import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/data/mappers/set_ticket_data/value_variant_mapper.dart';
import 'package:core/domain/entities/set_ticket_data/set_ticket_data_ticket_personal_data.dart';
import 'package:core/domain/entities/set_ticket_data/value_variant.dart';

final class SetTicketDataTicketPersonalDataMapper
    implements BaseMapper<SetTicketDataTicketPersonalData> {
  @override
  Map<String, dynamic> toJson(SetTicketDataTicketPersonalData data) {
    return {
      _Fields.name: data.name,
      _Fields.caption: data.caption,
      _Fields.mandatory: data.mandatory,
      _Fields.personIdentifier: data.personIdentifier,
      _Fields.type: data.type,
      _Fields.valueVariants:
          data.valueVariants.map(ValueVariantMapper().toJson).toList(),
      _Fields.inputMask: data.inputMask,
      _Fields.value: data.value,
      _Fields.valueKind: data.valueKind,
      _Fields.defaultValueVariant: data.defaultValueVariant,
      _Fields.documentIssueDateRequired: data.documentIssueDateRequired,
      _Fields.documentIssueOrRequired: data.documentIssueOrRequired,
      _Fields.documentValidityDateRequired: data.documentValidityDateRequired,
      _Fields.documentInceptionDateRequired: data.documentInceptionDateRequired,
      _Fields.documentIssuePlaceRequired: data.documentIssuePlaceRequired,
      _Fields.value1: data.value1,
      _Fields.value2: data.value2,
      _Fields.value3: data.value3,
      _Fields.value4: data.value4,
      _Fields.value5: data.value5,
      _Fields.group: data.group,
      _Fields.readonly: data.readonly,
    };
  }

  @override
  SetTicketDataTicketPersonalData fromJson(Map<String, dynamic> json) {
    final jsonValueVariants = json[_Fields.valueVariants];

    final valueVariants = <ValueVariant>[];

    if (jsonValueVariants is Map<String, dynamic>) {
      valueVariants.add(
        ValueVariantMapper().fromJson(jsonValueVariants),
      );
    } else if (jsonValueVariants is List<dynamic>) {
      valueVariants.addAll(
        jsonValueVariants.map(
          (el) => ValueVariantMapper().fromJson(
            el as Map<String, dynamic>,
          ),
        ),
      );
    }

    return SetTicketDataTicketPersonalData(
      name: json[_Fields.name],
      caption: json[_Fields.caption],
      mandatory: json[_Fields.mandatory],
      personIdentifier: json[_Fields.personIdentifier],
      type: json[_Fields.type],
      valueVariants: valueVariants,
      inputMask: json[_Fields.inputMask],
      value: json[_Fields.value],
      valueKind: json[_Fields.valueKind],
      defaultValueVariant: json[_Fields.defaultValueVariant],
      documentIssueDateRequired: json[_Fields.documentIssueDateRequired],
      documentIssueOrRequired: json[_Fields.documentIssueOrRequired],
      documentValidityDateRequired: json[_Fields.documentValidityDateRequired],
      documentInceptionDateRequired:
          json[_Fields.documentInceptionDateRequired],
      documentIssuePlaceRequired: json[_Fields.documentIssuePlaceRequired],
      value1: json[_Fields.value1],
      value2: json[_Fields.value2],
      value3: json[_Fields.value3],
      value4: json[_Fields.value4],
      value5: json[_Fields.value5],
      group: json[_Fields.group],
      readonly: json[_Fields.readonly],
    );
  }
}

abstract final class _Fields {
  static const String name = 'Name';
  static const String caption = 'Caption';
  static const String mandatory = 'Mandatory';
  static const String personIdentifier = 'PersonIdentifier';
  static const String type = 'Type';
  static const String valueVariants = 'ValueVariants';
  static const String inputMask = 'InputMask';
  static const String value = 'Value';
  static const String valueKind = 'ValueKind';
  static const String defaultValueVariant = 'DefaultValueVariant';
  static const String documentIssueDateRequired = 'DocumentIssueDateRequired';
  static const String documentIssueOrRequired = 'DocumentIssueOrRequired';
  static const String documentValidityDateRequired =
      'DocumentValidityDateRequired';
  static const String documentInceptionDateRequired =
      'DocumentInceptionDateRequired';
  static const String documentIssuePlaceRequired = 'DocumentIssuePlaceRequired';
  static const String value1 = 'Value1';
  static const String value2 = 'Value2';
  static const String value3 = 'Value3';
  static const String value4 = 'Value4';
  static const String value5 = 'Value5';
  static const String group = 'Group';
  static const String readonly = 'Readonly';
}
