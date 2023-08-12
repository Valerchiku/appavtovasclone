import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/trips_schedule_page/cubit/trips_schedule_cubit.dart';
import 'package:avtovas_mobile/src/features/trips_schedule_page/widgets/trips_schedule_body.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:core/avtovas_core.dart';

import 'package:flutter/material.dart';

class TripsSchedulePage extends StatelessWidget {
  const TripsSchedulePage({
    super.key,
  });

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

final class TripsScheduleArguments extends PageArguments {
  final BusStop departureBusStop;
  final BusStop arrivalBusStop;

  @override
  List<Object?> get props => [
        departureBusStop,
        arrivalBusStop,
      ];

  TripsScheduleArguments({
    required this.departureBusStop,
    required this.arrivalBusStop,
  });
}
