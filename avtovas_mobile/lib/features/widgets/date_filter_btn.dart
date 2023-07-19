import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FiltersBtnWidget extends StatefulWidget {
  const FiltersBtnWidget({super.key});

  @override
  State<FiltersBtnWidget> createState() => _FiltersBtnWidgetState();
}

class _FiltersBtnWidgetState extends State<FiltersBtnWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ElevatedButton(
            style: ButtonStyle(
                maximumSize: MaterialStateProperty.all<Size>(
                    Size(115.0, 33.0)
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
                    Colors.white
                ),
                foregroundColor: MaterialStateProperty.all<Color>(
                    Colors.black
                )
            ),
            onPressed: () {
              // TODO
            },
            child: Text('Фильтры')
        ),
        margin: EdgeInsets.only(
            left: 9
        )
    );
  }
}
