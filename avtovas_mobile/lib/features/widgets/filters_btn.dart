import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DateFilterBtnWidget extends StatefulWidget {
  const DateFilterBtnWidget({super.key});

  @override
  State<DateFilterBtnWidget> createState() => _DateFilterBtnWidgetState();
}

class _DateFilterBtnWidgetState extends State<DateFilterBtnWidget> {

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            maximumSize: MaterialStateProperty.all<Size>(
                Size(110.0, 33.0)
            ),
            minimumSize: MaterialStateProperty.all<Size>(
                Size(105.0, 33.0)
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                )
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
                Color(0xFF006455)
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
                Colors.white
            )
        ),
        onPressed: () {
          // TODO
        },
        child: Container(
            child: Row(
                children: [
                  SvgPicture.asset('assets/images/date_picker.svg'),
                  Text('Дата')
                ]
            )
        )
    );
  }
}
