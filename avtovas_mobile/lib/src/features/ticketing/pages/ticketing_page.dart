import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/ticketing/cubit/ticketing_cubit.dart';
import 'package:avtovas_mobile/src/features/ticketing/widgets/ticketing_body.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  void _listener(BuildContext context, TicketingState state) {
    if (state.route.type != null) {
      context.navigateTo(state.route);
    }
  }

  bool _listenWhen(TicketingState prev, TicketingState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<TicketingCubit>(
      child: BlocConsumer<TicketingCubit, TicketingState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          final cubit = CubitScope.of<TicketingCubit>(context);
          return BaseNavigationPage(
            leadingSvgPath: AppAssets.backArrowIcon,
            appBarTitle: context.locale.passengers,
            onLeadingTap: cubit.onBackButtonTap,
            body: TicketingBody(
              tripId: tripId,
              departure: departure,
              destination: destination,
              ticketingCubit: cubit,
            ),
          );
        },
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
