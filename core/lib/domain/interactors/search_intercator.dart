import 'package:core/domain/entities/app_entities/user.dart';
import 'package:core/domain/entities/bus_stop/bus_stop.dart';
import 'package:core/domain/entities/trip/trip.dart';
import 'package:core/domain/interfaces/i_one_c_repository.dart';
import 'package:core/domain/interfaces/i_user_repository.dart';

final class SearchInteractor {
  final IUserRepository _userRepository;
  final IOneCRepository _oneCRepository;

  SearchInteractor(
    this._oneCRepository,
    this._userRepository,
  );

  Stream<User> get userStream => _userRepository.entityStream;

  Stream<List<BusStop>> get avtovasBusStopsStream =>
      _oneCRepository.avtovasBusStopsStream;

  Stream<List<BusStop>> get stepanovBusStopsStream =>
      _oneCRepository.stepanovBusStopsStream;

  Stream<List<Trip>?> get tripsStream => _oneCRepository.tripsStream;

  Future<void> getTrips({
    required String departure,
    required String destination,
    required String tripsDate,
  }) {
    return _oneCRepository.getTrips(
      departure: departure,
      destination: destination,
      tripsDate: tripsDate,
    );
  }

  Future<void> fetchUser(String userUuid) {
    return _userRepository.fetchUser(userUuid);
  }
}
