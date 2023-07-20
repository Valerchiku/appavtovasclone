import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class PopularRouteWidget extends StatefulWidget {
  final routes;
  final index;

  const PopularRouteWidget({super.key, required List<Map<String, dynamic>> this.routes, required int this.index});

  @override
  State<PopularRouteWidget> createState() => _PopularRouteWidgetState();
}

class _PopularRouteWidgetState extends State<PopularRouteWidget> {

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
          width: 560,
          height: 215,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      bottom: 14
                  ),
                  child: Text(
                    '${widget.routes[widget.index]['title']}',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18
                    )
                  )
                ),
                Column(
                  children: List.generate(getTripsSize(), (index) {
                    return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                              children: [
                                Text(
                                    getCity(index, 'start'),
                                    style: TextStyle(
                                        color: Color(0xFF006455)
                                    )
                                ),
                                Container(
                                    child: SvgPicture.asset(
                                        "assets/images/direction.svg",
                                        color: Color(0xFF006455)
                                    ),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 10
                                    )
                                ),
                                Text(
                                    getCity(index, 'end'),
                                    style: TextStyle(
                                        color: Color(0xFF006455)
                                    )
                                )
                              ]
                          ),
                          Text(
                              '${widget.routes[widget.index]['trips'][index]['price']}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16
                              )
                          )
                        ]
                    );
                  })
                )
              ]
          ),
          padding: EdgeInsets.all(15)
        ),
        margin: EdgeInsets.only(
            right: MediaQuery.of(context).size.width >= 600 ?
              40
            :
              0,
            bottom: 14
        )
    );
  }
}