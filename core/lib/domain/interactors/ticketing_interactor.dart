import 'package:core/avtovas_core.dart';
import 'package:core/domain/entities/occupied_seat/occupied_seat.dart';
import 'package:core/domain/entities/reserve_order/reserve_order.dart';
import 'package:core/domain/entities/start_sale_session/start_sale_session.dart';

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

  User get _user => _userRepository.entity;

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

  Future<void> addTickets({
    required List<Passenger> passengerList,
    required List<String> seats,
    required String orderId,
    String? parentTicketSeatNum,
  }) {
    return _oneCRepository.addTickets(
      passengerList: passengerList,
      seats: seats,
      orderId: orderId,
      parentTicketSeatNum: parentTicketSeatNum,
    );
  }

  Future<void> setTicketData({
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
    String? name,
    String? phone,
    String? email,
    String? comment,
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

    final updatedPassengers = [
      if (currentPassengers != null) ...currentPassengers,
      ...passengers,
    ];

    return _userRepository.updateUser(
      _user.copyWith(
        passengers: updatedPassengers,
        shouldClearPassengers: true,
      ),
    );
  }

  Future<void> addNewStatusedTrip(StatusedTrip statusedTrip) {
    final currentStatusedTrips = _user.statusedTrips;

    final updatedStatusedTrips = [
      if (currentStatusedTrips != null) ...currentStatusedTrips,
      statusedTrip,
    ];

    return _userRepository.updateUser(
      _user.copyWith(
        statusedTrips: updatedStatusedTrips,
        shouldClearStatusedTrips: true,
      ),
    );
  }

  Future<void> addNewEmail(String email) {
    final currentEmails = _user.emails;

    final updatedEmails = [if (currentEmails != null) ...currentEmails, email];

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
}
