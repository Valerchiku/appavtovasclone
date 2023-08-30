import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/ticketing/cubit/ticketing_cubit.dart';
import 'package:avtovas_mobile/src/features/ticketing/widgets/ticketing_body.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:flutter/material.dart';

final class TicketingPage extends StatelessWidget {
  final String tripId;
  final String departure;
  final String destination;

  const TicketingPage({
    required this.tripId,
    required this.departure,
    required this.destination,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CubitScope<TicketingCubit>(
      child: BaseNavigationPage(
        leadingSvgPath: AppAssets.backArrowIcon,
        appBarTitle: context.locale.passengers,
        body: TicketingBody(
          tripId: tripId,
          departure: departure,
          destination: destination,
          // ticketingCubit: CubitScope.of<TicketingCubit>(context),
        ),
      ),
    );
  }
}

final class TicketingArguments extends PageArguments {
  final String tripId;
  final String departure;
  final String destination;

  @override
  List<Object?> get props => [
        tripId,
        departure,
        destination,
      ];

  TicketingArguments({
    required this.tripId,
    required this.departure,
    required this.destination,
  });
}
