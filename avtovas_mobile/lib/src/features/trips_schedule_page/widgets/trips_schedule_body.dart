import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/utils/mocks.dart';
import 'package:avtovas_mobile/src/features/trips_schedule_page/widgets/trips_search_and_pick_date.dart';
import 'package:avtovas_mobile/src/features/trips_schedule_page/widgets/trips_sort_menu.dart';
import 'package:common/src/widgets/trip_container/trip_container.dart';
import 'package:flutter/material.dart';

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
    arrivalController = TextEditingController();
    departureController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    arrivalController.dispose();
    departureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.large,
        vertical: AppDimensions.large,
      ),
      child: Column(
        children: [
          TripsSearchAndPickDate(
            arrivalController: arrivalController,
            departureController: departureController,
            cities: Mocks.routes,
          ),
          const SizedBox(height: AppDimensions.large),
          const TripsSortMenu(),
          const SizedBox(height: AppDimensions.large),
          Expanded(
            child: ListView(
              children: [
                TripContainer(
                  ticketPrice: Mocks.trip.ticketPrice,
                  freePlaces: Mocks.trip.freePlaces,
                  tripNumber: Mocks.trip.tripNumber,
                  tripRoot: Mocks.trip.tripRoot,
                  departurePlace: Mocks.trip.departurePlace,
                  arrivalPlace: Mocks.trip.arrivalPlace,
                  timeInRoad: Mocks.trip.timeInRoad,
                  departureTime: Mocks.trip.departureTime,
                  departureDate: Mocks.trip.departureDate,
                  arrivalTime: Mocks.trip.arrivalTime,
                  arrivalDate: Mocks.trip.arrivalDate,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
