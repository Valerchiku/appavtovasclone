import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/constants/app_fonts.dart';
import 'package:avtovas_web/src/features/reference-info/cubit/reference_info_cubit.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class ReferenceInfoPageBody extends StatelessWidget {
  final ReferenceInfoCubit referenceInfoCubit;
  const ReferenceInfoPageBody({
    required this.referenceInfoCubit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(
        AppDimensions.rootPadding,
      ),
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: AppDimensions.large,
          ),
          child: Text(
            '${context.locale.main} / ${context.locale.help} / ${context.locale.directoryInfo}',
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppDimensions.large,
          ),
          child: Row(
            children: [
              Icon(
                Icons.arrow_back,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: AppDimensions.large,
                ),
                child: Text(
                  context.locale.directoryInfo,
                  style: context.themeData.textTheme.titleLarge?.copyWith(
                    fontSize: AppFonts.extraLarge,
                    fontWeight: AppFonts.titleWeight,
                  ),
                ),
              ),
            ],
          ),
        ),
        PageOptionTile(
          title: context.locale.whatTripsAreThere,
          onTap: referenceInfoCubit.onWhatTripsAreThereButtonTap,
        ),
        PageOptionTile(
          title: context.locale.willThereBeATrip,
          onTap: referenceInfoCubit.onWillThereBeATripButtonTap,
        ),
        PageOptionTile(
          title: context.locale.howFarInAdvanceDoYouNeedToBuyATicket,
          onTap: referenceInfoCubit.onHowFarInAdvanceDoYouNeedToBuyATicketButtonTap,
        ),
        PageOptionTile(
          title: context.locale.howToCalculateTravelTimeAndArrivalTime,
          onTap: referenceInfoCubit.onHowToCalculateTravelTimeAndArrivalTimeButtonTap,
        ),
      ],
    );
  }
}

