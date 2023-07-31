import 'package:avtovas_web/src/features/passengers/utils/constants/dimensions.dart';
import 'package:avtovas_web/src/features/passengers/widgets/passengers_item.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:flutter/cupertino.dart';

class PassengersPageBody extends StatelessWidget {
  const PassengersPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(
        top: Dimensions.rootPaddingTop,
        left:
          context.availableWidth
            >
              Dimensions.minWebDesktopResolutionWidth
                ?
                  Dimensions.rootPaddingLeft
                :
                  Dimensions.mobileRootPaddingLeft,
      ),
      children: [
        Text('${context.locale.main} / ${context.locale.help} / ${context.locale.directoryInfo}'),
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
        ...List.generate(5, (index) => PassengersItem(
          name: 'asd',
          age: 'asd',
          gender: 'asd',
          onSelected: () {},
        ),),
      ],
    );
  }
}
