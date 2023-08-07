import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/payments-history/cubit/payments_history_cubit.dart';
import 'package:avtovas_mobile/src/features/payments-history/widgets/payments_history_body.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentsHistoryPage extends StatelessWidget {
  const PaymentsHistoryPage({super.key});

  void _listener(BuildContext context, PaymentsHistoryState state) {
    if (state.route.type != null) {
      context.navigateTo(state.route);
    }
  }

  bool _listenWhen(PaymentsHistoryState prev, PaymentsHistoryState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<PaymentsHistoryCubit>(
      child: BlocConsumer<PaymentsHistoryCubit, PaymentsHistoryState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          final cubit = CubitScope.of<PaymentsHistoryCubit>(context);

          return BaseNavigationPage(
            appBarTitle: context.locale.paymentsHistoryTitle,
            leadingSvgPath: AppAssets.backArrowIcon,
            onLeadingTap: cubit.onBackButtonTap,
            onNavigationItemTap: cubit.onNavigationItemTap,
            body: const PaymentsHistoryBody(),
          );
        },
      ),
    );
  }
}
