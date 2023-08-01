import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:common/avtovas_common.dart';

// ignore_for_file: implementation_imports,
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/constants/images_assets.dart';
import 'package:flutter/material.dart';

class PassengersItem extends StatelessWidget {
  final String name;
  final String age;
  final String gender;
  final Function onSelected;

  const PassengersItem({
    required this.name,
    required this.age,
    required this.gender,
    required this.onSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    right: AppDimensions.medium,
                  ),
                  width: AppDimensions.passengerPlateSize,
                  height: AppDimensions.passengerPlateSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.theme.passengerPlateBackground,
                  ),
                  child: AvtovasVectorImage(
                    svgAssetPath: ImagesAssets.passenger,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: AppFonts.sizeHeadlineMedium,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '$age, $gender',
                      style: const TextStyle(
                        fontSize: AppFonts.sizeHeadlineMedium,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                )
              ],
            ),
            const AvtovasVectorImage(svgAssetPath: ImagesAssets.chevron)
          ],
        ),
        const Divider()
      ],
    );
  }
}
