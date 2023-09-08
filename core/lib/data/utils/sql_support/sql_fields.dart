import 'dart:convert';

import 'package:core/data/mappers/app/passenger_mapper.dart';
import 'package:core/data/mappers/app/payment_history_mapper.dart';
import 'package:core/data/mappers/app/statused_trip_mapper.dart';
import 'package:core/domain/entities/app_entities/user.dart';

abstract final class SQLFields {
  static Map<String, dynamic> addUserFields(User user) {
    return {
      'uuid': "'${user.uuid}'",
      'phone_number': "'${user.phoneNumber}'",
      'show_notifications': false,
      'emails': user.emails == null
          ? null
          : "ARRAY ${user.emails!.map(
                (e) => "'$e'",
              ).toList()}",
      'passengers': user.passengers == null
          ? null
          : 'ARRAY ${user.passengers!.map(
                (e) => "'${jsonEncode(
                  PassengerMapper().toJson(e),
                )}'",
              ).toList()}',
      'statused_trips': user.statusedTrips == null
          ? null
          : 'ARRAY ${user.statusedTrips!.map(
                (e) => "'${jsonEncode(
                  StatusedTripMapper().toJson(e),
                )}'",
              ).toList()}',
      'payment_history': user.paymentHistory == null
          ? null
          : 'ARRAY ${user.paymentHistory!.map(
                (e) => "'${jsonEncode(
                  PaymentHistoryMapper().toJson(e),
                )}'",
              ).toList()}',
      'search_history': user.searchHistory == null
          ? null
          : 'ARRAY ${user.searchHistory!.map(
                (e) => "'${jsonEncode(e)}'",
              ).toList()}',
    };
  }

  static Map<String, dynamic> updateUniqueUserFields(String userUuid) {
    return {'uuid': "'$userUuid'"};
  }

  static Map<String, dynamic> selectUserByIdFields(String userUuid) {
    return {'uuid': "'$userUuid'"};
  }

  static Map<String, dynamic> selectUserByPhoneFields(String phoneNumber) {
    return {'phone_number': "'$phoneNumber'"};
  }
}
