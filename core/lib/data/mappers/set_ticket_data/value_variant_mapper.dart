import 'package:core/data/mappers/base_mapper.dart';

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
      _Fields.uuid: data.uuid,
      _Fields.phoneNumber: data.phoneNumber,
      _Fields.emails: data.emails,
      _Fields.statusedTrips:
          data.statusedTrips?.map(StatusedTripMapper().toJson).toList(),
      _Fields.passengers:
          data.passengers?.map(PassengerMapper().toJson).toList(),
      _Fields.paymentHistory:
          data.paymentHistory?.map(PaymentMapper().toJson).toList(),
      _Fields.searchHistory: data.searchHistory,
    };
  }

  @override
  ValueVariant fromJson(Map<String, dynamic> json) {
    final searchHistory = json[_Fields.searchHistory];

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
