import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecentTripWidget extends StatefulWidget {
  const RecentTripWidget({super.key});

  @override
  State<RecentTripWidget> createState() => _RecentTripWidgetState();
}

class _RecentTripWidgetState extends State<RecentTripWidget> {

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Color(0xB3FFFFFF),
        child: Container(
            child: Text('Алатырь -\nНовочебоксарск'),
            padding: EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 6
            )
        )
    );
  }
}
