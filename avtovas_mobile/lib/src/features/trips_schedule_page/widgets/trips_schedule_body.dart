import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/utils/sort_options.dart';
import 'package:avtovas_mobile/src/features/trips_schedule_page/cubit/trips_schedule_cubit.dart';
import 'package:avtovas_mobile/src/features/trips_schedule_page/widgets/sort_options_selector.dart';
import 'package:avtovas_mobile/src/features/trips_schedule_page/widgets/trips_search_and_pick_date.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore_for_file: implementation_imports

class TripsScheduleBody extends StatefulWidget {
  final String departurePlace;
  final String arrivalPlace;
  final DateTime tripDate;
  final TripsScheduleCubit cubit;

  const TripsScheduleBody({
    required this.cubit,
    required this.departurePlace,
    required this.arrivalPlace,
    required this.tripDate,
    super.key,
  });

  @override
  State<TripsScheduleBody> createState() => _TripsScheduleBodyState();
}

class _TripsScheduleBodyState extends State<TripsScheduleBody> {
  late TextEditingController arrivalController;
  late TextEditingController departureController;

  @override
  void initState() {
    super.initState();

    arrivalController = TextEditingController(text: widget.arrivalPlace);
    departureController = TextEditingController(text: widget.departurePlace);

    widget.cubit.setDestination(
      widget.departurePlace,
      widget.arrivalPlace,
      widget.tripDate,
    );
  }

  @override
  void dispose() {
    arrivalController.dispose();
    departureController.dispose();

    super.dispose();
  }

  sortTripsByTime(List<Trip>? trips) {
    return trips!.sort(
      (a, b) => a.passengerFareCost.compareTo(b.passengerFareCost),
    );
  }

  sortTripsByPrice(List<Trip>? trips) {
    return trips!.sort(
      (a, b) => a.departureTime.compareTo(b.departureTime),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripsScheduleCubit, TripsScheduleState>(
      bloc: widget.cubit,
      builder: (context, state) {
        final foundedTrips = state.foundedTrips;

        if (state.foundedTrips == null || state.foundedTrips!.isEmpty) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(AppDimensions.large),
                child: TripsSearchAndPickDate(
                  state: state,
                  search: widget.cubit.search,
                  onTripDateChanged: widget.cubit.setTripDate,
                  arrivalController: arrivalController,
                  departureController: departureController,
                  onDepartureSubmitted: widget.cubit.onDepartureChanged,
                  onArrivalSubmitted: widget.cubit.onArrivalChanged,
                ),
              ),
              const Spacer(),
              if (state.foundedTrips == null)
                const CupertinoActivityIndicator(),
              if (state.foundedTrips != null && state.foundedTrips!.isEmpty)
                // TODO(dev): Localization.
                Column(
                  children: [
                    Text(
                      context.locale.routesNotFound,
                      style:
                          context.themeData.textTheme.displayMedium?.copyWith(
                        color: context.theme.assistiveTextColor,
                      ),
                    ),
                    Text(
                      context.locale.checkOtherDatesAndStations,
                      style:
                          context.themeData.textTheme.headlineSmall?.copyWith(
                        color: context.theme.mainAppColor,
                        fontWeight: CommonFonts.weightMedium,
                      ),
                    ),
                  ],
                ),
              const Spacer(),
            ],
          );
        } else {
          if (state.selectedOption == SortOptions.byTime) {
            print('time');
            foundedTrips!.sort(
              (a, b) => a.departureTime.compareTo(b.departureTime),
            );
          } else {
            print('price');
            foundedTrips!.sort(
              (a, b) => int.parse(a.passengerFareCost).compareTo(
                int.parse(
                  b.passengerFareCost,
                ),
              ),
            );
          }
          return ListView(
            padding: const EdgeInsets.all(AppDimensions.large),
            children: [
              TripsSearchAndPickDate(
                state: state,
                search: widget.cubit.search,
                onTripDateChanged: widget.cubit.setTripDate,
                arrivalController: arrivalController,
                departureController: departureController,
                onDepartureSubmitted: widget.cubit.onDepartureChanged,
                onArrivalSubmitted: widget.cubit.onArrivalChanged,
              ),
              const SizedBox(height: AppDimensions.large),
              SortOptionsSelector(
                selectedOption: state.selectedOption,
                onSortOptionChanged: widget.cubit.updateFilter,
              ),
              const SizedBox(height: AppDimensions.large),
              for (final trip in foundedTrips)
                TripContainer(
                  onTap: () => widget.cubit.onTripTap(trip),
                  ticketPrice: context.locale.price(trip.passengerFareCost),
                  freePlaces: trip.freeSeatsAmount,
                  tripNumber: trip.routeNum,
                  tripRoot: trip.routeName,
                  departurePlace: trip.departure.name,
                  arrivalPlace: trip.destination.name,
                  timeInRoad: trip.duration,
                  departureDateTime: trip.departureTime,
                  arrivalDateTime: trip.arrivalTime,
                ),
            ],
          );
        }
      },
    );
  }
}
