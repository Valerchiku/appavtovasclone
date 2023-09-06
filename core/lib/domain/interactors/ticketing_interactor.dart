import 'package:core/avtovas_core.dart';
import 'package:core/domain/entities/add_ticket/add_ticket.dart';
import 'package:core/domain/entities/occupied_seat/occupied_seat.dart';
import 'package:core/domain/entities/oneC_entities/personal_data.dart';
import 'package:core/domain/entities/reserve_order/reserve_order.dart';
import 'package:core/domain/entities/set_ticket_data/set_ticket_data.dart';
import 'package:core/domain/entities/start_sale_session/start_sale_session.dart';

final class TicketingInteractor {
  final IOneCRepository _oneCRepository;
  // final IUserRepository _userRepository;
  // final ILocalAuthorizationRepository _localAuthorizationRepository;

  const TicketingInteractor(
    this._oneCRepository,
    // this._userRepository,
    // this._localAuthorizationRepository,
  );

  Stream<StartSaleSession?> get saleSessionStream =>
      _oneCRepository.saleSessionStream;

  Stream<List<OccupiedSeat>?> get occupiedSeatStream =>
      _oneCRepository.occupiedSeatStream;

  // Stream<User> get userStream => _userRepository.entityStream;

  Stream<AddTicket?> get addTicketsStream => _oneCRepository.addTicketsStream;

  Stream<SetTicketData?> get setTicketDataStream =>
      _oneCRepository.setTicketDataStream;

  Stream<ReserveOrder?> get reserveOrderStream =>
      _oneCRepository.reserveOrderStream;

  // bool get isAuth =>
      // _userRepository.entity.uuid != '-1' && _userRepository.entity.uuid != '0';

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
    required String orderId,
    required String fareName,
    required String seatNum,
    String? parentTicketSeatNum,
  }) {
    return _oneCRepository.addTickets(
      orderId: orderId,
      fareName: fareName,
      seatNum: seatNum,
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

  // void deAuthorize() {
  //   _localAuthorizationRepository.removeUserLocally();
  //   _userRepository.clearUser();
  // }

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
