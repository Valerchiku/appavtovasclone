import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/ticketing/cubit/ticketing_cubit.dart';
import 'package:avtovas_mobile/src/features/ticketing/widgets/ticketing_body.dart';
import 'package:flutter/material.dart';

final class TicketingPage extends StatelessWidget {
  const TicketingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CubitScope<TicketingCubit>(
      child: BaseNavigationPage(
        leadingSvgPath: AppAssets.backArrowIcon,
        appBarTitle: 'Пассажиры',
        body: TicketingBody(),
      ),
    );
  }
}
