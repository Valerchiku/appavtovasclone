import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/single_trip/single_trip_fares.dart';

final class SingleTripFaresMapper implements BaseMapper<SingleTripFares> {
  @override
  Map<String, dynamic> toJson(SingleTripFares data) {
    return {
      _Fields.name: data.name,
      _Fields.caption: data.caption,
      _Fields.seatType: data.seatType,
      _Fields.lowAgeLimit: data.lowAgeLimit,
      _Fields.highAgeLimit: data.highAgeLimit,
      _Fields.onlyWithPassenger: data.onlyWithPassenger,
      _Fields.cost: data.cost,
    };
  }

  @override
  SingleTripFares fromJson(Map<String, dynamic> json) {
    return SingleTripFares(
      name: json[_Fields.name],
      caption: json[_Fields.caption],
      seatType: json[_Fields.seatType],
      lowAgeLimit: json[_Fields.lowAgeLimit],
      highAgeLimit: json[_Fields.highAgeLimit],
      onlyWithPassenger: json[_Fields.onlyWithPassenger],
      cost: json[_Fields.cost],
    );
  }
}

abstract final class _Fields {
  static const String name = 'name';
  static const String caption = 'caption';
  static const String seatType = 'seatType';
  static const String lowAgeLimit = 'lowAgeLimit';
  static const String highAgeLimit = 'highAgeLimit';
  static const String onlyWithPassenger = 'onlyWithPassenger';
  static const String cost = 'cost';
}
