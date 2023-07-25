import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/utils/mocks.dart';
import 'package:avtovas_mobile/src/features/trips_schedule_page/cubit/trips_schedule_cubit.dart';
import 'package:avtovas_mobile/src/features/trips_schedule_page/widgets/trips_search_and_pick_date.dart';
import 'package:avtovas_mobile/src/features/trips_schedule_page/widgets/trips_sort_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TripsScheduleBody extends StatefulWidget {
  const TripsScheduleBody({super.key});

  @override
  State<TripsScheduleBody> createState() => _TripsScheduleBodyState();
}

class _TripsScheduleBodyState extends State<TripsScheduleBody> {
  final arrivalController = TextEditingController();
  final departureController = TextEditingController();

  @override
  void dispose() {
    arrivalController.dispose();
    departureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tripsScheduleCubit = context.watch<TripsScheduleCubit>();
    final selectedOption = tripsScheduleCubit.state.selectedOption;
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.large,
        vertical: AppDimensions.large,
      ),
      children: [
        TripsSearchAndPickDate(
          arrivalController: arrivalController,
          departureController: departureController,
          cities: Mocks.routes,
        ),
        const SizedBox(height: AppDimensions.large),
        TripsSortMenu(
          tripsScheduleCubit: tripsScheduleCubit,
          selectedOption: selectedOption,
        ),
      ],
    );
  }
}
