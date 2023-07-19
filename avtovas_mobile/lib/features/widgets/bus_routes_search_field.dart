import 'package:avtovas_mobile/features/widgets/to_trip_selector.dart';
import 'package:flutter/material.dart';
import 'from_trip_selector.dart';

class BusRoutesSearchField extends StatelessWidget {

  List<String> routes = [
    'Алатырь',
    'Ардатов'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: 39
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: FromTripSelectorWidget(
              routes: routes
            )
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: ToTripSelectorWidget(routes: routes)
          ),
          Align(
              alignment: Alignment.centerRight,
              child: FloatingActionButton(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Color(0xFFDFDFDF),
                          width: 1
                      ),
                      borderRadius: BorderRadius.circular(100)
                  ),
                  onPressed: () {
                    // TODO
                  },
                  child: ImageIcon(
                      AssetImage(
                          'assets/images/toggle.png'
                      ),
                      color: Color(0xFF006455)
                  ),
                  backgroundColor: Colors.white
              )
          )
        ],
      ),
      height: 55 + 45
    );
  }
}
