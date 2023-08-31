part of 'passengers_cubit.dart';

final class PassengersState extends Equatable {
  final CustomRoute route;
  final int pageIndex;
  final BottomSheetStatuses bottomSheetStatus;
  final PassengerSheetTypes sheetType;
  final List<Passenger>? passengers;
  final Passenger currentPassenger;
  final bool noSurname;
  final bool isNewPassenger;
  final bool isBackButtonPressed;

  @override
  List<Object?> get props => [
        passengers,
    pageIndex,
        sheetType,
        bottomSheetStatus,
        route,
        currentPassenger,
        noSurname,
        isNewPassenger,
        isBackButtonPressed,
      ];

  const PassengersState({
    required this.route,
    required this.pageIndex,
    required this.bottomSheetStatus,
    required this.sheetType,
    required this.passengers,
    required this.currentPassenger,
    this.noSurname = false,
    this.isNewPassenger = false,
    this.isBackButtonPressed = false,
  });

  PassengersState copyWith({
    CustomRoute? route,
    int? pageIndex,
    PassengerSheetTypes? sheetType,
    BottomSheetStatuses? bottomSheetStatus,
    List<Passenger>? passengers,
    Passenger? currentPassenger,
    bool? noSurname,
    bool? isNewPassenger,
    bool? isBackButtonPressed,
    bool? canUpdate,
    bool shouldClearPassengers = false,
  }) {
    return PassengersState(
      route: route ?? this.route,
      pageIndex: pageIndex ?? this.pageIndex,
      sheetType: sheetType ?? this.sheetType,
      bottomSheetStatus: bottomSheetStatus ?? this.bottomSheetStatus,
      passengers:
          shouldClearPassengers ? passengers : passengers ?? this.passengers,
      currentPassenger: currentPassenger ?? this.currentPassenger,
      isNewPassenger: isNewPassenger ?? this.isNewPassenger,
      noSurname: noSurname ?? this.noSurname,
      isBackButtonPressed: isBackButtonPressed ?? this.isBackButtonPressed,
    );
  }
}
