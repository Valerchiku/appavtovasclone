part of 'my_trips_cubit.dart';

final class MyTripsState extends Equatable {
  final List<StatusedTrip>? upcomingStatusedTrips;
  final List<StatusedTrip>? finishedStatusedTrips;
  final List<StatusedTrip>? archiveStatusedTrips;
  final List<StatusedTrip>? declinedStatusedTrips;
  final Map<String, int> timeDifferences;
  final String paymentConfirmationUrl;

  @override
  List<Object?> get props => [
        upcomingStatusedTrips,
        finishedStatusedTrips,
        archiveStatusedTrips,
        declinedStatusedTrips,
        timeDifferences,
        paymentConfirmationUrl,
      ];

  const MyTripsState({
    required this.upcomingStatusedTrips,
    required this.finishedStatusedTrips,
    required this.archiveStatusedTrips,
    required this.declinedStatusedTrips,
    required this.timeDifferences,
    required this.paymentConfirmationUrl,
  });

  MyTripsState copyWith({
    List<StatusedTrip>? upcomingStatusedTrips,
    List<StatusedTrip>? finishedStatusedTrips,
    List<StatusedTrip>? archiveStatusedTrips,
    List<StatusedTrip>? declinedStatusedTrips,
    Map<String, int>? timeDifferences,
    String? paymentConfirmationUrl,
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
      paymentConfirmationUrl:
          paymentConfirmationUrl ?? this.paymentConfirmationUrl,
    );
  }
}
