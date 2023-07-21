import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:avtovas_web/features/search/utils/constants/dimensions.dart'
    as SearchDimensions;
import 'package:common/src/utils/constants/images_assets.dart';

class BenefitWidget extends StatefulWidget {
  final title;
  final subtitle;
  final icon;

  const BenefitWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.icon});

  @override
  State<BenefitWidget> createState() => _BenefitWidgetState();
}

class _BenefitWidgetState extends State<BenefitWidget> {
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
            AvtovasVectorImage(svgAssetPath: widget.icon),
            Text(
              widget.title,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: SearchDimensions.Dimensions.benefitTitleSize),
            ),
            Text(widget.subtitle)
          ]),
          padding: EdgeInsets.all(SearchDimensions.Dimensions.benefitPadding),
        ));
  }
}
