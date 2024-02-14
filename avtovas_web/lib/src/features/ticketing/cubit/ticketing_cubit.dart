import 'dart:async';

import 'package:avtovas_web/src/common/navigation/app_router.dart';
import 'package:avtovas_web/src/common/navigation/configurations.dart';
import 'package:collection/collection.dart';
import 'package:common/avtovas_authorization.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:core/avtovas_core.dart';
import 'package:core/avtovas_model.dart';
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
            trip: null,
            saleSession: null,
            occupiedSeat: null,
            passengers: [Passenger.empty()],
            personalDataList: const [],
            seats: const [''],
            existentPassengers: const [],
            availableEmails: const [],
            addTicket: null,
            surnameStatuses: const [false],
            genderErrors: const [false],
            usedEmail: '',
            useSavedEmail: false,
            isLoading: false,
            shouldShowErrorAlert: false,
            errorMessage: '',
            isErrorRead: false,
            auxiliaryAddTicket: const [],
            rates: const [''],
            orderNum: '',
            userPhoneNumber: '',
            tripDbName: '',
            shouldShowEmptyTripMessage: false,
          ),
        ) {
    _subscribeAll();
  }

  final _router = AppRouter.appRouter;

  bool get isAuth => _ticketingInteractor.isAuth;

  StreamSubscription<(SingleTrip?, bool)>? _singleTripSubscription;
  StreamSubscription<StartSaleSession?>? _saleSessionSubscription;
  StreamSubscription<List<OccupiedSeat>?>? _occupiedSeatSubscription;
  StreamSubscription<AddTicket?>? _addTicketSubscription;
  StreamSubscription<SetTicketData?>? _setTicketDataSubscription;
  StreamSubscription<ReserveOrder?>? _reserveOrderSubscription;
  StreamSubscription<User>? _userSubscription;
  StreamSubscription<bool>? _initializationStatusSubscription;

  @override
  Future<void> close() {
    clearSubjects();

    _saleSessionSubscription?.cancel();
    _saleSessionSubscription = null;

    _occupiedSeatSubscription?.cancel();
    _occupiedSeatSubscription = null;

    _addTicketSubscription?.cancel();
    _addTicketSubscription = null;

    _setTicketDataSubscription?.cancel();
    _saleSessionSubscription = null;

    _reserveOrderSubscription?.cancel();
    _reserveOrderSubscription = null;

    _userSubscription?.cancel();
    _userSubscription = null;

    _initializationStatusSubscription?.cancel();
    _initializationStatusSubscription = null;

    _singleTripSubscription?.cancel();
    _singleTripSubscription = null;

    return super.close();
  }

  void initializationStatusSubscribe({
    required String tripId,
    required String departure,
    required String destination,
  }) {
    _initializationStatusSubscription?.cancel();
    _initializationStatusSubscription = null;

    _initializationStatusSubscription =
        _ticketingInteractor.initializationStatusStream.listen(
      (status) {
        if (status) {
          _ticketingInteractor.getTrip(
            tripId: tripId,
            departure: departure,
            destination: destination,
          );
        }
      },
    );
  }

  void setSingleTrip(SingleTrip trip) {
    startSaleSession(
      tripId: trip.id,
      departure: trip.departure.name,
      destination: trip.destination.name,
    );

    getOccupiedSeats(
      tripId: trip.id,
      departure: trip.departure.name,
      destination: trip.destination.name,
    );

    emit(
      state.copyWith(trip: trip),
    );
  }

  Future<void> checkAuthorizationStatus() {
    return isAuth
        ? _buyTicket()
        : _router
            .push(authConfig(content: AuthorizationContent.phone).path)
            .then(
            (value) {
              if (value == true) _buyTicket();
            },
          );
  }

  Future<void> _buyTicket() async {
    emit(
      state.copyWith(isLoading: true),
    );

    if (state.existentPassengers != null) {
      final notSamePassengers = _notSamePassengers();

      if (notSamePassengers.isNotEmpty) {
        _ticketingInteractor.addNewPassengers(notSamePassengers);
      }
    } else {
      _ticketingInteractor.addNewPassengers(state.passengers);
    }

    if (state.availableEmails == null ||
        !state.availableEmails!.contains(state.usedEmail)) {
      _ticketingInteractor.addNewEmail(state.usedEmail);
    }

    final auxiliaryAddTicket = state.passengers
        .mapIndexed(
          (index, passenger) => AuxiliaryAddTicketMapper()
              .auxiliaryAddTicketFromPassenger(state.rates[index])
              .copyWith(
                orderId: state.saleSession?.number,
                seats: state.seats[index],
              ),
        )
        .toList();

    emit(
      state.copyWith(auxiliaryAddTicket: auxiliaryAddTicket),
    );

    addTickets(
      auxiliaryAddTicket: auxiliaryAddTicket,
      orderId: state.saleSession!.number,
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
    required List<AuxiliaryAddTicket> auxiliaryAddTicket,
    required String orderId,
    String? parentTicketSeatNum,
  }) {
    _ticketingInteractor
      ..clearAddTickets()
      ..addTickets(
        auxiliaryAddTicket: auxiliaryAddTicket,
        orderId: orderId,
        parentTicketSeatNum: parentTicketSeatNum,
      );
  }

  Future<void> setTicketData({
    required String orderId,
    required List<PersonalData> personalData,
  }) async {
    _ticketingInteractor.clearSetTicketData();

    final tripDbName = await _ticketingInteractor.setTicketData(
      orderId: orderId,
      personalData: personalData,
    );

    if (tripDbName != 'error') {
      emit(
        state.copyWith(tripDbName: tripDbName),
      );
    }
  }

  void reserveOrder({
    required String orderId,
    String? name,
    String? phone,
    String? email,
    String? comment,
  }) {
    _ticketingInteractor.reserveOrder(
      orderId: orderId,
      name: name,
      phone: phone,
      email: email,
      comment: comment,
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
    final rates = IList([...state.rates]);

    emit(
      state.copyWith(
        passengers: currentPassengers.add(Passenger.empty()).toList(),
        surnameStatuses: surnameStatuses.add(false).toList(),
        genderErrors: genderErrors.add(false).toList(),
        seats: seats.add('').toList(),
        rates: rates.add('').toList(),
      ),
    );
  }

  void removePassenger({required int passengerIndex}) {
    final currentPassenger = IList([...state.passengers]);
    final surnameStatuses = IList([...state.surnameStatuses]);
    final genderErrors = IList([...state.genderErrors]);
    final seats = IList([...state.seats]);
    final rates = IList([...state.rates]);

    emit(
      state.copyWith(
        passengers: currentPassenger.removeAt(passengerIndex).toList(),
        surnameStatuses: surnameStatuses.removeAt(passengerIndex).toList(),
        genderErrors: genderErrors.removeAt(passengerIndex).toList(),
        seats: seats.removeAt(passengerIndex).toList(),
        rates: rates.removeAt(passengerIndex).toList(),
      ),
    );
  }

  void closeErrorAlert() {
    emit(
      state.copyWith(isErrorRead: true),
    );

    setSingleTrip(state.trip!);
    _ticketingInteractor.delTickets(
      auxiliaryAddTicket: state.auxiliaryAddTicket,
      orderId: state.saleSession!.number,
    );

    emit(
      state.copyWith(
        isLoading: false,
        shouldShowErrorAlert: false,
        errorMessage: '',
      ),
    );

    emit(
      state.copyWith(isErrorRead: false),
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
      final newPassenger = passenger.copyWith(
        firstName: firstName ?? passenger.firstName,
        lastName: lastName ?? passenger.lastName,
        surname: surname ?? passenger.surname,
        gender: gender ?? passenger.gender,
        birthdayDate: birthdayDate ?? passenger.birthdayDate,
        citizenship: citizenship ?? passenger.citizenship,
        documentType: documentType ?? passenger.documentType,
        documentData: documentData ?? passenger.documentData,
      );

      final updatedPassengers = IList([...state.passengers]).removeAt(
        passengerIndex,
      );

      var updatedRates = IList(state.rates);

      if (rate != null) {
        updatedRates = updatedRates.removeAt(passengerIndex).insert(
              passengerIndex,
              rate,
            );
      }

      emit(
        state.copyWith(
          passengers: updatedPassengers
              .insert(
                passengerIndex,
                newPassenger,
              )
              .toList(),
          rates: updatedRates.toList(),
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

  String priceByRate(
    String passengerRate,
    List<SingleTripFares?> rates,
  ) {
    return rates
            .firstWhereOrNull((rate) => rate?.name == passengerRate)
            ?.cost ??
        '0';
  }

  String finalPriceByRate(
    List<String> passengerRates,
    List<SingleTripFares?> rates,
  ) {
    final prices = passengerRates
        .map(
          (passRate) => rates
              .map((rate) => passRate == rate?.name ? rate?.cost ?? '0' : '0'),
        )
        .expand((prices) => prices)
        .toList();

    var finalPrice = 0;

    for (final price in prices) {
      finalPrice += int.tryParse(price) ?? 0;
    }

    return finalPrice.toString();
  }

  void onBackButtonTap() {
    if (!state.shouldShowErrorAlert && !state.isLoading) {
      clearSubjects();

      emit(
        state.copyWith(
          route: const CustomRoute.pop(),
        ),
      );
    }
  }

  void onNavigationItemTap(int navigationIndex) {
    /*emit(
      state.copyWith(
        route: RouteHelper.clearedRoute(navigationIndex),
      ),
    );*/

    _resetRoute();
  }

  void clearSubjects() {
    _ticketingInteractor
      ..clearSession()
      ..clearOccupiedSeat()
      ..clearAddTickets()
      ..clearSetTicketData()
      ..clearReserveOrder();
  }

  void _onNewSingleTrip(
    SingleTrip? singleTrip, {
    required bool canEmitReceivedTrip,
  }) {
    if (!canEmitReceivedTrip || singleTrip == null) return;

    if (singleTrip.id == 'error') {
      emit(
        state.copyWith(shouldShowEmptyTripMessage: true),
      );
    } else {
      setSingleTrip(singleTrip);
    }
  }

  void _subscribeAll() {
    _singleTripSubscription?.cancel();
    _singleTripSubscription = null;
    _singleTripSubscription = _ticketingInteractor.singleTripStream.listen(
      (event) => _onNewSingleTrip(event.$1, canEmitReceivedTrip: event.$2),
    );

    _saleSessionSubscription?.cancel();
    _saleSessionSubscription = _ticketingInteractor.saleSessionStream.listen(
      _onSaleSession,
    );

    _occupiedSeatSubscription?.cancel();
    _occupiedSeatSubscription = _ticketingInteractor.occupiedSeatStream.listen(
      _onNewOccupiedSeat,
    );

    _addTicketSubscription?.cancel();
    _addTicketSubscription =
        _ticketingInteractor.addTicketsStream.listen(_onNewAddTicket);

    _setTicketDataSubscription?.cancel();
    _setTicketDataSubscription =
        _ticketingInteractor.setTicketDataStream.listen(_onNewSetTicketData);

    _reserveOrderSubscription?.cancel();
    _reserveOrderSubscription =
        _ticketingInteractor.reserveOrderStream.listen(_onNewReserveOrder);

    _userSubscription?.cancel();
    _userSubscription = _ticketingInteractor.userStream.listen(_onNewUser);
  }

  void _onNewUser(User user) {
    emit(
      state.copyWith(
        existentPassengers: user.passengers,
        availableEmails: user.emails,
        usedEmail: user.emails?.last ?? '',
        userPhoneNumber: user.phoneNumber,
        useSavedEmail: user.emails?.isNotEmpty ?? false,
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
    if (addTicket != null) {
      if (addTicket.departure.name == 'error') {
        emit(
          state.copyWith(
            shouldShowErrorAlert: true,
            errorMessage: addTicket.number,
          ),
        );
      } else {
        final personalDataList = state.passengers
            .mapIndexed(
              (index, passenger) => PersonalDataMapper()
                  .personalDataFromPassenger(passenger)
                  .copyWith(
                    seatNum: state.seats[index],
                    fareName: state.rates[index],
                    phoneNumber: state.userPhoneNumber,
                    ticketNumbers: addTicket.tickets[index].number,
                  ),
            )
            .toList();

        setTicketData(
          orderId: state.saleSession!.number,
          personalData: personalDataList,
        );
      }
    }
  }

  void _onNewSetTicketData(SetTicketData? setTicketData) {
    if (setTicketData != null) {
      if (setTicketData.departure.name == 'error') {
        emit(
          state.copyWith(
            shouldShowErrorAlert: true,
            errorMessage: setTicketData.number,
          ),
        );
      } else {
        reserveOrder(orderId: setTicketData.number);
      }
    }
  }

  Future<void> _onNewReserveOrder(ReserveOrder? reserveOrder) async {
    if (reserveOrder != null) {
      await _ticketingInteractor.addNewStatusedTrip(
        StatusedTrip(
          uuid: generateUuid(),
          tripStatus: UserTripStatus.upcoming,
          tripCostStatus: UserTripCostStatus.reserved,
          saleDate: DateTime.now(),
          saleCost: finalPriceByRate(
            state.rates,
            state.saleSession!.trip.fares,
          ),
          places: state.seats,
          trip: state.trip!,
          paymentUuid: '',
          passengers: state.passengers,
          orderNum: reserveOrder.number,
          ticketNumbers: reserveOrder.ticket.map((e) => e.number).toList(),
          tripDbName: state.tripDbName,
        ),
      );

      _router.navigateTo(
        CustomRoute(
          RouteType.navigateTo,
          myTripsConfig(statusedTripId: '', paymentId: ''),
          shouldClearStack: true,
        ),
      );
    }
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
