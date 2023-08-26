import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/data/mappers/oneC_mappers/departure_mapper.dart';
import 'package:core/data/mappers/oneC_mappers/destination_mapper.dart';
import 'package:core/data/mappers/single_trip/single_trip_mapper.dart';
import 'package:core/domain/entities/start_sale_session/start_sale_session.dart';

final class StartSaleSessionMapper implements BaseMapper<StartSaleSession> {
  @override
  Map<String, dynamic> toJson(StartSaleSession data) {
    return {
      _Fields.number: data.number,
      _Fields.trip: SingleTripMapper().toJson(
        data.trip,
      ),
      _Fields.departure: DepartureMapper().toJson(
        data.departure,
      ),
      _Fields.departureTime: data.departureTime,
      _Fields.destination: DestinationMapper().toJson(
        data.destination,
      ),
      _Fields.amount: data.amount,
      _Fields.services: data.services,
      _Fields.currency: data.currency,
    };
  }

  @override
  StartSaleSession fromJson(Map<String, dynamic> json) {
    return StartSaleSession(
      number: json[_Fields.number] ?? '',
      trip: SingleTripMapper().fromJson(
        json[_Fields.trip],
      ),
      departure: DepartureMapper().fromJson(
        json[_Fields.departure],
      ),
      departureTime: json[_Fields.departureTime] ?? '',
      destination: DestinationMapper().fromJson(
        json[_Fields.destination],
      ),
      amount: json[_Fields.amount] ?? '',
      services: json[_Fields.services] ?? '',
      currency: json[_Fields.currency] ?? '',
    );
  }
}

abstract final class _Fields {
  static const String number = 'Number';
  static const String trip = 'Trip';
  static const String departure = 'Departure';
  static const String departureTime = 'departureTime';
  static const String destination = 'Destination';
  static const String amount = 'Amount';
  static const String services = 'Services';
  static const String currency = 'Currency';
}
