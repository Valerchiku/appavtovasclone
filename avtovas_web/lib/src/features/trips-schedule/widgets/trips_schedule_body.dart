import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/constants/web_assets.dart';
import 'package:avtovas_web/src/common/constants/web_fonts.dart';
import 'package:avtovas_web/src/features/trips-schedule/cubit/trips_schedule_cubit.dart';
import 'package:avtovas_web/src/features/trips-schedule/widgets/trips_search_and_pick_date.dart';
import 'package:avtovas_web/src/features/trips-schedule/widgets/trips_sort_menu.dart';
import 'package:avtovas_web/src/features/trips-schedule/widgets/web_trip_container.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore_for_file: implementation_imports

class TripsScheduleBody extends StatefulWidget {
  final bool smartLayout;
  final String departurePlace;
  final String arrivalPlace;
  final DateTime tripDate;
  final TripsScheduleCubit cubit;

  final bool extraWasEmpty;

  const TripsScheduleBody({
    required this.smartLayout,
    required this.cubit,
    required this.departurePlace,
    required this.arrivalPlace,
    required this.tripDate,
    required this.extraWasEmpty,
    super.key,
  });

  @override
  State<TripsScheduleBody> createState() => _TripsScheduleBodyState();
}

class _TripsScheduleBodyState extends State<TripsScheduleBody> {
  late final TextEditingController _arrivalController;
  late final TextEditingController _departureController;

  @override
  void initState() {
    super.initState();

    _arrivalController = TextEditingController(text: widget.arrivalPlace);
    _departureController = TextEditingController(text: widget.departurePlace);

    widget.cubit.initializationStatusSubscribe(
      widget.departurePlace,
      widget.arrivalPlace,
      widget.tripDate,
    );
  }

  @override
  void dispose() {
    _arrivalController.dispose();
    _departureController.dispose();

    super.dispose();
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
              TripsSearchAndPickDate(
                state: state,
                smartLayout: widget.smartLayout,
                search: widget.cubit.search,
                onTripDateChanged: widget.cubit.setTripDate,
                arrivalController: _arrivalController,
                departureController: _departureController,
                onDepartureChanged: widget.cubit.onDepartureChanged,
                onArrivalChanged: widget.cubit.onArrivalChanged,
              ),
              if (state.foundedTrips == null) ...[
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.2),
                const CupertinoActivityIndicator(),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.2),
              ],
              if (state.foundedTrips != null &&
                  state.foundedTrips!.isEmpty) ...[
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.2),
                Text(
                  context.locale.routesNotFound,
                  style: context.themeData.textTheme.displayMedium?.copyWith(
                    color: context.theme.assistiveTextColor,
                  ),
                ),
                Text(
                  context.locale.checkOtherDatesAndStations,
                  style: context.themeData.textTheme.headlineSmall?.copyWith(
                    color: context.theme.mainAppColor,
                    fontWeight: CommonFonts.weightMedium,
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.2),
              ],
            ],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TripsSearchAndPickDate(
                state: state,
                smartLayout: widget.smartLayout,
                search: widget.cubit.search,
                onTripDateChanged: widget.cubit.setTripDate,
                arrivalController: _arrivalController,
                departureController: _departureController,
                onDepartureChanged: widget.cubit.onDepartureChanged,
                onArrivalChanged: widget.cubit.onArrivalChanged,
              ),
              const SizedBox(height: AppDimensions.large),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: widget.smartLayout
                      ? AppDimensions.large
                      : AppDimensions.extraLarge,
                ),
                child: Text(
                  'Главная / Расписание маршрутов',
                  style: context.themeData.textTheme.bodyLarge?.copyWith(
                    fontSize: WebFonts.sizeTitleMedium,
                    color: context.theme.fivefoldTextColor,
                  ),
                ),
              ),
              const SizedBox(height: AppDimensions.large),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: widget.smartLayout
                      ? AppDimensions.large
                      : AppDimensions.extraLarge,
                ),
                child: Row(
                  children: [
                    AvtovasVectorButton(
                      onTap: widget.cubit.goPreviousPage,
                      svgAssetPath: WebAssets.backArrowIcon,
                      iconColor: context.theme.defaultIconColor,
                      innerPadding: EdgeInsets.zero,
                    ),
                    const SizedBox(width: AppDimensions.large),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Расписание маршрутов на ',
                                  style: context.themeData.textTheme.bodyLarge
                                      ?.copyWith(
                                    fontSize: WebFonts.sizeDisplayMedium,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: state.tripDate!.dayMonth(context),
                                  style: context.themeData.textTheme.bodyLarge
                                      ?.copyWith(
                                    fontSize: WebFonts.sizeDisplayMedium,
                                    color: context.theme.primaryTextColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppDimensions.large),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: widget.smartLayout
                      ? AppDimensions.large
                      : AppDimensions.extraLarge,
                ),
                child: SizedBox(
                  width: 200,
                  child: TripsSortMenu(
                    selectedOption: state.selectedOption,
                    onSortOptionChanged: (value) => widget.cubit.updateFilter(
                      state.foundedTrips,
                      value,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppDimensions.large),
              for (final trip in foundedTrips!)
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: widget.smartLayout
                        ? AppDimensions.large
                        : AppDimensions.extraLarge,
                  ),
                  child: WebTripContainer(
                    onTap: () => widget.cubit.onTripTap(trip),
                    ticketPrice: context.locale.price(trip.passengerFareCost),
                    freePlaces: trip.freeSeatsAmount!,
                    tripNumber: trip.routeNum,
                    tripRoot: trip.routeName,
                    departurePlace: trip.departure.name,
                    arrivalPlace: trip.destination.name,
                    timeInRoad: trip.duration!,
                    departureDateTime: trip.departureTime,
                    arrivalDateTime: trip.arrivalTime!,
                  ),
                ),
            ],
          );
        }
      },
    );
  }
}
