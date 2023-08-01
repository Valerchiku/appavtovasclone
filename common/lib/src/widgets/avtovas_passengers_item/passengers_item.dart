// ignore_for_file: implementation_imports,

import 'package:common/avtovas_common.dart';
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
                  padding: const EdgeInsets.only(
                    right: CommonDimensions.medium,
                  ),
                  width: CommonDimensions.passengerPlateSize,
                  height: CommonDimensions.passengerPlateSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.theme.passengerPlateBackground,
                  ),
                  child: const AvtovasVectorImage(
                    svgAssetPath: ImagesAssets.passenger,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: CommonFonts.sizeHeadlineMedium,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '$age, $gender',
                      style: const TextStyle(
                        fontSize: CommonFonts.sizeHeadlineMedium,
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
