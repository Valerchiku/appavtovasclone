part of 'my_trips_cubit.dart';

final class MyTripsState extends Equatable {
  final List<StatusedTrip>? upcomingStatusedTrips;
  final List<StatusedTrip>? finishedStatusedTrips;
  final List<StatusedTrip>? archiveStatusedTrips;
  final List<StatusedTrip>? declinedStatusedTrips;
  final List<StatusedTrip> allTrips;
  final Map<String, int> timeDifferences;
  final String paidTripUuid;
  final YookassaPayment? paymentObject;
  final String paymentConfirmationUrl;
  final bool pageLoading;
  final DateTime? nowUtc;
  final bool shouldShowPaymentError;
  final UserTripStatus currentTripsStatus;
  final bool shouldShowLoadingAnimation;
  final bool shouldShowTranslucentLoadingAnimation;

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
        nowUtc,
        currentTripsStatus,
        shouldShowPaymentError,
        shouldShowLoadingAnimation,
        shouldShowTranslucentLoadingAnimation,
        allTrips,
      ];

  const MyTripsState({
    required this.upcomingStatusedTrips,
    required this.finishedStatusedTrips,
    required this.allTrips,
    required this.archiveStatusedTrips,
    required this.declinedStatusedTrips,
    required this.timeDifferences,
    required this.paidTripUuid,
    required this.paymentConfirmationUrl,
    required this.pageLoading,
    required this.shouldShowPaymentError,
    required this.currentTripsStatus,
    required this.paymentObject,
    required this.shouldShowLoadingAnimation,
    required this.shouldShowTranslucentLoadingAnimation,
    this.nowUtc,
  });

  MyTripsState copyWith({
    List<StatusedTrip>? upcomingStatusedTrips,
    List<StatusedTrip>? finishedStatusedTrips,
    List<StatusedTrip>? archiveStatusedTrips,
    List<StatusedTrip>? declinedStatusedTrips,
    List<StatusedTrip>? allTrips,
    Map<String, int>? timeDifferences,
    UserTripStatus? currentTripsStatus,
    YookassaPayment? paymentObject,
    String? paidTripUuid,
    String? paymentConfirmationUrl,
    bool? pageLoading,
    DateTime? nowUtc,
    bool? shouldShowPaymentError,
    bool? shouldShowLoadingAnimation,
    bool shouldClearPaymentObject = false,
    bool? shouldShowTranslucentLoadingAnimation,
  }) {
    return MyTripsState(
      allTrips: allTrips ?? this.allTrips,
      upcomingStatusedTrips:
          upcomingStatusedTrips ?? this.upcomingStatusedTrips,
      finishedStatusedTrips:
          finishedStatusedTrips ?? this.finishedStatusedTrips,
      archiveStatusedTrips: archiveStatusedTrips ?? this.archiveStatusedTrips,
      declinedStatusedTrips:
          declinedStatusedTrips ?? this.declinedStatusedTrips,
      timeDifferences: timeDifferences ?? this.timeDifferences,
      currentTripsStatus: currentTripsStatus ?? this.currentTripsStatus,
      paidTripUuid: paidTripUuid ?? this.paidTripUuid,
      paymentObject: shouldClearPaymentObject
          ? paymentObject
          : paymentObject ?? this.paymentObject,
      pageLoading: pageLoading ?? this.pageLoading,
      paymentConfirmationUrl:
          paymentConfirmationUrl ?? this.paymentConfirmationUrl,
      shouldShowPaymentError:
          shouldShowPaymentError ?? this.shouldShowPaymentError,
      shouldShowLoadingAnimation:
          shouldShowLoadingAnimation ?? this.shouldShowLoadingAnimation,
      nowUtc: nowUtc ?? this.nowUtc,
      shouldShowTranslucentLoadingAnimation:
          shouldShowTranslucentLoadingAnimation ??
              this.shouldShowTranslucentLoadingAnimation,
    );
  }
}
