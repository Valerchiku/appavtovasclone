import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:avtovas_web/features/search/utils/constants/dimensions.dart'
    as SearchDimensions;
import 'package:common/src/utils/constants/images_assets.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';

class PopularRouteWidget extends StatefulWidget {
  final routes;
  final index;

  const PopularRouteWidget(
      {super.key,
      required List<Map<String, dynamic>> this.routes,
      required int this.index});

  @override
  State<PopularRouteWidget> createState() => _PopularRouteWidgetState();
}

class _PopularRouteWidgetState extends State<PopularRouteWidget> {
  getPrice(index) {
    final route = widget.routes[widget.index];
    final trips = route['trips'];
    final Map trip = trips[index];
    final price = trip['price'];
    return price;
  }

  getTripsSize() {
    Map<String, dynamic> route = widget.routes[widget.index];
    List<Map<String, dynamic>> trips = route['trips'];
    return trips.length;
  }

  getCity(int index, String pos) {
    Map<String, dynamic> route = widget.routes[widget.index];
    String dir = route['direction'];
    bool isToDir = dir == 'to';
    List<Map<String, dynamic>> trips = route['trips'];
    Map<String, dynamic> trip = trips[index] as Map<String, dynamic>;
    String city = route['city'];
    bool isFromDir = !isToDir;
    bool isStartPos = pos == 'start';
    bool isEndPos = pos == 'end';
    bool isIn = isToDir && isStartPos;
    bool isOut = isFromDir && isEndPos;
    bool isSwitchTrip = isIn || isOut;
    if (isSwitchTrip) {
      city = trip['city'];
    }
    return city;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
          width: SearchDimensions.Dimensions.popularTripWidth,
          height: SearchDimensions.Dimensions.popularTripHeight,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                margin: EdgeInsets.only(
                    bottom: SearchDimensions
                        .Dimensions.popularTripTitleMarginBottom),
                child: Text('${widget.routes[widget.index]['title']}',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize:
                            SearchDimensions.Dimensions.popularTripTitleSize))),
            Column(
                children: List.generate(getTripsSize(), (index) {
              return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      Text(getCity(index, 'start'),
                          style: TextStyle(color: Color(0xFF006455))),
                      Container(
                          child: AvtovasVectorImage(
                              svgAssetPath: ImagesAssets.dirIcon),
                          margin: EdgeInsets.symmetric(
                              horizontal: SearchDimensions
                                  .Dimensions.popularTripIconMarginHorizontal)),
                      Text(getCity(index, 'end'),
                          style: TextStyle(color: Color(0xFF006455)))
                    ]),
                    Text(getPrice(index),
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: SearchDimensions
                                .Dimensions.popularTripPriceSize))
                  ]);
            }))
          ]),
          padding: EdgeInsets.only(
              left: SearchDimensions.Dimensions.popularTripPaddingLeft,
              top: SearchDimensions.Dimensions.popularTripPaddingTop),
        ),
        margin: EdgeInsets.only(
            right: context.availableWidth >=
                    SearchDimensions.Dimensions.minWebDesktopWidth
                ? SearchDimensions.Dimensions.popularTripMarginRight
                : SearchDimensions.Dimensions.popularTripMobileMarginRight,
            bottom: SearchDimensions.Dimensions.popularTripMobileMarginBottom));
  }
}
