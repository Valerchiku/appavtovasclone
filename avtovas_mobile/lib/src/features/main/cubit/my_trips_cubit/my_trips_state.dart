part of 'my_trips_cubit.dart';

final class MyTripsState extends Equatable {
  final List<StatusedTrip>? upcomingStatusedTrips;
  final List<StatusedTrip>? finishedStatusedTrips;
  final List<StatusedTrip>? archiveStatusedTrips;
  final List<StatusedTrip>? declinedStatusedTrips;
  final Map<String, int> timeDifferences;
  final String paidTripUuid;
  final YookassaPayment? paymentObject;
  final String paymentConfirmationUrl;
  final bool pageLoading;
  final bool transparentPageLoading;
  final DateTime? nowUtc;
  final bool shouldShowPaymentError;
  final CustomRoute route;

  @override
  List<Object?> get props => [
        upcomingStatusedTrips,
        finishedStatusedTrips,
        archiveStatusedTrips,
        declinedStatusedTrips,
        timeDifferences,
        paidTripUuid,
        paymentObject,
        paymentConfirmationUrl,
        pageLoading,
        transparentPageLoading,
        nowUtc,
        shouldShowPaymentError,
        route,
      ];

  const MyTripsState({
    required this.upcomingStatusedTrips,
    required this.finishedStatusedTrips,
    required this.archiveStatusedTrips,
    required this.declinedStatusedTrips,
    required this.paidTripUuid,
    required this.timeDifferences,
    required this.paymentConfirmationUrl,
    required this.pageLoading,
    required this.transparentPageLoading,
    required this.shouldShowPaymentError,
    required this.route,
    this.nowUtc,
    this.paymentObject,
  });

  MyTripsState copyWith({
    List<StatusedTrip>? upcomingStatusedTrips,
    List<StatusedTrip>? finishedStatusedTrips,
    List<StatusedTrip>? archiveStatusedTrips,
    List<StatusedTrip>? declinedStatusedTrips,
    Map<String, int>? timeDifferences,
    YookassaPayment? paymentObject,
    String? paidTripUuid,
    String? paymentConfirmationUrl,
    bool? transparentPageLoading,
    bool? pageLoading,
    DateTime? nowUtc,
    CustomRoute? route,
    bool? shouldShowPaymentError,
    bool shouldClearPaymentObject = false,
  }) {
    return MyTripsState(
      upcomingStatusedTrips:
          upcomingStatusedTrips ?? this.upcomingStatusedTrips,
      finishedStatusedTrips:
          finishedStatusedTrips ?? this.finishedStatusedTrips,
      archiveStatusedTrips: archiveStatusedTrips ?? this.archiveStatusedTrips,
      declinedStatusedTrips:
          declinedStatusedTrips ?? this.declinedStatusedTrips,
      timeDifferences: timeDifferences ?? this.timeDifferences,
      paidTripUuid: paidTripUuid ?? this.paidTripUuid,
      paymentObject: shouldClearPaymentObject
          ? paymentObject
          : paymentObject ?? this.paymentObject,
      pageLoading: pageLoading ?? this.pageLoading,
      transparentPageLoading:
          transparentPageLoading ?? this.transparentPageLoading,
      paymentConfirmationUrl:
          paymentConfirmationUrl ?? this.paymentConfirmationUrl,
      route: route ?? this.route,
      shouldShowPaymentError:
          shouldShowPaymentError ?? this.shouldShowPaymentError,
      nowUtc: nowUtc ?? this.nowUtc,
    );
  }
}
