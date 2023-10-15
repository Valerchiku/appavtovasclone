import 'package:core/avtovas_core.dart';
import 'package:core/domain/entities/app_entities/user.dart';
import 'package:core/domain/entities/yookassa/yookassa_payment.dart';
import 'package:core/domain/interfaces/i_payment_repository.dart';
import 'package:core/domain/interfaces/i_user_repository.dart';
import 'package:core/domain/utils/user_trip_status.dart';

final class MyTripsInteractor {
  final IUserRepository _userRepository;
  final IPaymentRepository _paymentRepository;
  final IOneCRepository _oneCRepository;

  MyTripsInteractor(
    this._userRepository,
    this._paymentRepository,
    this._oneCRepository,
  );

  Stream<User> get userStream => _userRepository.entityStream;

  bool get isAuth => _user.uuid != '-1' && _user.uuid != '0';

  User get _user => _userRepository.entity;

  String get _dbName => _oneCRepository.dbName;

  Future<YookassaPayment> createPaymentObject({
    required String value,
    required String paymentDescription,
  }) async {
    final tokenizationModuleInputData =
        _paymentRepository.buildTokenizationInputData(
      value: value,
      paymentDescription: paymentDescription,
    );

    return _paymentRepository.createPaymentObject(
      tokenizationModuleInputData: tokenizationModuleInputData,
      value: value,
    );
  }

  Future<String> fetchPaymentStatus({required String paymentId}) {
    return _paymentRepository.fetchPaymentStatus(paymentId: paymentId);
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
            tripStatus: userTripStatus ?? statusedTrip.tripStatus,
            tripCostStatus: userTripCostStatus ?? statusedTrip.tripCostStatus,
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

  String getDbName() {
    return _dbName;
  }
}
