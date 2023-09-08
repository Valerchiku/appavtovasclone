import 'dart:convert';

import 'package:core/data/mappers/app/passenger_mapper.dart';
import 'package:core/data/mappers/app/payment_history_mapper.dart';
import 'package:core/data/mappers/app/statused_trip_mapper.dart';
import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/app_entities/user.dart';

abstract final class _Fields {
  static const String uuid = 'uuid';
  static const String phoneNumber = 'phone_number';
  static const String showNotifications = 'show_notifications';
  static const String emails = 'emails';
  static const String statusedTrips = 'statused_trips';
  static const String passengers = 'passengers';
  static const String paymentHistory = 'payment_history';
  static const String searchHistory = 'search_history';
  static const String isBlocked = 'is_blocked';
}

final class UserMapper implements BaseMapper<User> {
  @override
  Map<String, dynamic> toJson(User data) {
    return {
      _Fields.uuid: data.uuid,
      _Fields.phoneNumber: data.phoneNumber,
      _Fields.showNotifications: data.showNotifications,
      _Fields.emails: data.emails,
      _Fields.statusedTrips:
          data.statusedTrips?.map(StatusedTripMapper().toJson).toList(),
      _Fields.passengers:
          data.passengers?.map(PassengerMapper().toJson).toList(),
      _Fields.paymentHistory:
          data.paymentHistory?.map(PaymentHistoryMapper().toJson).toList(),
      _Fields.searchHistory: data.searchHistory,
      _Fields.isBlocked: data.isBlocked,
    };
  }

  @override
  User fromJson(Map<String, dynamic> json, {bool fromPostgres = false}) {
    final statusedTrips = json[_Fields.statusedTrips];
    final passengers = json[_Fields.passengers];
    final paymentHistory = json[_Fields.paymentHistory];
    final jsonSearchHistory = json[_Fields.searchHistory];
    final searchHistory = fromPostgres
        ? jsonSearchHistory != null
            ? (jsonSearchHistory as List<dynamic>)
                .map((e) => jsonDecode(e) as List<dynamic>)
                .toList()
            : null
        : jsonSearchHistory;

    return User(
      uuid: json[_Fields.uuid],
      phoneNumber: json[_Fields.phoneNumber],
      showNotifications: json[_Fields.showNotifications],
      emails: json[_Fields.emails],
      statusedTrips: statusedTrips != null
          ? (statusedTrips as List<dynamic>)
              .map(
                (e) => StatusedTripMapper().fromJson(
                  fromPostgres ? jsonDecode(e) : e,
                ),
              )
              .toList()
          : null,
      passengers: passengers != null
          ? (passengers as List<dynamic>)
              .map(
                (e) => PassengerMapper().fromJson(
                  fromPostgres ? jsonDecode(e) : e,
                ),
              )
              .toList()
          : null,
      paymentHistory: paymentHistory != null
          ? (paymentHistory as List<dynamic>)
              .map(
                (e) => PaymentHistoryMapper().fromJson(
                  fromPostgres ? jsonDecode(e) : e,
                ),
              )
              .toList()
          : null,
      searchHistory: searchHistory != null
          ? fromPostgres
              ? (searchHistory as List<List<dynamic>>)
                  // ignore: avoid_dynamic_calls
                  .map((e) => e.map((e) => e.toString()).toList())
                  .toList()
              : searchHistory
          : null,
      isBlocked: json[_Fields.isBlocked],
    );
  }
}
