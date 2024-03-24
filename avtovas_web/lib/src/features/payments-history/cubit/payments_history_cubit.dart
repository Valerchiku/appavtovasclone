import 'package:common/avtovas_navigation.dart';
import 'package:core/domain/entities/app_entities/payment.dart';
import 'package:core/domain/entities/app_entities/statused_trip.dart';
import 'package:core/domain/interactors/payment_history_interactor.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'payments_history_state.dart';

class PaymentsHistoryCubit extends Cubit<PaymentsHistoryState> {
  final PaymentHistoryInteractor _paymentHistoryInteractor;

  PaymentsHistoryCubit(this._paymentHistoryInteractor)
      : super(
          const PaymentsHistoryState(
            route: CustomRoute(null, null),
          ),
        ) {
    _fetchPaymentsHistory();
  }

  void _fetchPaymentsHistory() {
    emit(
      state.copyWith(
        payments: _paymentHistoryInteractor.payments,
        statusedTrips: _paymentHistoryInteractor.statusedTrips,
      ),
    );
  }
}
