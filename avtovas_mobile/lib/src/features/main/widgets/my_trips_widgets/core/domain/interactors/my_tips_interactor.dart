import 'package:avtovas_mobile/src/features/main/widgets/my_trips_widgets/core/domain/interfaces/i_payment_repository.dart';
import 'package:core/domain/entities/app_entities/user.dart';
import 'package:core/domain/interfaces/i_user_repository.dart';
import 'package:core/domain/utils/user_trip_status.dart';
import 'package:yookassa_payments_flutter/input_data/tokenization_module_input_data.dart';
import 'package:yookassa_payments_flutter/yookassa_payments_flutter.dart';

final class MyTripsInteractor {
  final IPaymentRepository _paymentRepository;
  final IUserRepository _userRepository;

  MyTripsInteractor(
    this._paymentRepository,
    this._userRepository,
  );

  Stream<User> get userStream => _userRepository.entityStream;

  bool get isAuth => _user.uuid != '-1' && _user.uuid != '0';

  User get _user => _userRepository.entity;

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

  Future<TokenizationResult> fetchPaymentToken(
    String value,
    String? title,
    String? subtitle,
  ) async {
    final result = await YookassaPaymentsFlutter.tokenization(
      _buildTokenizationInputData(
        value,
        title,
        subtitle,
      ),
    );

    return result;
  }

  TokenizationModuleInputData _buildTokenizationInputData(
    String value,
    String? title,
    String? subtitle,
  ) {
    return _paymentRepository.buildTokenizationInputData(
      value: value,
      title: title,
      subtitle: subtitle,
    );
  }

  Future<void> startPayment(TokenizationResult result) {
    return _paymentRepository.startPayment(result);
  }
}
