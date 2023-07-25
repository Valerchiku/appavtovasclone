import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/trips_schedule_page/cubit/trips_schedule_cubit.dart';
import 'package:avtovas_mobile/src/features/trips_schedule_page/widgets/trips_schedule_body.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

// ignore_for_file: unnecessary_statements
// ignore_for_file: implementation_imports

class TripsSchedulePage extends StatelessWidget {
  const TripsSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitScope<TripsScheduleCubit>(
      child: BaseNavigationPage(
        appBarTitle: context.locale.schedule,
        leadingSvgPath: AppAssets.backArrowIcon,
        onLeadingTap: () {},
        body: const TripsScheduleBody(),
      ),
    );
  }
}
