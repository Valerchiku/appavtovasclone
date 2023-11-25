import 'package:common/avtovas_navigation.dart';
import 'package:core/domain/entities/app_entities/payment.dart';
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
      state.copyWith(payments: _paymentHistoryInteractor.payments),
    );
  }

  void onNavigationItemTap(int navigationIndex) {
    emit(
      state.copyWith(
        // route: RouteHelper.clearedRoute(navigationIndex),
      ),
    );

    emit(
      state.copyWith(
        route: const CustomRoute(null, null),
      ),
    );
  }

  void onBackButtonTap() {
    emit(
      state.copyWith(
        route: const CustomRoute.pop(),
      ),
    );
  }
}
