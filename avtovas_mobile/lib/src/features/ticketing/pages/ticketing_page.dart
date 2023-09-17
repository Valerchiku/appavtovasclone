import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/navigation/custom_will_pop_scope.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/ticketing/cubit/ticketing_cubit.dart';
import 'package:avtovas_mobile/src/features/ticketing/widgets/ticketing_body.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:core/domain/entities/single_trip/single_trip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class TicketingPage extends StatelessWidget {
  final SingleTrip trip;

  const TicketingPage({
    required this.trip,
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
          return CustomWillPopScope(
            action: cubit.onBackButtonTap,
            onWillPop: true,
            child: BaseNavigationPage(
              leadingSvgPath: AppAssets.backArrowIcon,
              appBarTitle: context.locale.passengers,
              onLeadingTap: cubit.onBackButtonTap,
              onNavigationItemTap: cubit.onNavigationItemTap,
              body: TicketingBody(
                cubit: cubit,
                trip: trip,
              ),
            ),
          );
        },
      ),
    );
  }
}

final class TicketingArguments extends PageArguments {
  final SingleTrip trip;

  @override
  List<Object?> get props => [
        trip,
      ];

  TicketingArguments({
    required this.trip,
  });
}
