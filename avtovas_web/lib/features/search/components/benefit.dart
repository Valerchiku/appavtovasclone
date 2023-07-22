import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:avtovas_web/features/search/utils/constants/dimensions.dart'
    as SearchDimensions;

class BenefitWidget extends StatelessWidget {
  final title;
  final subtitle;
  final icon;

  const BenefitWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(
            right: SearchDimensions.Dimensions.benefitMarginRight,
            bottom: SearchDimensions.Dimensions.benefitMarginBottom),
        child: Container(
          width: SearchDimensions.Dimensions.benefitWidth,
          height: SearchDimensions.Dimensions.benefitHeight,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            AvtovasVectorImage(svgAssetPath: icon),
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: SearchDimensions.Dimensions.benefitTitleSize),
            ),
            Text(subtitle)
          ]),
          padding: EdgeInsets.all(SearchDimensions.Dimensions.benefitPadding),
        ));
  }
}
