import 'package:core/avtovas_core.dart';
import 'package:core/domain/entities/add_tickets/add_tickets.dart';
import 'package:core/domain/entities/occupied_seat/occupied_seat.dart';
import 'package:core/domain/entities/start_sale_session/start_sale_session.dart';

final class TicketingInteractor {
  final IOneCRepository _oneCRepository;

  const TicketingInteractor(this._oneCRepository);

  Stream<StartSaleSession?> get saleSessionStream =>
      _oneCRepository.saleSessionStream;

  Stream<List<OccupiedSeat>?> get occupiedSeatStream =>
      _oneCRepository.occupiedSeatStream;

  Stream<AddTickets?> get addTicketsStream => _oneCRepository.addTicketsStream;

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

  void clearSession() {
    _oneCRepository.clearSession();
  }

  void clearOccupiedSeat() {
    _oneCRepository.clearOccupiedSeat();
  }
}
