// ignore_for_file: implementation_imports
// ignore_for_file: avoid_dynamic

import 'package:avtovas_web/src/features/passengers/utils/constants/dimensions.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';

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
        top: Dimensions.rootPaddingTop,
        left: context.availableWidth > Dimensions.minWebDesktopResolutionWidth
            ? Dimensions.rootPaddingLeft
            : Dimensions.mobileRootPaddingLeft,
      ),
      children: [
        Text(
          '${context.locale.main} /'
          ' ${context.locale.help} /'
          ' ${context.locale.directoryInfo}',
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: Dimensions.breadcrumbsPaddingBottom,
            bottom: Dimensions.itemsPaddingTop,
          ),
          child: Text(
            context.locale.passengersTitle,
            style: context.themeData.textTheme.titleLarge?.copyWith(
              fontSize: Dimensions.titleSize,
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
