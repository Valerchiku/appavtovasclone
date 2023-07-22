import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:avtovas_web/features/search/components/search_benefits.dart';
import 'package:avtovas_web/features/search/components/popular_routes.dart';
import 'package:avtovas_web/features/search/components/tickets.dart';
import 'package:avtovas_web/features/search/utils/constants/dimensions.dart'
    as SearchDimensions;
import 'package:avtovas_web/features/search/utils/constants/colors.dart'
    as SearchColors;
import 'package:common/src/utils/constants/common_dimensions.dart';

class SearchPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: SearchDimensions.Dimensions.max,
        height: SearchDimensions.Dimensions.max,
        child: SingleChildScrollView(
            child: Column(children: [
          SearchTicketsWidget(
            findTicket: () {
              // TODO
            },
          ),
          Container(
              padding: EdgeInsets.only(
                  left: context.availableWidth >=
                          SearchDimensions.Dimensions.minWebDesktopWidth
                      ? SearchDimensions.Dimensions.webMainContentMarginLeft
                      : SearchDimensions
                          .Dimensions.mobileMainContentMarginLeft),
              margin: EdgeInsets.only(
                  top:
                      SearchDimensions.Dimensions.mobileBenefitsTitleMarginTop),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.locale.benefits,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize:
                                SearchDimensions.Dimensions.benefitsTitleSize,
                            color:
                                SearchColors.Colors.benefitsTitleForeground)),
                    SearchBenefitsWidget(),
                    Text(context.locale.popular_trips,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: SearchDimensions
                                .Dimensions.popularTripsTitleSize,
                            color: SearchColors
                                .Colors.popularTripsTitleForeground)),
                    SearchPopularRoutesWidget()
                  ]))
        ])));
  }
}
