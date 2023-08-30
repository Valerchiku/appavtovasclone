part of 'my_trips_cubit.dart';

final class MyTripsState extends Equatable {
  final CustomRoute route;
  final DialogStatuses dialogStatus;

  @override
  List<Object?> get props => [route, dialogStatus];

  const MyTripsState({
    required this.route,
    required this.dialogStatus,
  });

  MyTripsState copyWith({
    CustomRoute? route,
    DialogStatuses? dialogStatus,
  }) {
    return MyTripsState(
      route: route ?? this.route,
      dialogStatus: dialogStatus ?? this.dialogStatus,
    );
  }
}
