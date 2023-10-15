import 'package:avtovas_web/src/common/widgets/base_page/base_page.dart';
import 'package:avtovas_web/src/features/trips_schedule/widgets/trips_schedule_body.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:flutter/material.dart';

class TripsSchedulePage extends StatelessWidget {
  const TripsSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    // return CubitScope<TripsScheduleCubit>(
    //   child: BlocConsumer<TripsScheduleCubit, TripsScheduleState>(
    //     listener: (context, state) => null,
    //     builder: (context, state) {
    //       final cubit = CubitScope.of<TripsScheduleCubit>(context);
    //       return const BasePage(
    //         body: TripsScheduleBody(),
    //       );
    //     },
    //   ),
    // );
    return const BasePage(
      body: TripsScheduleBody(),
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
