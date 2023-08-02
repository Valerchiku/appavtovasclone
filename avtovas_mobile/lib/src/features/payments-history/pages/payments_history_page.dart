import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/payments-history/widgets/payments_history_body.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';

class PaymentsHistoryPage extends StatelessWidget {
  const PaymentsHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseNavigationPage(
      appBarTitle: context.locale.paymentsHistoryTitle,
      body: PaymentsHistoryBody(),
    );
  }
}
