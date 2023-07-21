import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:common/src/utils/constants/images_assets.dart';
import 'package:avtovas_web/features/search/utils/constants/colors.dart'
    as SearchColors;
import 'package:avtovas_web/features/search/utils/constants/dimensions.dart'
    as SearchDimensions;

class SearchTicketsWidget extends StatefulWidget {
  final Function()? findTicket;

  const SearchTicketsWidget({super.key, required this.findTicket});

  @override
  State<SearchTicketsWidget> createState() => _SearchTicketsWidgetState();
}

class _SearchTicketsWidgetState extends State<SearchTicketsWidget> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(
            minWidth: SearchDimensions.Dimensions.max,
            minHeight: SearchDimensions.Dimensions.minBlockHeight),
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImagesAssets.background),
                    fit: BoxFit.cover)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      child: Text(context.locale.web_title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: SearchColors.Colors.titleForeground,
                              fontSize:
                                  SearchDimensions.Dimensions.titleSize))),
                  Container(
                      padding: EdgeInsets.only(
                          bottom: SearchDimensions.Dimensions.blockMarginBottom,
                          top: SearchDimensions.Dimensions.blockMarginTop,
                          left: SearchDimensions.Dimensions.blockMarginLeft),
                      width: SearchDimensions.Dimensions.blockWidth,
                      decoration: BoxDecoration(
                          color: SearchColors.Colors.blockBackground,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(children: [
                        Row(children: [
                          Text(
                            context.locale.today,
                            style: TextStyle(
                                color: SearchColors.Colors.todayForeground,
                                decoration: TextDecoration.underline,
                                decorationStyle: TextDecorationStyle.solid),
                          ),
                          Container(
                              child: Text(context.locale.tomorrow),
                              margin: EdgeInsets.only(
                                  left: SearchDimensions
                                      .Dimensions.tomorrowMarginLeft)),
                          Container(
                              child: Text(context.locale.all_days),
                              margin: EdgeInsets.only(
                                  left: SearchDimensions
                                      .Dimensions.allDaysMarginLeft))
                        ]),
                        Wrap(children: [
                          Container(
                              width: SearchDimensions.Dimensions.fromFieldWidth,
                              height:
                                  SearchDimensions.Dimensions.blockBtnHeight,
                              decoration: BoxDecoration(
                                  color: SearchColors.Colors.blockBtnBackground,
                                  borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.only(
                                left: 15,
                                top: 12,
                                bottom: 15,
                              ),
                              margin: EdgeInsets.only(
                                top: 4,
                                bottom: 4,
                              ),
                              child: Text(context.locale.from)),
                          Container(
                              child: Column(
                                children: [
                                  AvtovasVectorImage(
                                      svgAssetPath: ImagesAssets.toggleBtn)
                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),
                              height:
                                  SearchDimensions.Dimensions.blockBtnHeight),
                          Container(
                              width: SearchDimensions.Dimensions.toFieldWidth,
                              height:
                                  SearchDimensions.Dimensions.blockBtnHeight,
                              decoration: BoxDecoration(
                                  color: SearchColors.Colors.blockBtnBackground,
                                  borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.only(
                                left: 15,
                                top: 12,
                                bottom: 15,
                              ),
                              margin: EdgeInsets.only(right: 15),
                              child: Text(context.locale.to)),
                          GestureDetector(
                              child: Container(
                                  width:
                                      SearchDimensions.Dimensions.pickerWidth,
                                  height: SearchDimensions
                                      .Dimensions.blockBtnHeight,
                                  decoration: BoxDecoration(
                                      color: SearchColors
                                          .Colors.blockBtnBackground,
                                      borderRadius: BorderRadius.circular(
                                          SearchDimensions
                                              .Dimensions.pickerRadius)),
                                  padding: EdgeInsets.only(
                                      left: SearchDimensions
                                          .Dimensions.pickerPaddingLeft,
                                      right: SearchDimensions
                                          .Dimensions.pickerPaddingRight),
                                  margin: EdgeInsets.only(
                                      right: SearchDimensions
                                          .Dimensions.pickerMarginRight),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('26.04.2023'),
                                        AvtovasVectorImage(
                                            svgAssetPath:
                                                ImagesAssets.datePickerIcon)
                                      ])),
                              onTap: () {
                                AvtovasDatepickerUtils.showAutovasDatePicker(
                                    context: context);
                              }),
                          Container(
                              height:
                                  SearchDimensions.Dimensions.blockBtnHeight,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      maximumSize: MaterialStateProperty.all<Size>(Size(
                                          SearchDimensions
                                              .Dimensions.findTicketWidth,
                                          SearchDimensions
                                              .Dimensions.blockBtnHeight)),
                                      minimumSize: MaterialStateProperty.all<Size>(Size(
                                          SearchDimensions
                                              .Dimensions.findTicketWidth,
                                          SearchDimensions
                                              .Dimensions.blockBtnHeight)),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            SearchDimensions
                                                .Dimensions.findTitcketRadius),
                                      )),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(SearchColors
                                              .Colors.findTicketBackground),
                                      foregroundColor: MaterialStateProperty.all<Color>(
                                          SearchColors.Colors.findTicketForeground)),
                                  onPressed: widget.findTicket,
                                  child: Text(context.locale.find_ticket, style: TextStyle(fontSize: SearchDimensions.Dimensions.findTicketSize))))
                        ])
                      ]))
                ])));
  }
}
