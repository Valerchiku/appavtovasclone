import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/features/main/cubit/my_trips_cubit/my_trips_cubit.dart';
import 'package:avtovas_mobile/src/features/main/utils/dialog_statuses.dart';
import 'package:avtovas_mobile/src/features/main/widgets/my_trips_widgets/my_trip_status/my_expired_trip.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class ArchiveTrips extends StatelessWidget {
  final MockTrip mockTrip;
  final MockBooking mockBooking;
  final List<String> trips;
  final MyTripsCubit myTripsCubit;
  final Widget dialog;

  const ArchiveTrips({
    required this.mockTrip,
    required this.mockBooking,
    required this.trips,
    required this.myTripsCubit,
    required this.dialog,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (trips.isEmpty) {
      return Text(
        context.locale.noCompletedTrips,
        style: context.themeData.textTheme.displayMedium?.copyWith(
          color: context.theme.fivefoldTextColor,
        ),
        textAlign: TextAlign.center,
      );
    } else if (trips.isNotEmpty) {
      return Stack(
        children: [
          ListView.separated(
            padding: const EdgeInsets.all(AppDimensions.large),
            separatorBuilder: (context, index) =>
                const SizedBox(height: AppDimensions.large),
            itemBuilder: (context, index) => MyExpiredTrip(
              orderNumber: mockBooking.orderNumber,
              mockTrip: mockTrip,
              myTripsCubit: myTripsCubit,
            ),
            itemCount: trips.length,
          ),
          switch (myTripsCubit.state.dialogStatus) {
            DialogStatuses.expanded => Container(
                width: context.availableWidth,
                height: context.availableHeight -
                    (kToolbarHeight + AppDimensions.navigationPanelHeight),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.7),
                ),
                child: dialog),
            DialogStatuses.collapsed => const SizedBox.shrink(),
          }
        ],
      );
    }
    return Center(
      child: Text(
        context.locale.somethingWentWrong,
        style: context.themeData.textTheme.displayMedium?.copyWith(
          color: context.theme.fivefoldTextColor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
