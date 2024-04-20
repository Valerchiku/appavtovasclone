part of 'bus_station_contacts_cubit.dart';

final class BusStationContactsState extends Equatable {
  final CustomRoute route;
  final String avtovasPhoneNumber;

  @override
  List<Object?> get props => [
        route,
      ];

  const BusStationContactsState({
    required this.route,
    required this.avtovasPhoneNumber,
  });

BusStationContactsState copyWith({
    CustomRoute? route,
    String? avtovasPhoneNumber,
  }) {
    return BusStationContactsState(
      route: route ?? this.route,
      avtovasPhoneNumber: avtovasPhoneNumber ?? this.avtovasPhoneNumber,
    );
  }
}
