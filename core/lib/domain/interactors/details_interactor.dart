import 'package:core/domain/entities/single_trip/single_trip.dart';
import 'package:core/domain/interfaces/i_one_c_repository.dart';

final class DetailsInteractor {
  final IOneCRepository _oneCRepository;

  DetailsInteractor(this._oneCRepository);

  Stream<SingleTrip?> get singleTrip => _oneCRepository.singleTripStream;

  Future<void> getTrip({
    required String tripId,
    required String busStop,
  }) {
    return _oneCRepository.getTrip(
      tripId: tripId,
      busStop: busStop,
    );
  }
}
