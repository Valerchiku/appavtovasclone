import 'package:core/domain/entities/single_trip/single_trip.dart';
import 'package:core/domain/interfaces/i_one_c_repository.dart';
import 'package:core/domain/utils/core_logger.dart';

final class TripDetailsInteractor {
  final IOneCRepository _oneCRepository;

  TripDetailsInteractor(this._oneCRepository);

  Stream<SingleTrip?> get singleTripStream => _oneCRepository.singleTripStream;

  Future<void> getTrip({
    required String tripId,
    required String busStop,
  }) {
    return _oneCRepository.getTrip(
      tripId: tripId,
      busStop: busStop,
    );
  }
  void clearTrip() {
    _oneCRepository.clearTrip();
    CoreLogger.log('[{SingleTrip}] {DONE}');
  }
}
