import 'package:core/domain/entities/app_entities/passenger.dart';
import 'package:core/domain/entities/app_entities/payment.dart';
import 'package:core/domain/entities/app_entities/statused_trip.dart';
import 'package:core/domain/entities/domain_object.dart';

final class User extends DomainObject {
  final String uuid;
  final String phoneNumber;
  final List<String>? emails;
  final List<Passenger>? passengers;
  final List<StatusedTrip>? statusedTrips;
  final List<Payment>? paymentHistory;

  // TODO(dev): Maybe we should use a List of BusStop instead?
  final List<List<String>>? searchHistory;

  const User({
    required this.uuid,
    required this.phoneNumber,
    this.emails,
    this.passengers,
    this.statusedTrips,
    this.paymentHistory,
    this.searchHistory,
  });

  @override
  List<Object?> get props => [
        uuid,
        phoneNumber,
        emails,
        passengers,
        statusedTrips,
        paymentHistory,
        searchHistory,
      ];

  @override
  DomainObject copyWith({
    String? phoneNumber,
    List<String>? emails,
    List<Passenger>? passengers,
    List<StatusedTrip>? statusedTrips,
    List<Payment>? paymentHistory,
    List<List<String>>? searchHistory,
    bool shouldClearEmails = false,
    bool shouldClearPassengers = false,
    bool shouldClearStatusedTrips = false,
    bool shouldClearPaymentHistory = false,
    bool shouldClearSearchHistory = false,
  }) {
    return User(
      uuid: uuid,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      emails: shouldClearEmails ? emails : emails ?? this.emails,
      passengers:
          shouldClearPassengers ? passengers : passengers ?? this.passengers,
      statusedTrips: shouldClearStatusedTrips
          ? statusedTrips
          : statusedTrips ?? this.statusedTrips,
      paymentHistory: shouldClearPaymentHistory
          ? paymentHistory
          : paymentHistory ?? this.paymentHistory,
      searchHistory: shouldClearSearchHistory
          ? searchHistory
          : searchHistory ?? this.searchHistory,
    );
  }
}
