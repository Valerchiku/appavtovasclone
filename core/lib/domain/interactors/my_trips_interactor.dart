import 'package:core/domain/entities/app_entities/user.dart';
import 'package:core/domain/interfaces/i_payment_repository.dart';
import 'package:core/domain/interfaces/i_user_repository.dart';
import 'package:core/domain/utils/user_trip_status.dart';

final class MyTripsInteractor {
  final IUserRepository _userRepository;
  final IPaymentRepository _paymentRepository;

  MyTripsInteractor(
    this._userRepository,
    this._paymentRepository,
  );

  Stream<User> get userStream => _userRepository.entityStream;

  bool get isAuth => _user.uuid != '-1' && _user.uuid != '0';

  User get _user => _userRepository.entity;

  Future<void> startPayment() {
    return _paymentRepository.startPayment(value: '200');
  }

  Future<void> changeTripStatuses(
    String uuid, {
    UserTripStatus? userTripStatus,
    UserTripCostStatus? userTripCostStatus,
  }) async {
    if (userTripStatus == null && userTripCostStatus == null) return;

    final statusedTripIndex = _user.statusedTrips?.indexWhere(
      (trip) => trip.uuid == uuid,
    );

    if (statusedTripIndex != null) {
      final statusedTrip = _user.statusedTrips![statusedTripIndex];

      final updatedStatusedTrips = _user.statusedTrips!
        ..removeAt(statusedTripIndex)
        ..insert(
          statusedTripIndex,
          statusedTrip.copyWith(
            tripStatus: userTripStatus,
            tripCostStatus: userTripCostStatus,
          ),
        );

      return _userRepository.updateUser(
        _user.copyWith(
          statusedTrips: updatedStatusedTrips,
          shouldClearStatusedTrips: true,
        ),
      );
    }
  }
}
