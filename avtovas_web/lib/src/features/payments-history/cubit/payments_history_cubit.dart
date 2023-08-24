import 'package:common/avtovas_navigation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'payments_history_state.dart';

class PaymentsHistoryCubit extends Cubit<PaymentsHistoryState> {
  PaymentsHistoryCubit()
      : super(
          const PaymentsHistoryState(
            route: CustomRoute(
              null,
              null,
            ),
          ),
        );
}
