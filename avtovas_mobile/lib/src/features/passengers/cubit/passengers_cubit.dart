import 'dart:async';

import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/utils/route_helper.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:core/avtovas_core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'passengers_state.dart';

class PassengersCubit extends Cubit<PassengersState> {
  final PassengersInteractor _passengersInteractor;

  PassengersCubit(this._passengersInteractor)
      : super(
          PassengersState(
            route: const CustomRoute(null, null),
            pageIndex: 0,
            passengers: const [],
            currentPassenger: Passenger.empty(),
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<User>? _userSubscription;

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    _userSubscription = null;

    return super.close();
  }

  void addPassenger() {
    _passengersInteractor.addPassenger(
      state.currentPassenger,
    );
  }

  void removePassenger() {
    _passengersInteractor.removePassenger(
      state.currentPassenger.uuid,
    );
  }

  void updatePassenger() {
    _passengersInteractor.updatePassenger(
      state.currentPassenger,
    );
  }

  void setExistentPassenger(Passenger passenger) {
    emit(
      state.copyWith(currentPassenger: passenger),
    );
  }

  void changePageIndex(int pageIndex) {
    emit(
      state.copyWith(pageIndex: pageIndex),
    );
  }

  void clearCurrentPassenger() {
    emit(
      state.copyWith(currentPassenger: Passenger.empty()),
    );
  }

  void changeCurrentPassenger({
    String? firstName,
    String? lastName,
    String? surname,
    String? gender,
    DateTime? birthdayDate,
    String? citizenship,
    String? documentType,
    String? documentData,
    String? rate,
  }) {
    emit(
      state.copyWith(
        currentPassenger: state.currentPassenger.copyWith(
          firstName: firstName ?? state.currentPassenger.firstName,
          lastName: lastName ?? state.currentPassenger.lastName,
          surname: surname ?? state.currentPassenger.surname,
          gender: gender ?? state.currentPassenger.gender,
          birthdayDate: birthdayDate ?? state.currentPassenger.birthdayDate,
          citizenship: citizenship ?? state.currentPassenger.citizenship,
          documentType: documentType ?? state.currentPassenger.documentType,
          documentData: documentData ?? state.currentPassenger.documentData,
          rate: rate ?? state.currentPassenger.rate,
        ),
      ),
    );
  }

  void changeSurnameVisibility({required bool noSurname}) {
    emit(
      state.copyWith(noSurname: noSurname),
    );
  }

  void changePassengerStatus({required bool isNewPassenger}) {
    emit(
      state.copyWith(isNewPassenger: isNewPassenger),
    );
  }

  void onNavigationItemTap(int navigationIndex) {
    emit(
      state.copyWith(
        route: RouteHelper.clearedRoute(navigationIndex),
      ),
    );
  }

  void changeBackButtonStatus() {
    emit(
      state.copyWith(isBackButtonPressed: !state.isBackButtonPressed),
    );
  }

  void onBackButtonTap() {
    emit(
      state.copyWith(
        route: const CustomRoute.pop(),
      ),
    );
  }

  void _subscribeAll() {
    _userSubscription?.cancel();
    _userSubscription = _passengersInteractor.userStream.listen(_onNewUser);
  }

  void _onNewUser(User user) {
    emit(
      state.copyWith(
        passengers: user.passengers,
        shouldClearPassengers: true,
      ),
    );
  }
}
