// ignore_for_file: implementation_imports
// ignore_for_file: avoid_dynamic

import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/constants/app_fonts.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class PassengersPageBody extends StatelessWidget {
  final List<MockPassenger> passengers;

  const PassengersPageBody({
    required this.passengers,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(
        top: AppDimensions.rootPaddingTop,
        left:
          context.availableWidth
          >
          AppDimensions.minWebDesktopResolutionWidth
            ? AppDimensions.rootPaddingLeft
            : AppDimensions.large,
      ),
      children: [
        Text(
          '${context.locale.main} /'
          ' ${context.locale.help} /'
          ' ${context.locale.directoryInfo}',
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: AppDimensions.medium,
            bottom: AppDimensions.large,
          ),
          child: Text(
            context.locale.passengersTitle,
            style: context.themeData.textTheme.titleLarge?.copyWith(
              fontSize: AppFonts.titleSize,
            ),
          ),
        ),
        for (final passenger in passengers)
          PassengersItem(
            name: passenger.fullName,
            age: '3',
            gender: 'a',
            onSelected: () {},
          ),
      ],
    );
  }
}
