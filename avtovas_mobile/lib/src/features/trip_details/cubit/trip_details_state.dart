part of 'trip_details_cubit.dart';

class TripDetailsState extends Equatable {
  final CustomRoute route;

  @override
  List<Object?> get props => [route];

  const TripDetailsState({
    required this.route,
  });

  TripDetailsState copyWith({CustomRoute? route}) {
    return TripDetailsState(
      route: route ?? this.route,
    );
  }
}
