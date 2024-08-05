import 'package:collection/collection.dart';
import 'package:core/domain/entities/add_ticket/add_ticket.dart';
import 'package:core/domain/entities/app_entities/passenger.dart';
import 'package:core/domain/entities/app_entities/statused_trip.dart';
import 'package:core/domain/entities/app_entities/user.dart';
import 'package:core/domain/entities/auxiliary_models/auxiliary_add_ticket.dart';
import 'package:core/domain/entities/auxiliary_models/personal_data.dart';
import 'package:core/domain/entities/occupied_seat/occupied_seat.dart';
import 'package:core/domain/entities/reserve_order/reserve_order.dart';
import 'package:core/domain/entities/set_ticket_data/set_ticket_data.dart';
import 'package:core/domain/entities/single_trip/single_trip.dart';
import 'package:core/domain/entities/start_sale_session/start_sale_session.dart';
import 'package:core/domain/interfaces/i_one_c_repository.dart';
import 'package:core/domain/interfaces/i_user_repository.dart';

final class TicketingInteractor {
  final IOneCRepository _oneCRepository;
  final IUserRepository _userRepository;

  const TicketingInteractor(
    this._oneCRepository,
    this._userRepository,
  );

  Stream<StartSaleSession?> get saleSessionStream =>
      _oneCRepository.saleSessionStream;

  Stream<List<OccupiedSeat>?> get occupiedSeatStream =>
      _oneCRepository.occupiedSeatStream;

  Stream<AddTicket?> get addTicketsStream => _oneCRepository.addTicketsStream;

  Stream<SetTicketData?> get setTicketDataStream =>
      _oneCRepository.setTicketDataStream;

  Stream<ReserveOrder?> get reserveOrderStream =>
      _oneCRepository.reserveOrderStream;

  Stream<User> get userStream => _userRepository.entityStream;

  Stream<(SingleTrip?, bool)> get singleTripStream =>
      _oneCRepository.singleTripStream;

  Stream<bool> get initializationStatusStream =>
      _oneCRepository.initializationStatusStream;

  User get _user => _userRepository.entity;

  bool get isAuth => _user.uuid != '0' && _user.uuid != '-1';

  Future<void> startSaleSession({
    required String tripId,
    required String departure,
    required String destination,
  }) {
    return _oneCRepository.startSaleSession(
      tripId: tripId,
      departure: departure,
      destination: destination,
    );
  }

  Future<void> getTrip({
    required String tripId,
    required String departure,
    required String destination,
    required String dbName,
  }) {
    _oneCRepository.clearTrip();

    return _oneCRepository.getTrip(
      tripId: tripId,
      departure: departure,
      destination: destination,
      dbName: dbName,
    );
  }

  Future<void> getOccupiedSeat({
    required String tripId,
    required String departure,
    required String destination,
  }) {
    return _oneCRepository.getOccupiedSeat(
      tripId: tripId,
      departure: departure,
      destination: destination,
    );
  }

  Future<void> delTickets({
    required List<AuxiliaryAddTicket> auxiliaryAddTicket,
    required String orderId,
  }) {
    return _oneCRepository.delTickets(
      auxiliaryAddTicket: auxiliaryAddTicket,
      orderId: orderId,
    );
  }

  Future<void> addTickets({
    required List<AuxiliaryAddTicket> auxiliaryAddTicket,
    required String orderId,
    String? parentTicketSeatNum,
  }) {
    return _oneCRepository.addTickets(
      auxiliaryAddTicket: auxiliaryAddTicket,
      orderId: orderId,
      parentTicketSeatNum: parentTicketSeatNum,
    );
  }

  Future<String> setTicketData({
    required String orderId,
    required List<PersonalData> personalData,
  }) {
    return _oneCRepository.setTicketData(
      orderId: orderId,
      personalData: personalData,
    );
  }

  Future<void> reserveOrder({
    required String orderId,
    required String name,
    required String phone,
    required String email,
    required String comment,
  }) {
    return _oneCRepository.reserveOrder(
      orderId: orderId,
      name: name,
      phone: phone,
      email: email,
      comment: comment,
    );
  }

  Future<void> addNewPassengers(List<Passenger> passengers) {
    final currentPassengers = _user.passengers;

    final wholePassengers = [
      ...passengers,
      if (currentPassengers != null) ...currentPassengers,
    ];

    final passengersMap = <String, Passenger>{};

    for (final passenger in wholePassengers) {
      if (!passengersMap.containsKey(passenger.uuid)) {
        passengersMap[passenger.uuid] = passenger;
      }
    }

    final sortedUpdatedPassengers = passengersMap.values
        .sorted(
          (a, b) => a.createdAt.compareTo(b.createdAt),
        )
        .toList();

    return _userRepository.updateUser(
      _user.copyWith(
        passengers: sortedUpdatedPassengers,
        shouldClearPassengers: true,
      ),
    );
  }

  Future<void> addNewStatusedTrip(StatusedTrip statusedTrip) {
    final currentStatusedTrips = _user.statusedTrips;

    final updatedStatusedTrips = [
      statusedTrip,
      if (currentStatusedTrips != null) ...currentStatusedTrips,
    ];

    return _userRepository.updateUser(
      _user.copyWith(
        statusedTrips: updatedStatusedTrips,
        shouldClearStatusedTrips: true,
      ),
    );
  }

  Future<void> addNewEmail(String email) {
    final currentEmails = [if (_user.emails != null) ..._user.emails!]
      ..removeWhere((e) => e == email);

    final updatedEmails = [email, ...currentEmails];

    return _userRepository.updateUser(
      _user.copyWith(
        emails: updatedEmails,
        shouldClearEmails: true,
      ),
    );
  }

  void clearSession() {
    _oneCRepository.clearSession();
  }

  void clearOccupiedSeat() {
    _oneCRepository.clearOccupiedSeat();
  }

  void clearAddTickets() {
    _oneCRepository.clearAddTickets();
  }

  void clearSetTicketData() {
    _oneCRepository.clearSetTicketData();
  }

  void clearReserveOrder() {
    _oneCRepository.clearReserveOrder();
  }

  void clearTrip() {
    _oneCRepository.clearTrip();
  }
}
