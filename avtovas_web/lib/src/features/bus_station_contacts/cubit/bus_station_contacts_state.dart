part of 'bus_station_contacts_cubit.dart';

final class BusStationContactsState extends Equatable {
  final CustomRoute route;

  @override
  List<Object?> get props => [
        route,
      ];

  const BusStationContactsState({
    required this.route,
  });

BusStationContactsState copyWith({
    CustomRoute? route,
  }) {
    return BusStationContactsState(
      route: route ?? this.route,
    );
  }
}
