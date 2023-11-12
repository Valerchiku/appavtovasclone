import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/navigation/custom_will_pop_scope.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/trip_details/cubit/trip_details_cubit.dart';
import 'package:avtovas_mobile/src/features/trip_details/widgets/trip_details_body.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class TripDetailsPage extends StatelessWidget {
  final String tripId;
  final String departure;
  final String destination;

  const TripDetailsPage({
    required this.tripId,
    required this.departure,
    required this.destination,
    super.key,
  });

  void _listener(BuildContext context, TripDetailsState state) {
    if (state.route.type != null) {
      context.navigateTo(state.route);
    }
  }

  bool _listenWhen(TripDetailsState prev, TripDetailsState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    print(tripId);

    return CubitScope<TripDetailsCubit>(
      child: BlocConsumer<TripDetailsCubit, TripDetailsState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          final cubit = CubitScope.of<TripDetailsCubit>(context);

          return CustomWillPopScope(
            action: cubit.onBackButtonTap,
            onWillPop: true,
            child: BaseNavigationPage(
              appBarTitle: context.locale.flightInformation,
              leadingSvgPath: AppAssets.backArrowIcon,
              onLeadingTap: cubit.onBackButtonTap,
              onNavigationItemTap: cubit.onNavigationItemTap,
              body: TripDetailsBody(
                tripId: tripId,
                departure: departure,
                destination: destination,
                tripDetailsCubit: cubit,
              ),
            ),
          );
        },
      ),
    );
  }
}

final class TripDetailsArguments extends PageArguments {
  final String routeId;
  final String departure;
  final String destination;

  @override
  List<Object?> get props => [
        routeId,
        departure,
        destination,
      ];

  TripDetailsArguments({
    required this.routeId,
    required this.departure,
    required this.destination,
  });
}
