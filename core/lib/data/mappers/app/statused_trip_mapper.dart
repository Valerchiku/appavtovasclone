import 'dart:convert';

import 'package:core/avtovas_core.dart';
import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/data/mappers/single_trip/single_trip_mapper.dart';

abstract final class _Fields {
  static const String uuid = 'uuid';
  static const String tripStatus = 'trip_status';
  static const String tripCostStatus = 'trip_cost_status';
  static const String saleDate = 'sale_date';
  static const String saleCost = 'sale_cost';
  static const String places = 'places';
  static const String trip = 'trip';
  static const String paymentUuid = 'payment_uuid';
  static const String passengers = 'passengers';
  static const String orderNum = 'order_num';
}

final class StatusedTripMapper implements BaseMapper<StatusedTrip> {
  @override
  Map<String, dynamic> toJson(StatusedTrip data) {
    final encodedPassengers = jsonEncode(
      data.passengers
          .map(
            (e) => jsonEncode(PassengerMapper().toJson(e)),
          )
          .toList(),
    );

    return {
      _Fields.uuid: data.uuid,
      _Fields.trip: jsonEncode(SingleTripMapper().toJson(data.trip)),
      _Fields.saleDate: data.saleDate.toString(),
      _Fields.saleCost: data.saleCost,
      _Fields.places: data.places,
      _Fields.tripStatus: data.tripStatus.name,
      _Fields.tripCostStatus: data.tripCostStatus.name,
      _Fields.paymentUuid: data.paymentUuid,
      _Fields.passengers: encodedPassengers,
      _Fields.orderNum: data.orderNum,
    };
  }

  @override
  StatusedTrip fromJson(Map<String, dynamic> json) {
    final passengersJson = json[_Fields.passengers];

    final decodedPassengers = (jsonDecode(passengersJson) as List<dynamic>)
        .map(
          (e) => PassengerMapper().fromJson(
            jsonDecode(e),
          ),
        )
        .toList();

    return StatusedTrip(
      uuid: json[_Fields.uuid],
      trip: SingleTripMapper().fromJson(
        jsonDecode(json[_Fields.trip]),
      ),
      saleDate: DateTime.parse(json[_Fields.saleDate]),
      saleCost: json[_Fields.saleCost],
      places: (json[_Fields.places] as List<dynamic>)
          .map((e) => e.toString())
          .toList(),
      tripStatus: UserTripStatusHelper.tripStatusFromString(
        json[_Fields.tripStatus],
      ),
      tripCostStatus: UserTripStatusHelper.tripCostStatusFromString(
        json[_Fields.tripCostStatus],
      ),
      paymentUuid: json[_Fields.paymentUuid],
      passengers: decodedPassengers,
      orderNum: json[_Fields.orderNum],
    );
  }
}
