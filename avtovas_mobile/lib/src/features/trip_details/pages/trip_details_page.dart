import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/trip_details/cubit/trip_details_cubit.dart';
import 'package:avtovas_mobile/src/features/trip_details/widgets/trip_details_body.dart';
import 'package:flutter/material.dart';

final class TripDetailsPage extends StatelessWidget {
  const TripDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitScope<TripDetailsCubit>(
      child: BaseNavigationPage(
        appBarTitle: context.locale.flightInformation,
        leadingSvgPath: AppAssets.backArrowIcon,
        onLeadingTap: () {},
        body: const TripDetailsBody(),
      ),
    );
  }
}
