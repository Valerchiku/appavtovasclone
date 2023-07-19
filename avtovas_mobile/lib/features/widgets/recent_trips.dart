
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecentTripsWidget extends StatefulWidget {
  const RecentTripsWidget({super.key});

  @override
  State<RecentTripsWidget> createState() => _RecentTripsWidgetState();
}

class _RecentTripsWidgetState extends State<RecentTripsWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'Раннее искали',
                  style: TextStyle(
                      color: Colors.white
                  )
              ),
              ImageIcon(
                  AssetImage("assets/images/recent.png"),
                  color: Colors.white
              )
            ]
        ),
        margin: EdgeInsets.only(
            top: 42
        )
    );
  }
}
