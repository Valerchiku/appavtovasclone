import 'package:core/data/mappers/add_ticket/add_ticket_value_variants_mapper.dart';
import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/add_ticket/add_ticket_personal_data.dart';

final class AddTicketPersonalDataMapper
    implements BaseMapper<AddTicketPersonalData> {
  @override
  Map<String, dynamic> toJson(AddTicketPersonalData data) {
    return {
      _Fields.name: data.name,
      _Fields.caption: data.caption,
      _Fields.mandatory: data.mandatory,
      _Fields.personIdentifier: data.personIdentifier,
      _Fields.type: data.type,
      _Fields.valueVariants: data.valueVariants,
      _Fields.inputMask: data.inputMask,
      _Fields.value: data.value,
      _Fields.valueKind: data.valueKind,
    };
  }

  @override
  AddTicketPersonalData fromJson(Map<String, dynamic> json) {
    final jsonValueVariants = json[_Fields.valueVariants];

    return AddTicketPersonalData(
      name: json[_Fields.name] ?? '',
      caption: json[_Fields.caption] ?? '',
      mandatory: json[_Fields.mandatory] ?? '',
      personIdentifier: json[_Fields.personIdentifier] ?? '',
      type: json[_Fields.type] ?? '',
      valueVariants: jsonValueVariants is List<dynamic>?
          ? jsonValueVariants
              ?.map((e) => AddTicketValueVariantsMapper().fromJson(e))
              .toList()
          : jsonValueVariants == null
              ? null
              : [AddTicketValueVariantsMapper().fromJson(jsonValueVariants)],
      inputMask: json[_Fields.inputMask] ?? '',
      value: json[_Fields.value] ?? '',
      valueKind: json[_Fields.valueKind] ?? '',
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
}
