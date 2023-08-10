import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/widgets/support_methods/support_methods.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class TripsSearchAndPickDate extends StatelessWidget {
  final ValueChanged<DateTime> onTripDateChanged;
  final VoidCallback search;
  final TextEditingController arrivalController;
  final TextEditingController departureController;
  final ValueChanged<String> onDepartureSubmitted;
  final ValueChanged<String> onArrivalSubmitted;
  final List<String> suggestions;
  final DateTime? tripDate;

  const TripsSearchAndPickDate({
    required this.onTripDateChanged,
    required this.search,
    required this.arrivalController,
    required this.departureController,
    required this.onDepartureSubmitted,
    required this.onArrivalSubmitted,
    required this.suggestions,
    this.tripDate,
    super.key,
  });

  Future<void> _selectDate(BuildContext context) async {
    final now = DateTime.now();

    final tripDate = await SupportMethods.showAvtovasDatePicker(
      context,
      showDatePicker(
        context: context,
        initialDate: now,
        firstDate: now,
        lastDate: now.copyWith(month: now.month + 6),
        builder: (context, child) {
          return Theme(
            data: context.themeData.copyWith(
              colorScheme: ColorScheme.dark(
                primary: context.theme.containerBackgroundColor,
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
            items: suggestions,
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
            onSwapButtonTap: () {},
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
                tripDate == null
                    ? context.locale.date
                    : tripDate!.formatDME(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
