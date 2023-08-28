import 'package:core/domain/entities/single_trip/single_trip.dart';
import 'package:core/domain/entities/start_sale_session/start_sale_session.dart';
import 'package:core/domain/interfaces/i_one_c_repository.dart';

final class TripDetailsInteractor {
  final IOneCRepository _oneCRepository;

  TripDetailsInteractor(this._oneCRepository);

  Stream<SingleTrip?> get singleTripStream => _oneCRepository.singleTripStream;

  Stream<StartSaleSession?> get saleSession =>
      _oneCRepository.saleSessionStream;

  Future<void> getTrip({
    required String tripId,
    required String busStop,
  }) {
    return _oneCRepository.getTrip(
      tripId: tripId,
      busStop: busStop,
    );
  }

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

  void clearTrip() {
    _oneCRepository.clearTrip();
  }

  void clearSession() {
    _oneCRepository.clearSession();
  }
}
