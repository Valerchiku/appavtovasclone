import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/widgets/support_methods/support_methods.dart';
import 'package:avtovas_mobile/src/features/trips_schedule_page/cubit/trips_schedule_cubit.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class TripsSearchAndPickDate extends StatelessWidget {
  final TripsScheduleState state;
  final ValueChanged<DateTime> onTripDateChanged;
  final VoidCallback search;
  final TextEditingController arrivalController;
  final TextEditingController departureController;
  final ValueChanged<String> onDepartureSubmitted;
  final ValueChanged<String> onArrivalSubmitted;

  const TripsSearchAndPickDate({
    required this.state,
    required this.onTripDateChanged,
    required this.search,
    required this.arrivalController,
    required this.departureController,
    required this.onDepartureSubmitted,
    required this.onArrivalSubmitted,
    super.key,
  });

  Future<void> _selectDate(BuildContext context) async {
    final now = DateTime.now();

    final tripDate = await SupportMethods.showAvtovasDatePicker(
      context,
      showDatePicker(
        context: context,
        initialDate: state.tripDate!,
        firstDate: now,
        lastDate: now.copyWith(month: now.month + 6),
        builder: (context, child) {
          return Theme(
            data: context.themeData.copyWith(
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
    onDepartureSubmitted(departureController.text);
    onArrivalSubmitted(arrivalController.text);

    search();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
