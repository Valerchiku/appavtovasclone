import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/trip_details/cubit/trip_details_cubit.dart';
import 'package:avtovas_mobile/src/features/trip_details/widgets/trip_details_body.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:core/avtovas_core.dart';
import 'package:flutter/material.dart';

final class TripDetailsPage extends StatelessWidget {
  final Trip trip;

  const TripDetailsPage({
    required this.trip,
    super.key,
  });

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

final class TripDetailsArguments extends PageArguments {
  final Trip trip;

  @override
  List<Object?> get props => [
        trip,
      ];

  TripDetailsArguments({
    required this.trip,
  });
}
