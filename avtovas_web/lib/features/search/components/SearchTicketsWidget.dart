import 'package:flutter/material.dart';


class SearchTicketsWidget extends StatefulWidget {
  const SearchTicketsWidget({super.key});

  @override
  State<SearchTicketsWidget> createState() => _SearchTicketsWidgetState();
}

class _SearchTicketsWidgetState extends State<SearchTicketsWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 345,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    '../assets/images/background.png'
                ),
                fit: BoxFit.fitWidth
            )
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  child: Text(
                      'Билеты на автобусы Чувашии',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30
                      )
                  )
              ),
              Container(
                padding: EdgeInsets.only(
                    bottom: 15,
                    top: 8,
                    left: 16
                ),
                width: 838,
                height: 92,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  children: [
                    Row(
                        children: [
                          Text(
                            'Сегодня',
                            style: TextStyle(
                                color: Color(0xFF006455),
                                decoration: TextDecoration.underline,
                                decorationStyle: TextDecorationStyle.solid
                            ),
                          ),
                          Container(
                              child: Text(
                                  'Завтра'
                              ),
                              margin: EdgeInsets.only(
                                  left: 10
                              )
                          ),
                          Container(
                              child: Text(
                                  'На все дни'
                              ),
                              margin: EdgeInsets.only(
                                  left: 10
                              )
                          )
                        ]
                    ),
                    Row(
                        children: [
                          Container(
                              width: 150,
                              height: 45,
                              decoration: BoxDecoration(
                                  color: Color(0xFFF5F5F5),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              padding: EdgeInsets.only(
                                left: 15,
                                top: 12,
                                bottom: 15,
                              ),
                              margin: EdgeInsets.only(
                                top: 4,
                              ),
                              child: Text(
                                  'Откуда'
                              )
                          ),
                          ImageIcon(
                              AssetImage("assets/images/toggle.png"),
                              color: Color(0xFF006455)
                          ),
                          Container(
                              width: 150,
                              height: 45,
                              decoration: BoxDecoration(
                                  color: Color(0xFFF5F5F5),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              padding: EdgeInsets.only(
                                left: 15,
                                top: 12,
                                bottom: 15,
                              ),
                              margin: EdgeInsets.only(
                                top: 4,
                              ),
                              child: Text(
                                  'Куда'
                              )
                          ),
                          Container(
                              width: 156,
                              height: 45,
                              decoration: BoxDecoration(
                                  color: Color(0xFFF5F5F5),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15
                              ),
                              margin: EdgeInsets.only(
                                  top: 4,
                                  left: 15
                              ),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('26.04.2023'),
                                    ImageIcon(
                                        AssetImage("assets/images/date_picker.png"),
                                        color: Color(0xFF006455)
                                    )
                                  ]
                              )
                          ),
                          Container(
                              width: 156 - 15,
                              height: 45,
                              decoration: BoxDecoration(
                                  color: Color(0xFFF5F5F5),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15
                              ),
                              margin: EdgeInsets.only(
                                  top: 4,
                                  left: 15,
                                  right: 15
                              ),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('1 взрослый'),
                                    ImageIcon(
                                        AssetImage("assets/images/passenger.png"),
                                        color: Color(0xFF006455)
                                    )
                                  ]
                              )
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                  maximumSize: MaterialStateProperty.all<Size>(
                                      Size(145.0, 45.0)
                                  ),
                                  minimumSize: MaterialStateProperty.all<Size>(
                                      Size(145.0, 45.0)
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
                              child: Text(
                                'Найти билет',
                                style: TextStyle(
                                    fontSize: 16
                                ),
                              )
                          )
                        ]
                    )
                  ],
                ),
              )
            ]
        )
    );
  }
}