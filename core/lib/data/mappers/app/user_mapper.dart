import 'package:core/data/mappers/app/passenger_mapper.dart';
import 'package:core/data/mappers/app/payment_mapper.dart';
import 'package:core/data/mappers/app/statused_trip_mapper.dart';
import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/app_entities/user.dart';

abstract final class _Fields {
  static const String uuid = 'uuid';
  static const String phoneNumber = 'phoneNumber';
  static const String emails = 'emails';
  static const String statusedTrips = 'statusedTrips';
  static const String passengers = 'passengers';
  static const String paymentHistory = 'paymentHistory';
  static const String searchHistory = 'searchHistory';
}

final class UserMapper implements BaseMapper<User> {
  @override
  Map<String, dynamic> toJson(User data) {
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
  User fromJson(Map<String, dynamic> json) {
    final statusedTrips = json[_Fields.statusedTrips];
    final passengers = json[_Fields.passengers];
    final paymentHistory = json[_Fields.paymentHistory];
    final searchHistory = json[_Fields.searchHistory];

    return User(
      uuid: json[_Fields.uuid],
      phoneNumber: json[_Fields.phoneNumber],
      emails: json[_Fields.emails],
      statusedTrips: statusedTrips != null
          ? (statusedTrips as List<dynamic>)
              .map((e) => StatusedTripMapper().fromJson(e))
              .toList()
          : null,
      passengers: passengers != null
          ? (passengers as List<Map<String, dynamic>>)
              .map(PassengerMapper().fromJson)
              .toList()
          : null,
      paymentHistory: paymentHistory != null
          ? (paymentHistory as List<Map<String, dynamic>>)
              .map(PaymentMapper().fromJson)
              .toList()
          : null,
      searchHistory: searchHistory,
    );
  }
}
