part of 'passengers_cubit.dart';

final class PassengersState extends Equatable {
  final CustomRoute route;
  final BottomSheetStatuses bottomSheetStatus;
  final PassengerSheetTypes sheetType;
  final AlertStatuses alertStatus;
  final PassengerAlertTypes alertType;
  final List<Passenger>? passengers;
  final Passenger currentPassenger;
  final bool noSurname;
  final bool newPassenger;

  @override
  List<Object?> get props => [
        passengers,
        sheetType,
        bottomSheetStatus,
        alertType,
        alertStatus,
        route,
        currentPassenger,
        noSurname,
        newPassenger,
      ];

  const PassengersState({
    required this.route,
    required this.bottomSheetStatus,
    required this.sheetType,
    required this.alertStatus,
    required this.alertType,
    required this.passengers,
    required this.currentPassenger,
    this.noSurname = false,
    this.newPassenger = false,
  });

  PassengersState copyWith({
    CustomRoute? route,
    PassengerSheetTypes? sheetType,
    BottomSheetStatuses? bottomSheetStatus,
    PassengerAlertTypes? alertType,
    AlertStatuses? alertStatus,
    List<Passenger>? passengers,
    Passenger? currentPassenger,
    bool? noSurname,
    bool? newPassenger,
    bool shouldClearPassengers = false,
  }) {
    return PassengersState(
      route: route ?? this.route,
      sheetType: sheetType ?? this.sheetType,
      bottomSheetStatus: bottomSheetStatus ?? this.bottomSheetStatus,
      alertType: alertType ?? this.alertType,
      alertStatus: alertStatus ?? this.alertStatus,
      passengers:
          shouldClearPassengers ? passengers : passengers ?? this.passengers,
      currentPassenger: currentPassenger ?? this.currentPassenger,
      newPassenger: newPassenger ?? this.newPassenger,
      noSurname: noSurname ?? this.noSurname,
    );
  }
}
