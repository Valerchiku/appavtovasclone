import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/utils/mocks.dart';
import 'package:avtovas_mobile/src/features/trips_schedule_page/cubit/trips_schedule_cubit.dart';
import 'package:avtovas_mobile/src/features/trips_schedule_page/cubit/trips_schedule_cubit.dart';
import 'package:avtovas_mobile/src/features/trips_schedule_page/widgets/sort_options_selector.dart';
import 'package:avtovas_mobile/src/features/trips_schedule_page/widgets/trips_search_and_pick_date.dart';
import 'package:common/src/widgets/trip_container/trip_container.dart';
import 'package:core/avtovas_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

// ignore_for_file: implementation_imports

class TripsScheduleBody extends StatefulWidget {
  const TripsScheduleBody({super.key});

  @override
  State<TripsScheduleBody> createState() => _TripsScheduleBodyState();
}

class _TripsScheduleBodyState extends State<TripsScheduleBody> {
  late TextEditingController arrivalController;
  late TextEditingController departureController;

  @override
  void initState() {
    super.initState();

    arrivalController = TextEditingController();
    departureController = TextEditingController();
  }

  @override
  void dispose() {
    arrivalController.dispose();
    departureController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripsScheduleCubit, TripsScheduleState>(
      builder: (context, state) {
        final cubit = CubitScope.of<TripsScheduleCubit>(context);
        final foundedTrips = state.foundedTrips;

        return ListView(
          padding: const EdgeInsets.all(AppDimensions.large),
          children: [
            TripsSearchAndPickDate(
              search: cubit.search,
              onTripDateChanged: cubit.setTripDate,
              tripDate: state.tripDate,
              arrivalController: arrivalController,
              departureController: departureController,
              onDepartureSubmitted: cubit.onDepartureChanged,
              onArrivalSubmitted: cubit.onArrivalChanged,
              suggestions: Mocks.routes,
            ),
            const SizedBox(height: AppDimensions.large),
            SortOptionsSelector(
              selectedOption: state.selectedOption,
              onSortOptionChanged: cubit.updateFilter,
            ),
            const SizedBox(height: AppDimensions.large),
            for (final trip in foundedTrips)
              TripContainer(
                ticketPrice: trip.passengerFareCost,
                freePlaces: trip.freeSeatsAmount,
                tripNumber: trip.routeNum,
                tripRoot: trip.routeName,
                departurePlace: trip.departure.name,
                arrivalPlace: trip.destination.name,
                timeInRoad: '12ч 23',
                departureTime: '08:23',
                departureDate: '09 авг',
                arrivalTime: '09:30',
                arrivalDate: '09 авг',
              ),
          ],
        );
      },
    );
  }
}
