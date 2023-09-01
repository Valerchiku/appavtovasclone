import 'package:core/avtovas_core.dart';
import 'package:core/domain/entities/occupied_seat/occupied_seat.dart';
import 'package:core/domain/entities/start_sale_session/start_sale_session.dart';

final class TicketingInteractor {
  final IOneCRepository _oneCRepository;

  const TicketingInteractor(this._oneCRepository);

  Stream<StartSaleSession?> get saleSessionStream =>
      _oneCRepository.saleSessionStream;

  Stream<List<OccupiedSeat>?> get occupiedSeatStream =>
      _oneCRepository.occupiedSeatStream;

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

  void clearSession() {
    _oneCRepository.clearSession();
  }

  void clearOccupiedSeat() {
    _oneCRepository.clearOccupiedSeat();
  }
}
