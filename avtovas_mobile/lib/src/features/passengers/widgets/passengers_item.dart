import 'package:common/avtovas_common.dart';
// ignore_for_file: implementation_imports,
import 'package:common/src/utils/constants/common_dimensions.dart';
// ignore_for_file: implementation_imports,
import 'package:common/src/utils/constants/images_assets.dart';
import 'package:flutter/material.dart';

class PassengersItem extends StatelessWidget {
  final String name;
  final String age;
  final String gender;
  final Function onSelected;

  const PassengersItem(
      {required this.name,
        required this.age,
        required this.gender,
        required this.onSelected,
        super.key,});

  String getAgeAndGender () {
    var result = '';
    final ageLen = age.length;
    final genderLen = gender.length;
    if (ageLen > 0 && genderLen > 0) {
      result = '$age, $gender';
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      right: CommonDimensions.passengerAvatarMarginRight,
                  ),
                  child: Image.asset(ImagesAssets.somePassengerPlate),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                    ),
                    Text(
                      getAgeAndGender(),
                      style: const TextStyle(
                        fontSize: 16,
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
