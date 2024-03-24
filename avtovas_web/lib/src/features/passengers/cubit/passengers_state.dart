part of 'passengers_cubit.dart';

final class PassengersState extends Equatable {
  final CustomRoute route;
  final List<Passenger>? passengers;
  final Passenger currentPassenger;
  final bool noSurname;
  final bool isNewPassenger;
  final bool isBackButtonPressed;
  final bool canRenderFillContainer;

  @override
  List<Object?> get props => [
        passengers,
        canRenderFillContainer,
        route,
        currentPassenger,
        noSurname,
        isNewPassenger,
        isBackButtonPressed,
      ];

  const PassengersState({
    required this.route,
    required this.passengers,
    required this.currentPassenger,
    this.canRenderFillContainer = false,
    this.noSurname = false,
    this.isNewPassenger = false,
    this.isBackButtonPressed = false,
  });

  PassengersState copyWith({
    CustomRoute? route,
    List<Passenger>? passengers,
    Passenger? currentPassenger,
    bool? canRenderFillContainer,
    bool? noSurname,
    bool? isNewPassenger,
    bool? isBackButtonPressed,
    bool? canUpdate,
    bool shouldClearPassengers = false,
  }) {
    return PassengersState(
      route: route ?? this.route,
      passengers:
          shouldClearPassengers ? passengers : passengers ?? this.passengers,
      canRenderFillContainer:
          canRenderFillContainer ?? this.canRenderFillContainer,
      currentPassenger: currentPassenger ?? this.currentPassenger,
      isNewPassenger: isNewPassenger ?? this.isNewPassenger,
      noSurname: noSurname ?? this.noSurname,
      isBackButtonPressed: isBackButtonPressed ?? this.isBackButtonPressed,
    );
  }
}
