import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/widgets/support_methods/support_methods.dart';
import 'package:avtovas_mobile/src/features/main/widgets/my_trips_widgets/my_trip_status/my_expired_trip.dart';
import 'package:common/avtovas_common.dart';
import 'package:core/avtovas_core.dart';
import 'package:flutter/material.dart';

class ArchiveTrips extends StatelessWidget {
  final ValueSetter<String> onRemoveButtonTap;
  final VoidCallback clearArchive;
  final List<StatusedTrip>? trips;

  const ArchiveTrips({
    required this.onRemoveButtonTap,
    required this.clearArchive,
    required this.trips,
    super.key,
  });

  Future<void> _showConfirmationDialog(
    BuildContext context,
    VoidCallback clearArchive,
  ) {
    return SupportMethods.showAvtovasDialog(
      context: context,
      builder: (_) {
        return AvtovasAlertDialog(
          title: 'Очистить архив?',
          okayCallback: clearArchive,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (trips == null || trips!.isEmpty) {
      return Center(
        child: Text(
          context.locale.noCompletedTrips,
          style: context.themeData.textTheme.displayMedium?.copyWith(
            color: context.theme.fivefoldTextColor,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }
    return Stack(
      children: [
        ListView.separated(
          padding: const EdgeInsets.only(
            left: AppDimensions.large,
            right: AppDimensions.large,
            top: AppDimensions.large,
            bottom: AppDimensions.size2X * 2,
          ),
          separatorBuilder: (context, index) {
            return const SizedBox(height: AppDimensions.large);
          },
          itemBuilder: (_, index) => MyExpiredTrip(
            onRemoveButtonTap: onRemoveButtonTap,
            trip: trips![index],
          ),
          itemCount: trips!.length,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AvtovasButton.icon(
                padding: const EdgeInsets.symmetric(
                  vertical: AppDimensions.mediumLarge,
                ),
                buttonColor: context.theme.whiteTextColor,
                backgroundOpacity: 1,
                borderColor: context.theme.mainAppColor,
                margin: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.large,
                ),
                mainAxisAlignment: MainAxisAlignment.center,
                buttonText: 'Очистить архив',
                textStyle: context.themeData.textTheme.bodyLarge,
                svgPath: AppAssets.deleteIcon,
                onTap: () => _showConfirmationDialog(context, clearArchive),
              ),
              const SizedBox(height: AppDimensions.large),
            ],
          ),
        ),
      ],
    );
  }
}
