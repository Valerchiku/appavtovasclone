part of 'trip_details_cubit.dart';

@immutable
abstract class TripDetailsState extends Equatable {
  const TripDetailsState();

  TripDetailsState copyWith();
}

final class TripDetailsEmptyState extends TripDetailsState {
  @override
  List<Object?> get props => [];

  const TripDetailsEmptyState();

  @override
  TripDetailsEmptyState copyWith() {
    return const TripDetailsEmptyState();
  }
}

final class TripDetailsLoadedState extends TripDetailsState {
  @override
  List<Object?> get props => [];

  const TripDetailsLoadedState();

  @override
  TripDetailsLoadedState copyWith() {
    return const TripDetailsLoadedState();
  }
}
