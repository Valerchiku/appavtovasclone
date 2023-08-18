import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/trip_details/cubit/trip_details_cubit.dart';
import 'package:avtovas_mobile/src/features/trip_details/widgets/trip_details_body.dart';
import 'package:common/avtovas_common_localization.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:core/avtovas_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class TripDetailsPage extends StatelessWidget {
  final Trip trip;

  const TripDetailsPage({
    required this.trip,
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
    return CubitScope<TripDetailsCubit>(
      child: BlocConsumer<TripDetailsCubit, TripDetailsState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          final cubit = CubitScope.of<TripDetailsCubit>(context);

          return BaseNavigationPage(
            appBarTitle: context.locale.flightInformation,
            leadingSvgPath: AppAssets.backArrowIcon,
            onLeadingTap: cubit.onBackButtonTap,
            onNavigationItemTap: cubit.onNavigationItemTap,
            body: TripDetailsBody(trip: trip),
          );
        },
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
