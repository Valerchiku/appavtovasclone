import 'dart:async';

import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:core/avtovas_core.dart';
import 'package:core/domain/entities/occupied_seat/occupied_seat.dart';
import 'package:core/domain/entities/start_sale_session/start_sale_session.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'ticketing_state.dart';

class TicketingCubit extends Cubit<TicketingState> {
  final TicketingInteractor _ticketingInteractor;

  TicketingCubit(this._ticketingInteractor)
      : super(
          const TicketingState(
            route: CustomRoute(null, null),
            saleSession: null,
            occupiedSeat: null,
            passenger: <Passenger>[],
            addTicket: null,
            personalData: <PersonalData>[],
            firstName: '',
            lastName: '',
            withoutSurname: true,
            currentGender: Genders.male,
            documentType: '',
            // ignore: avoid-non-ascii-symbols
            currentCountry: 'Россия',
            currentRate: '',
            // ignore: avoid-non-ascii-symbols
            currentPlace: 'Любое',
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<StartSaleSession?>? _saleSessionSubscription;
  StreamSubscription<List<OccupiedSeat>?>? _occupiedSeatSubscription;
  StreamSubscription<AddTicket?>? _addTicketSubscription;

  @override
  Future<void> close() {
    _saleSessionSubscription?.cancel();
    _saleSessionSubscription = null;

    _occupiedSeatSubscription?.cancel();
    _occupiedSeatSubscription = null;

    _addTicketSubscription?.cancel();
    _addTicketSubscription = null;
    return super.close();
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

  void changeRate(String rate) {
    emit(
      state.copyWith(currentRate: rate),
    );
  }

  void changeDocumentType(String documentType) {
    emit(
      state.copyWith(documentType: documentType),
    );
  }

  void changePlace(String currentPlace) {
    emit(
      state.copyWith(currentPlace: currentPlace),
    );
  }

  void changeCurrentCountry(String country) {
    emit(
      state.copyWith(currentCountry: country),
    );
  }

  void changeSurnameVisibility({required bool withoutSurname}) {
    emit(
      state.copyWith(withoutSurname: withoutSurname),
    );
  }

  void onGenderChanged(Genders gender) {
    emit(
      state.copyWith(currentGender: gender),
    );
  }

  /*void updateFirstName(
    String firstName,
    int index,
  ) {
    final updatedPersonalData = List<PersonalData>.from(state.personalData);

    updatedPersonalData[index] =
        updatedPersonalData[index].copyWith(fullName: firstName);

    emit(
      state.copyWith(
        personalData: updatedPersonalData,
      ),
    );
  }*/

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

  // ignore: unused_element
  void _resetRoute() {
    emit(
      state.copyWith(
        route: const CustomRoute(null, null),
      ),
    );
  }
}
