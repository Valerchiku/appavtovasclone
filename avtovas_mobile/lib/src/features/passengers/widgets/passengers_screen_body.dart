import 'package:avtovas_mobile/src/features/passengers/widgets/item.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PassengersScreenBody extends StatelessWidget {
  const PassengersScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: CommonDimensions.passengerListPaddingHorizontal
      ),
      child: SingleChildScrollView(
        child: Column(
            children: List.generate(15, (index) => Item(
                name: 'w', age: '3', gender: 'a', onSelected: () {}
            ))
        ),
      ),
    );
  }
}
