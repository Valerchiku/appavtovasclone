import 'package:core/domain/entities/app_entities/passenger.dart';
import 'package:core/domain/entities/app_entities/payment.dart';
import 'package:core/domain/entities/app_entities/statused_trip.dart';
import 'package:core/domain/entities/domain_object.dart';

final class User extends DomainObject {
  final String uuid;
  final String phoneNumber;
  final bool showNotifications;
  final List<String>? emails;
  final List<Passenger>? passengers;
  final List<StatusedTrip>? statusedTrips;
  final List<Payment>? paymentHistory;
  final List<List<String>>? searchHistory;
  final List<String>? availableFcmTokens;
  final bool isBlocked;

  const User({
    required this.uuid,
    required this.phoneNumber,
    this.showNotifications = false,
    this.emails,
    this.passengers,
    this.statusedTrips,
    this.paymentHistory,
    this.searchHistory,
    this.availableFcmTokens,
    this.isBlocked = false,
  });

  @override
  List<Object?> get props => [
        uuid,
        phoneNumber,
        showNotifications,
        emails,
        passengers,
        statusedTrips,
        paymentHistory,
        searchHistory,
        availableFcmTokens,
        isBlocked,
      ];

  @override
  User copyWith({
    String? phoneNumber,
    bool? showNotifications,
    List<String>? emails,
    List<Passenger>? passengers,
    List<StatusedTrip>? statusedTrips,
    List<Payment>? paymentHistory,
    List<List<String>>? searchHistory,
    List<String>? availableFcmTokens,
    bool? isBlocked,
    bool shouldClearEmails = false,
    bool shouldClearPassengers = false,
    bool shouldClearStatusedTrips = false,
    bool shouldClearPaymentHistory = false,
    bool shouldClearSearchHistory = false,
  }) {
    return User(
      uuid: uuid,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      showNotifications: showNotifications ?? this.showNotifications,
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
      availableFcmTokens: availableFcmTokens ?? this.availableFcmTokens,
      isBlocked: isBlocked ?? this.isBlocked,
    );
  }

  const User.unauthorized()
      : uuid = '-1',
        phoneNumber = '-1',
        showNotifications = false,
        emails = null,
        passengers = null,
        statusedTrips = null,
        paymentHistory = null,
        searchHistory = null,
        availableFcmTokens = null,
        isBlocked = false;

  const User.unfounded()
      : uuid = '0',
        phoneNumber = '0',
        showNotifications = false,
        emails = null,
        passengers = null,
        statusedTrips = null,
        paymentHistory = null,
        searchHistory = null,
        availableFcmTokens = null,
        isBlocked = false;
}
