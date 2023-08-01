// ignore_for_file: implementation_imports,
import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/utils/mocks.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class PassengersScreenBody extends StatelessWidget {
  const PassengersScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.large,
      ),
      children: [
        for (final passenger in Mocks.passengers)
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
