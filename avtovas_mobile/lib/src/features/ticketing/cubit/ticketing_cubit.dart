import 'dart:async';

import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/utils/route_helper.dart';
import 'package:collection/collection.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:core/avtovas_core.dart';
import 'package:core/domain/entities/occupied_seat/occupied_seat.dart';
import 'package:core/domain/entities/start_sale_session/start_sale_session.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'ticketing_state.dart';

class TicketingCubit extends Cubit<TicketingState> {
  final TicketingInteractor _ticketingInteractor;

  TicketingCubit(this._ticketingInteractor)
      : super(
          TicketingState(
            route: const CustomRoute(null, null),
            saleSession: null,
            occupiedSeat: null,
            passengers: [Passenger.empty()],
            seats: const [''],
            existentPassengers: const [],
            availableEmails: const [],
            addTicket: null,
            surnameStatuses: const [false],
            genderErrors: const [false],
            usedEmail: '',
            useSavedEmail: false,
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<StartSaleSession?>? _saleSessionSubscription;
  StreamSubscription<List<OccupiedSeat>?>? _occupiedSeatSubscription;
  StreamSubscription<AddTicket?>? _addTicketSubscription;
  StreamSubscription<User>? _userSubscription;

  @override
  Future<void> close() {
    _saleSessionSubscription?.cancel();
    _saleSessionSubscription = null;

    _occupiedSeatSubscription?.cancel();
    _occupiedSeatSubscription = null;

    _addTicketSubscription?.cancel();
    _addTicketSubscription = null;

    _userSubscription?.cancel();
    _userSubscription = null;

    return super.close();
  }

  void buyTicket() {
    if (state.existentPassengers != null) {
      final notSamePassengers = _notSamePassengers();

      if (notSamePassengers.isNotEmpty) {
        _ticketingInteractor.addNewPassengers(notSamePassengers);
      }
    } else {
      _ticketingInteractor.addNewPassengers(state.passengers);
    }

    if (state.availableEmails != null &&
        !state.availableEmails!.contains(state.usedEmail)) {
      _ticketingInteractor.addNewEmail(state.usedEmail);
    }

    final personalDataList = state.passengers.mapIndexed(
      (index, passenger) =>
          PersonalDataMapper().personalDtaFromPassenger(passenger).copyWith(
                seatNum: state.seats[index],
                // TODO(dev): pass here real ticketNumber from state.
                ticketNumber: '',
              ),
    );
  }

  void startSaleSession({
    required String tripId,
    required String departure,
    required String destination,
  }) {
    _ticketingInteractor
      ..clearSession()
      ..startSaleSession(
        tripId: tripId,
        departure: departure,
        destination: destination,
      );
  }

  void getOccupiedSeats({
    required String tripId,
    required String departure,
    required String destination,
  }) {
    _ticketingInteractor
      ..clearSession()
      ..getOccupiedSeat(
        tripId: tripId,
        departure: departure,
        destination: destination,
      );
  }

  void addTickets({
    required String orderId,
    required String fareName,
    required String seatNum,
    String? parentTicketSeatNum,
  }) {
    _ticketingInteractor
      ..clearAddTickets()
      ..addTickets(
        orderId: orderId,
        fareName: fareName,
        seatNum: seatNum,
        parentTicketSeatNum: parentTicketSeatNum,
      );
  }

  void setTicketData({
    required String orderId,
    required List<PersonalData> personalData,
  }) {
    _ticketingInteractor
      ..clearSetTicketData()
      ..setTicketData(
        orderId: orderId,
        personalData: personalData,
      );
  }

  void changePassengerSeatNumber({
    required int passengerIndex,
    required String seat,
  }) {
    final seats = IList([...state.seats]).removeAt(passengerIndex);

    emit(
      state.copyWith(
        seats: seats.insert(passengerIndex, seat).toList(),
      ),
    );
  }

  void changeGenderErrorStatus({required int index, required bool status}) {
    final genderErrors = IList([...state.genderErrors]).removeAt(index);

    emit(
      state.copyWith(
        genderErrors: genderErrors.insert(index, status).toList(),
      ),
    );
  }

  void changeSavedEmailUsability({required bool useSavedEmail}) {
    emit(
      state.copyWith(useSavedEmail: useSavedEmail),
    );
  }

  void addNewPassenger() {
    final currentPassengers = IList([...state.passengers]);
    final surnameStatuses = IList([...state.surnameStatuses]);
    final genderErrors = IList([...state.genderErrors]);
    final seats = IList([...state.seats]);

    emit(
      state.copyWith(
        passengers: currentPassengers.add(Passenger.empty()).toList(),
        surnameStatuses: surnameStatuses.add(false).toList(),
        genderErrors: genderErrors.add(false).toList(),
        seats: seats.add('').toList(),
      ),
    );
  }

  void removePassenger({required int passengerIndex}) {
    final currentPassenger = IList([...state.passengers]);
    final surnameStatuses = IList([...state.surnameStatuses]);
    final genderErrors = IList([...state.genderErrors]);
    final seats = IList([...state.seats]);

    emit(
      state.copyWith(
        passengers: currentPassenger.removeAt(passengerIndex).toList(),
        surnameStatuses: surnameStatuses.removeAt(passengerIndex).toList(),
        genderErrors: genderErrors.removeAt(passengerIndex).toList(),
        seats: seats.removeAt(passengerIndex).toList(),
      ),
    );
  }

  void saveEmailRemote() {
    if (!state.useSavedEmail) {
      _ticketingInteractor.addNewEmail(state.usedEmail);
    }
  }

  void changeUsedEmail(String email) {
    emit(
      state.copyWith(usedEmail: email),
    );
  }

  void changeIndexedPassenger({
    required int passengerIndex,
    Passenger? existentPassenger,
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
    if (existentPassenger == null) {
      final passenger = state.passengers[passengerIndex];
      final newPassenger = PassengerMapper().newInstance(
        passenger.copyWith(
          firstName: firstName ?? passenger.firstName,
          lastName: lastName ?? passenger.lastName,
          surname: surname ?? passenger.surname,
          gender: gender ?? passenger.gender,
          birthdayDate: birthdayDate ?? passenger.birthdayDate,
          citizenship: citizenship ?? passenger.citizenship,
          documentType: documentType ?? passenger.documentType,
          documentData: documentData ?? passenger.documentData,
          rate: rate ?? passenger.rate,
        ),
      );

      final updatedPassengers = IList([...state.passengers]).removeAt(
        passengerIndex,
      );

      emit(
        state.copyWith(
          passengers: updatedPassengers
              .insert(
                passengerIndex,
                PassengerMapper().newInstance(newPassenger),
              )
              .toList(),
        ),
      );
    } else {
      final updatedPassengers = IList([...state.passengers]).removeAt(
        passengerIndex,
      );

      emit(
        state.copyWith(
          passengers: updatedPassengers
              .insert(passengerIndex, existentPassenger)
              .toList(),
        ),
      );
    }
  }

  void changeSurnameVisibility({
    required int passengerIndex,
    required bool withoutSurname,
  }) {
    final surnameStatuses =
    IList([...state.surnameStatuses]).removeAt(passengerIndex);

    final currentPassenger = state.passengers[passengerIndex];

    final passengers = IList([...state.passengers]).removeAt(passengerIndex);

    emit(
      state.copyWith(
        passengers: passengers
            .insert(
          passengerIndex,
          currentPassenger.copyWith(
            surname: withoutSurname ? null : currentPassenger.surname ?? '',
            shouldClearSurname: true,
          ),
        )
            .toList(),
        surnameStatuses:
        surnameStatuses.insert(passengerIndex, withoutSurname).toList(),
      ),
    );
  }

  void onBackButtonTap() {
    _ticketingInteractor
      ..clearSession()
      ..clearOccupiedSeat();

    emit(
      state.copyWith(
        route: const CustomRoute.pop(),
      ),
    );
  }

  void onNavigationItemTap(int navigationIndex) {
    emit(
      state.copyWith(
        route: RouteHelper.routeByIndex(navigationIndex),
      ),
    );
  }

  void _subscribeAll() {
    _saleSessionSubscription?.cancel();
    _saleSessionSubscription = _ticketingInteractor.saleSessionStream.listen(
      _onSaleSession,
    );

    _occupiedSeatSubscription?.cancel();
    _occupiedSeatSubscription = _ticketingInteractor.occupiedSeatStream.listen(
      _onNewOccupiedSeat,
    );

    _addTicketSubscription?.cancel();
    _addTicketSubscription = _ticketingInteractor.addTicketsStream.listen(
      _onNewAddTicket,
    );

    _userSubscription?.cancel();
    _userSubscription = _ticketingInteractor.userStream.listen(_onNewUser);
  }

  void _onNewUser(User user) {
    emit(
      state.copyWith(
        existentPassengers: user.passengers,
        availableEmails: user.emails,
        usedEmail: user.emails?.last ?? '',
        shouldClearExistentPassengers: true,
        shouldClearEmails: true,
      ),
    );
  }

  void _onSaleSession(StartSaleSession? saleSession) {
    emit(
      state.copyWith(saleSession: saleSession),
    );
  }

  void _onNewOccupiedSeat(List<OccupiedSeat>? occupiedSeat) {
    emit(
      state.copyWith(occupiedSeat: occupiedSeat),
    );
  }

  void _onNewAddTicket(AddTicket? addTicket) {
    emit(
      state.copyWith(addTicket: addTicket),
    );
  }

  List<Passenger> _notSamePassengers() {
    final setOfFillPassengers = Set<Passenger>.from(state.passengers);
    final setOfExistentPassengers = Set<Passenger>.from(
      state.existentPassengers!,
    );

    final uniquePassengers = setOfFillPassengers.difference(
      setOfExistentPassengers,
    );

    return uniquePassengers.toList();
  }

  // ignore: unused_element
  void _resetRoute() {
    emit(
      state.copyWith(
        route: const CustomRoute(null, null),
      ),
    );
  }
}
