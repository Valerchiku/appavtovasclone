import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/widgets/avtovas_search_trip/avtovas_search_trip.dart';
import 'package:avtovas_web/src/features/trips-schedule/cubit/trips_schedule_cubit.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_utils_widgets.dart';
import 'package:flutter/material.dart';

class TripsSearchAndPickDate extends StatelessWidget {
  final bool smartLayout;
  final ValueChanged<String> onDepartureChanged;
  final ValueChanged<String> onArrivalChanged;
  final TripsScheduleState state;
  final ValueChanged<DateTime> onTripDateChanged;
  final VoidCallback search;
  final TextEditingController arrivalController;
  final TextEditingController departureController;

  const TripsSearchAndPickDate({
    required this.smartLayout,
    required this.onDepartureChanged,
    required this.onArrivalChanged,
    required this.state,
    required this.onTripDateChanged,
    required this.search,
    required this.arrivalController,
    required this.departureController,
    super.key,
  });

  Future<void> _selectDate(BuildContext context) async {
    final now = DateTime.now();

    final tripDate = await SupportMethods.showAvtovasDatePicker(
      context,
      showDatePicker(
        context: context,
        initialDate: state.tripDate,
        firstDate: now,
        lastDate: now.copyWith(month: now.month + 6),
        confirmText: 'НАЙТИ БИЛЕТ',
        builder: (context, child) {
          return Theme(
            data: context.themeData.copyWith(
              datePickerTheme: DatePickerThemeData(
                dividerColor: context.theme.mainAppColor,
                shape: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppDimensions.mediumLarge),
                  ),
                ),
                headerForegroundColor: context.theme.whiteTextColor,
                headerBackgroundColor: context.theme.mainAppColor,
                dayOverlayColor: MaterialStateProperty.all(
                  context.theme.mainAppColor.withOpacity(0.1),
                ),
                yearOverlayColor: MaterialStateProperty.all(
                  context.theme.mainAppColor.withOpacity(0.1),
                ),
                confirmButtonStyle: ElevatedButton.styleFrom(
                  backgroundColor: context.theme.mainAppColor,
                  foregroundColor: context.theme.whiteTextColor,
                  textStyle: context.themeData.textTheme.bodyLarge?.copyWith(
                    color: context.theme.whiteTextColor,
                  ),
                ),
              ),
              colorScheme: ColorScheme.light(
                primary: context.theme.mainAppColor,
              ),
            ),
            child: child!,
          );
        },
      ),
    );

    if (tripDate != null) {
      onTripDateChanged(tripDate);
      search();
    }
  }

  void _onSwapButtonTap() {
    onDepartureChanged(departureController.text);
    onArrivalChanged(arrivalController.text);

    search();
  }

  @override
  Widget build(BuildContext context) {
    return AvtovasSearchTrip(
      buttonText: state.tripDate?.yMMMdFormat(context.locale.localeName) ??
          context.locale.date,
      arrivalController: arrivalController,
      departureController: departureController,
      onChangedArrival: onArrivalChanged,
      search: search,
      onChangedDeparture: onDepartureChanged,
      onSwapTap: _onSwapButtonTap,
      onDateTap: () => _selectDate(context),
      suggestions: state.suggestions ?? [],
      smartLayout: smartLayout,
    );
    /*return Container(
      padding: const EdgeInsets.all(AppDimensions.large),
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.theme.detailsBackgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(AppDimensions.medium),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchTripVertical(
            items: state.suggestions,
            arrivalController: arrivalController,
            departureController: departureController,
            onDepartureSubmitted: (value) {
              onDepartureSubmitted(value);
              search();
            },
            onArrivalSubmitted: (value) {
              onArrivalSubmitted(value);
              search();
            },
            onSwapButtonTap: _onSwapButtonTap,
          ),
          InkWell(
            onTap: () => _selectDate(context),
            child: Container(
              padding: const EdgeInsets.all(AppDimensions.medium),
              margin: const EdgeInsets.only(
                top: AppDimensions.medium,
              ),
              color: context.theme.containerBackgroundColor,
              child: Text(
                state.tripDate == null
                    ? context.locale.date
                    : state.tripDate!.formatDME(context),
              ),
            ),
          ),
        ],
      ),
    );*/
  }
}
