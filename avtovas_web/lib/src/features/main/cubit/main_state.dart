part of 'main_cubit.dart';

final class MainState extends Equatable {
  final DateTime? tripDate;
  final String? departurePlace;
  final String? arrivalPlace;
  final List<BusStop> avtovasBusStops;
  final List<BusStop> stepanovBusStops;
  final List<String> suggestions;

  @override
  List<Object?> get props => [
        tripDate,
        departurePlace,
        arrivalPlace,
        avtovasBusStops,
        stepanovBusStops,
        suggestions,
      ];

  const MainState({
    required this.avtovasBusStops,
    required this.stepanovBusStops,
    required this.suggestions,
    this.departurePlace,
    this.arrivalPlace,
    this.tripDate,
  });

MainState copyWith({
    DateTime? tripDate,
    String? departurePlace,
    String? arrivalPlace,
    List<BusStop>? avtovasBusStops,
    List<BusStop>? stepanovBusStops,
    List<String>? suggestions,
    bool? clearTripDate,
  }) {
    return MainState(
      tripDate: clearTripDate != null
          ? clearTripDate
              ? tripDate
              : tripDate ?? this.tripDate
          : tripDate ?? this.tripDate,
      departurePlace: departurePlace ?? this.departurePlace,
      arrivalPlace: arrivalPlace ?? this.arrivalPlace,
      avtovasBusStops: avtovasBusStops ?? this.avtovasBusStops,
      stepanovBusStops: stepanovBusStops ?? this.stepanovBusStops,
      suggestions: suggestions ?? this.suggestions,
    );
  }
}
