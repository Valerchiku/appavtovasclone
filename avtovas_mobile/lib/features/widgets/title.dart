import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClearRecentTripsWidget extends StatefulWidget {
  const ClearRecentTripsWidget({super.key});

  @override
  State<ClearRecentTripsWidget> createState() => _TitleWidgetState();
}

class _TitleWidgetState extends State<ClearRecentTripsWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
            'Очистить историю поиска',
            style: TextStyle(
                color: Colors.white
            )
        ),
        margin: EdgeInsets.only(
            top: 16
        )
    );
  }
}
