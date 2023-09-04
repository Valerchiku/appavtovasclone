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

  Stream<List<BusStop>?> get busStopsStream => _oneCRepository.busStopsStream;

  Stream<List<Trip>?> get tripsStream => _oneCRepository.tripsStream;

  Future<void> clearSearchHistory() async {
    final currentUser = _userRepository.entity;

    return _userRepository.updateUser(
      currentUser.copyWith(shouldClearSearchHistory: true),
    );
  }
}
