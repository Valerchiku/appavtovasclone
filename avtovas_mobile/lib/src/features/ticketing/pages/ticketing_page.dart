import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/ticketing/cubit/ticketing_cubit.dart';
import 'package:avtovas_mobile/src/features/ticketing/widgets/ticketing_body.dart';
import 'package:common/avtovas_common_localization.dart';
import 'package:common/avtovas_common_utils.dart';
import 'package:flutter/material.dart';

final class TicketingPage extends StatelessWidget {
  final MockTrip trip;

  const TicketingPage({
    required this.trip,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CubitScope<TicketingCubit>(
      child: BaseNavigationPage(
        leadingSvgPath: AppAssets.backArrowIcon,
        appBarTitle: context.locale.passengers,
        body: TicketingBody(
          trip: trip,
        ),
      ),
    );
  }
}
