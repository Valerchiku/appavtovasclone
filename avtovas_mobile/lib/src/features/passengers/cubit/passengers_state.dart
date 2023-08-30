part of 'passengers_cubit.dart';

final class PassengersState extends Equatable {
  final CustomRoute route;
  final BottomSheetStatuses bottomSheetStatus;
  final PassengerSheetTypes sheetType;
  final List<Passenger>? passengers;
  final Passenger currentPassenger;
  final bool noSurname;
  final bool newPassenger;

  @override
  List<Object?> get props => [
        passengers,
        sheetType,
        bottomSheetStatus,
        route,
        currentPassenger,
        noSurname,
        newPassenger,
      ];

  const PassengersState({
    required this.route,
    required this.bottomSheetStatus,
    required this.sheetType,
    required this.passengers,
    required this.currentPassenger,
    this.noSurname = false,
    this.newPassenger = false,
  });

  PassengersState copyWith({
    CustomRoute? route,
    PassengerSheetTypes? sheetType,
    BottomSheetStatuses? bottomSheetStatus,
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
      passengers:
          shouldClearPassengers ? passengers : passengers ?? this.passengers,
      currentPassenger: currentPassenger ?? this.currentPassenger,
      newPassenger: newPassenger ?? this.newPassenger,
      noSurname: noSurname ?? this.noSurname,
    );
  }
}
