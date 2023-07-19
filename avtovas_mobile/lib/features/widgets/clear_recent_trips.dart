import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatefulWidget {
  const TitleWidget({super.key});

  @override
  State<TitleWidget> createState() => _TitleWidgetState();
}

class _TitleWidgetState extends State<TitleWidget> {

  @override
  Widget build(BuildContext context) {
    return Text(
        'Билеты на автобусы\nЧувашии',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: 30
        )
    );
  }
}
