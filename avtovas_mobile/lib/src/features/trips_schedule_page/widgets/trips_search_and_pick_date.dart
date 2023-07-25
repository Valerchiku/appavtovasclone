import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/src/widgets/search_trip/search_trip.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore_for_file: implementation_imports

class TripsSearchAndPickDate extends StatefulWidget {
  final TextEditingController arrivalController;
  final TextEditingController departureController;
  final List<String> cities;
  const TripsSearchAndPickDate({
    required this.arrivalController,
    required this.departureController,
    required this.cities,
    super.key,
  });

  @override
  State<TripsSearchAndPickDate> createState() => _TripsSearchAndPickDateState();
}

class _TripsSearchAndPickDateState extends State<TripsSearchAndPickDate> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.light(
              primary: context.theme.mainAppColor,
              onPrimary: context.theme.whitespaceContainerColor,
              onSurface: context.theme.secondaryTextColor,
            ),
          ),
          child: child!,
        );
      },
    );
    if (mounted && picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void swapDropdownValues() {
    final temp = widget.departureController.text;
    setState(() {
      widget.departureController.text = widget.arrivalController.text;
      widget.arrivalController.text = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.large),
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.theme.detailsBackgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppDimensions.medium,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchTrip(
            items: widget.cities,
            arrivalController: widget.arrivalController,
            departureController: widget.departureController,
            onChangedArrival: (value) => setState(
              () => value = widget.arrivalController.text,
            ),
            onChangedDeparture: (value) => setState(
              () => value = widget.departureController.text,
            ),
            onPressed: swapDropdownValues,
          ),
          InkWell(
            onTap: () => _selectDate(context),
            child: Container(
              padding: const EdgeInsets.all(AppDimensions.medium),
              margin: const EdgeInsets.only(
                // Использую .only потому что 
                //с symmetric снизу добавляюется не нужная высота
                top: AppDimensions.medium,
              ),
              color: context.theme.whitespaceContainerColor,
              child: Text(
                DateFormat('dd MMM , EEE').format(selectedDate),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
