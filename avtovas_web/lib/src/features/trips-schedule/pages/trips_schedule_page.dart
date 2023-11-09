import 'package:avtovas_web/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_web/src/common/widgets/base_page/base_page.dart';
import 'package:avtovas_web/src/features/trips-schedule/cubit/trips_schedule_cubit.dart';
import 'package:avtovas_web/src/features/trips-schedule/widgets/trips_schedule_body.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_navigation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TripsSchedulePage extends StatelessWidget {
  final String departurePlace;
  final String arrivalPlace;
  final DateTime tripDate;

  const TripsSchedulePage({
    required this.departurePlace,
    required this.arrivalPlace,
    required this.tripDate,
    super.key,
  });

  void _listener(BuildContext context, TripsScheduleState state) {
    if (state.route.type != null) {
      context.navigateTo(state.route);
    }
  }

  bool _listenWhen(TripsScheduleState prev, TripsScheduleState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<TripsScheduleCubit>(
      child: BlocBuilder<TripsScheduleCubit, TripsScheduleState>(
        builder: (context, state) {
          final cubit = CubitScope.of<TripsScheduleCubit>(context);
          return BasePageBuilder(
            layoutBuilder: (smartLayout, __) {
              return TripsScheduleBody(
                smartLayout: smartLayout,
                departurePlace: departurePlace,
                arrivalPlace: arrivalPlace,
                tripDate: tripDate,
                cubit: cubit,
              );
            },
          );
        },
      ),
    );
  }
}

final class TripsScheduleArguments extends PageArguments {
  final String departurePlace;
  final String arrivalPlace;
  final DateTime tripDate;

  @override
  List<Object?> get props => [
        departurePlace,
        arrivalPlace,
        tripDate,
      ];

  TripsScheduleArguments({
    required this.departurePlace,
    required this.arrivalPlace,
    required this.tripDate,
  });
}
