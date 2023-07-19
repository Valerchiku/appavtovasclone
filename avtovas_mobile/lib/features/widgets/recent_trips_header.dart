import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RecentTripsHeaderWidget extends StatefulWidget {
  const RecentTripsHeaderWidget({super.key});

  @override
  State<RecentTripsHeaderWidget> createState() => _RecentTripsHeaderWidgetState();
}

class _RecentTripsHeaderWidgetState extends State<RecentTripsHeaderWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'Раннее искали',
                      style: TextStyle(
                          color: Colors.white
                      )
                  ),
                  Container(
                    child: SvgPicture.asset('assets/images/recent.svg'),
                    margin: EdgeInsets.only(
                      left: 15
                    ),
                  )
                ]
            ),
            margin: EdgeInsets.only(
                top: 42
            )
        )
      ],
    );
  }
}
