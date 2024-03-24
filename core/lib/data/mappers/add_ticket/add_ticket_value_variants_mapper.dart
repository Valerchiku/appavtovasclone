import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/add_ticket/add_ticket_value_variant.dart';

final class AddTicketValueVariantsMapper
    implements BaseMapper<AddTicketValueVariants> {
  @override
  Map<String, dynamic> toJson(AddTicketValueVariants data) {
    return {
      _Fields.name: data.name,
      _Fields.inputMask: data.inputMask,
    };
  }

  @override
  AddTicketValueVariants fromJson(Map<String, dynamic> json) {
    return AddTicketValueVariants(
      name: json[_Fields.name] ?? '',
      inputMask: json[_Fields.inputMask] ?? '',
    );
  }
}

abstract final class _Fields {
  static const String name = 'Name';
  static const String inputMask = 'InputMask';
}
