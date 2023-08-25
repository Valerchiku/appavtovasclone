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
    return const SingleTripFares(
      name: _Fields.name,
      caption: _Fields.caption,
      seatType: _Fields.seatType,
      lowAgeLimit: _Fields.lowAgeLimit,
      highAgeLimit: _Fields.highAgeLimit,
      onlyWithPassenger: _Fields.onlyWithPassenger,
      cost: _Fields.cost,
    );
  }
}

abstract final class _Fields {
  static const String name = 'Name';
  static const String caption = 'Caption';
  static const String seatType = 'SeatType';
  static const String lowAgeLimit = 'LowAgeLimit';
  static const String highAgeLimit = 'HighAgeLimit';
  static const String onlyWithPassenger = 'OnlyWithPassenger';
  static const String cost = 'Cost';
}
