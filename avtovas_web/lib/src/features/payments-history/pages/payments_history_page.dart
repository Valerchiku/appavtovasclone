import 'package:avtovas_web/src/features/payments-history/widgets/payments_history_body.dart';
import 'package:flutter/material.dart';

class PaymentsHistoryPage extends StatelessWidget {
  const PaymentsHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaymentsHistoryPageBody(),
    );
  }
}
