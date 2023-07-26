import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:common/src/utils/constants/images_assets.dart';
import 'package:avtovas_mobile/src/features/passengers/utils/constants/dimensions.dart';
import 'package:avtovas_mobile/src/features/passengers/utils/constants/colors.dart'
as HelpInfoColors;

class Item extends StatelessWidget {
  final String name;
  final String age;
  final String gender;
  final Function onSelected;

  const Item(
      {required this.name,
        required this.age,
        required this.gender,
        required this.onSelected,
        super.key});

  getAgeAndGender () {
    var result = '';
    int ageLen = age.length;
    int genderLen = gender.length;
    if (ageLen > 0 && genderLen > 0) {
      result = '${age}, ${gender}';
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
                  padding: EdgeInsets.only(
                      right: 13
                  ),
                  child: Image.asset(ImagesAssets.somePassengerPlate),
                ),
                Column(
                  children: [
                    Text(
                        name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                    ),
                    Text(
                      getAgeAndGender(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                )
              ],
            ),
            AvtovasVectorImage(svgAssetPath: ImagesAssets.chevron)
          ],
        ),
        Divider()
      ],
    );
  }
}