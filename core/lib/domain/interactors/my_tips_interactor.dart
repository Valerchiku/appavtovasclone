import 'package:core/avtovas_core.dart';
import 'package:core/domain/entities/yookassa/yookassa_payment.dart';
import 'package:core/domain/interfaces/i_payment_repository.dart';

final class MyTripsInteractor {
  final IUserRepository _userRepository;
  final IPaymentRepository _paymentRepository;
  final INotificationsRepository _notificationsRepository;
  final ILocalAuthorizationRepository _localAuthorizationRepository;

  MyTripsInteractor(
    this._userRepository,
    this._paymentRepository,
    this._notificationsRepository,
    this._localAuthorizationRepository,
  );

  Stream<User> get userStream => _userRepository.entityStream;

  bool get isAuth => _user.uuid != '-1' && _user.uuid != '0';

  User get _user => _userRepository.entity;

  Future<String> refundTicket({
    required String dbName,
    required String paymentId,
    required double refundCostAmount,
  }) async {
    final refundObject = await _paymentRepository.refundPayment(
      dbName: dbName,
      paymentId: paymentId,
      refundCostAmount: refundCostAmount,
    );

    return refundObject.$1;
  }

  Future<YookassaPayment> createPaymentObject({
    required String dbName,
    required String value,
    required String paymentDescription,
  }) async {
    final tokenizationModuleInputData =
        _paymentRepository.buildTokenizationInputData(
      dbName: dbName,
      value: value,
      paymentDescription: paymentDescription,
    );

    return _paymentRepository.createPaymentObject(
      dbName: dbName,
      tokenizationModuleInputData: tokenizationModuleInputData,
      value: value,
    );
  }

  Future<(String, String)> generateConfirmationToken({
    required String dbName,
    required String value,
  }) {
    return _paymentRepository.generateConfirmationToken(
      dbName: dbName,
      value: value,
    );
  }

  Future<String> fetchPaymentStatus({
    required String dbName,
    required String paymentId,
  }) {
    return _paymentRepository.fetchPaymentStatus(
      dbName: dbName,
      paymentId: paymentId,
    );
  }

  Future<void> updatePaymentsHistory({
    required String dbName,
    required Payment payment,
  }) {
    final currentPayments = _user.paymentHistory;

    final updatedPayments = [
      payment,
      if (currentPayments != null) ...currentPayments,
    ];

    return _userRepository.updateUser(
      _user.copyWith(
        paymentHistory: updatedPayments,
        shouldClearPaymentHistory: true,
      ),
    );
  }

  Future<void> updateStatusedTrip(
    String uuid, {
    UserTripStatus? userTripStatus,
    UserTripCostStatus? userTripCostStatus,
    String? paymentUuid,
    String? saleCost,
  }) async {
    if (userTripStatus == null && userTripCostStatus == null) return;

    final statusedTripIndex = _user.statusedTrips?.indexWhere(
      (trip) => trip.uuid == uuid,
    );

    if (statusedTripIndex != null) {
      final statusedTrip = _user.statusedTrips![statusedTripIndex];
      final currentPaymentUuid = statusedTrip.paymentUuid;
      final currentSaleCost = statusedTrip.saleCost;

      final updatedStatusedTrips = _user.statusedTrips!
        ..removeAt(statusedTripIndex)
        ..insert(
          statusedTripIndex,
          statusedTrip.copyWith(
            tripStatus: userTripStatus ?? statusedTrip.tripStatus,
            tripCostStatus: userTripCostStatus ?? statusedTrip.tripCostStatus,
            paymentUuid: paymentUuid ?? currentPaymentUuid,
            saleCost: saleCost ?? currentSaleCost,
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

  Future<void> removeTripFromArchive({required String statusedTripUid}) {
    final updatedStatusedTrips = List.of(_user.statusedTrips!)
      ..removeWhere(
        (e) => e.uuid == statusedTripUid,
      );

    return _userRepository.updateUser(
      _user.copyWith(
        shouldClearStatusedTrips: true,
        statusedTrips:
            updatedStatusedTrips.isEmpty ? null : updatedStatusedTrips,
      ),
    );
  }

  Future<void> removeNotificationBySingleTripUid({
    required String singleTripUid,
  }) {
    return _notificationsRepository.removeNotificationByTripUid(
      tripUid: singleTripUid,
    );
  }

  Future<void> insertNewNotification({
    required String notificationTripUuid,
    required String departureTime,
  }) async {
    if (_user.showNotifications && _user.availableFcmTokens != null) {
      final departureDateTime = DateTime.tryParse(departureTime);

      if (departureDateTime == null) return;

      _notificationsRepository.updateScheduledNotifications(
        userUid: _user.uuid,
        notificationDateTime: departureDateTime
            .copyWith(
              hour: departureDateTime.hour - 1,
            )
            .toUtc()
            .toString(),
        availableFcmTokens: _user.availableFcmTokens!,
        notificationTripUid: notificationTripUuid,
      );
    }
  }

  Future<String> fetchLocalUserUuid() {
    return _localAuthorizationRepository.fetchLocalUserUuid();
  }

  Future<User> fetchUser(String userUuid) {
    return _userRepository.fetchUser(userUuid);
  }
}
