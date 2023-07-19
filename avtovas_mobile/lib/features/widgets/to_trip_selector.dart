
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToTripSelectorWidget extends StatefulWidget {
  final routes;

  const ToTripSelectorWidget({super.key, required this.routes});

  @override
  State<ToTripSelectorWidget> createState() => _ToTripSelectorWidgetState();
}

class _ToTripSelectorWidgetState extends State<ToTripSelectorWidget> {

  String val = 'Ардатов';

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
            top: 10
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7),
            border: Border.all(
                width: 2,
                color: Color(0xFF2E74AF)
            )
        ),
        padding: EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 7
        ),
        child: DropdownButton<String>(
            value: val,
            icon: const Icon(
                Icons.arrow_drop_down
            ),
            isExpanded: true,
            underline: Container(
                height: 2,
                color: Colors.transparent
            ),
            onChanged: (String? newValue) {
              // TODO
            },
            items: widget.routes.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList()
        ),
        width: 335,
        height: 45
    );
  }
}
