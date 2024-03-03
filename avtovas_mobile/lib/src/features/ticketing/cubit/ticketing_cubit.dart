import 'dart:async';

import 'package:avtovas_mobile/src/common/navigation/app_router.dart';
import 'package:avtovas_mobile/src/common/navigation/routes.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/utils/route_helper.dart';
import 'package:avtovas_mobile/src/features/authorization/pages/authorization_page.dart';
import 'package:collection/collection.dart';
import 'package:common/avtovas_authorization.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:core/avtovas_core.dart';
import 'package:core/domain/entities/occupied_seat/occupied_seat.dart';
import 'package:core/domain/entities/single_trip/single_trip.dart';
import 'package:core/domain/entities/single_trip/single_trip_fares.dart';
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
            userPhoneNumber: '',
            isLoading: false,
            shouldShowErrorAlert: false,
            errorMessage: '',
            isErrorRead: false,
            auxiliaryAddTicket: const [],
            rates: const [''],
            tripDbName: '',
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<StartSaleSession?>? _saleSessionSubscription;
  StreamSubscription<List<OccupiedSeat>?>? _occupiedSeatSubscription;
  StreamSubscription<AddTicket?>? _addTicketSubscription;
  StreamSubscription<SetTicketData?>? _setTicketDataSubscription;
  StreamSubscription<ReserveOrder?>? _reserveOrderSubscription;
  StreamSubscription<User>? _userSubscription;

  bool get _isAuth => _ticketingInteractor.isAuth;

  final _router = AppRouter.appRouter;

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

    return super.close();
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

  Future<bool> verifyChildRatePossibility() async {
    if (!state.rates.contains('Детский')) return true;

    final currentDate = await TimeReceiver.fetchUnifiedTime();

    for (var i = 0; i < state.passengers.length; i++) {
      final passengerBirthday = state.passengers[i].birthdayDate;
      final passengerRate = state.rates[i];

      final difference = currentDate.year - passengerBirthday.year;

      if (passengerRate == 'Детский' && difference > 12) return false;
    }

    return true;
  }

  Future<void> checkAuthorizationStatus() {
    return _isAuth
        ? _buyTicket()
        : _router
            .push(
            Routes.authPath.route,
            extra: AuthorizationPageArguments(
              content: AuthorizationContent.phone,
              fromMyTrips: false,
            ),
          )
            .then(
            (value) {
              if (value == true) _buyTicket();

              print('12312312');
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
  }) {
    final passenger = state.passengers.first;

    final passengerFullName = '${passenger.lastName} ${passenger.firstName} '
        '${passenger.surname ?? ''}';

    print(state.usedEmail);

    _ticketingInteractor.reserveOrder(
      orderId: orderId,
      name: passengerFullName,
      phone: state.userPhoneNumber,
      email: state.usedEmail,
      comment: state.tripDbName,
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
          rates: updatedRates.toList(),
          passengers: updatedPassengers
              .insert(
                passengerIndex,
                newPassenger,
              )
              .toList(),
        ),
      );
    } else {
      final updatedPassengers = List.of(state.passengers)
        ..removeAt(
          passengerIndex,
        )
        ..insert(passengerIndex, existentPassenger);

      final surnameStatuses = List.of(state.surnameStatuses)
        ..removeAt(passengerIndex)
        ..insert(
          passengerIndex,
          existentPassenger.surname == null
        );

      emit(
        state.copyWith(
          passengers: updatedPassengers,
          surnameStatuses: surnameStatuses,
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
    emit(
      state.copyWith(
        route: RouteHelper.clearedRoute(navigationIndex),
      ),
    );

    _resetRoute();
  }

  void clearSubjects() {
    _ticketingInteractor
      ..clearTrip()
      ..clearSession()
      ..clearOccupiedSeat()
      ..clearAddTickets()
      ..clearSetTicketData()
      ..clearReserveOrder();
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
        usedEmail: user.emails?.first ?? '',
        useSavedEmail: user.emails != null,
        shouldClearExistentPassengers: true,
        userPhoneNumber: user.phoneNumber,
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
                    email: state.usedEmail,
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
      final nowUtc = await TimeReceiver.fetchUnifiedTime();

      await _ticketingInteractor.addNewStatusedTrip(
        StatusedTrip(
          uuid: generateUuid(),
          tripStatus: UserTripStatus.upcoming,
          tripCostStatus: UserTripCostStatus.reserved,
          saleDate: nowUtc,
          saleCost: finalPriceByRate(
            state.rates,
            state.saleSession!.trip.fares,
          ),
          places: state.seats,
          trip: state.trip!,
          paymentUuid: null,
          passengers: state.passengers,
          ticketNumbers: reserveOrder.ticket.map((e) => e.number).toList(),
          orderNum: reserveOrder.number,
          tripDbName: state.tripDbName,
        ),
      );

      emit(
        state.copyWith(
          route: RouteHelper.clearedIndexedRoute(1, shouldClearStack: true),
          isLoading: false,
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
