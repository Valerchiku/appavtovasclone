import 'package:core/domain/entities/single_trip/single_trip.dart';
import 'package:core/domain/entities/start_sale_session/start_sale_session.dart';
import 'package:core/domain/interfaces/i_cache_repository.dart';
import 'package:core/domain/interfaces/i_one_c_repository.dart';

final class TripDetailsInteractor {
  final IOneCRepository _oneCRepository;
  final ICacheRepository _cacheRepository;

  TripDetailsInteractor(this._oneCRepository, this._cacheRepository);

  Stream<(SingleTrip?, bool)> get singleTripStream =>
      _oneCRepository.singleTripStream;

  Stream<StartSaleSession?> get saleSession =>
      _oneCRepository.saleSessionStream;

  Stream<bool> get initializationStatusStream =>
      _oneCRepository.initializationStatusStream;

  Future<void> getTrip({
    required String tripId,
    required String departure,
    required String destination,
  }) {
    return _oneCRepository.getTrip(
      tripId: tripId,
      departure: departure,
      destination: destination,
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

  void setTicketingArgs(SingleTrip trip) {
    _cacheRepository.setTicketingArguments(trip: trip);
  }
}
