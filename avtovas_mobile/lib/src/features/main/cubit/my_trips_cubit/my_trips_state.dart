part of 'my_trips_cubit.dart';

final class MyTripsState extends Equatable {
  final CustomRoute route;

  @override
  List<Object?> get props => [
        route,
      ];

  const MyTripsState({
    required this.route,
  });

  MyTripsState copyWith({
    CustomRoute? route,
  }) {
    return MyTripsState(
      route: route ?? this.route,
    );
  }
}
