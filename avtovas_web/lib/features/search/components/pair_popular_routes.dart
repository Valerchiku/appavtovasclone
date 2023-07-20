import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class PopularRouteWidget extends StatefulWidget {
  const PopularRouteWidget({super.key});

  @override
  State<PopularRouteWidget> createState() => _PopularRouteWidgetState();
}

class _PopularRouteWidgetState extends State<PopularRouteWidget> {

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
          width: 560,
          height: 215,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      bottom: 14
                  ),
                  child: Text(
                    'из Москвы',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18
                    )
                  )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                            'Москва',
                            style: TextStyle(
                                color: Color(0xFF006455)
                            )
                        ),
                        Container(
                            child: SvgPicture.asset(
                                "assets/images/direction.svg",
                                color: Color(0xFF006455)
                            ),
                            margin: EdgeInsets.symmetric(
                                horizontal: 10
                            )
                        ),
                        Text(
                            'Воронеж',
                            style: TextStyle(
                                color: Color(0xFF006455)
                            )
                        )
                      ]
                    ),
                    Text(
                        '1 050,00 руб',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16
                        )
                    )
                  ]
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                            'Москва',
                            style: TextStyle(
                                color: Color(0xFF006455)
                            )
                        ),
                        Container(
                            child: SvgPicture.asset(
                                "assets/images/direction.svg",
                                color: Color(0xFF006455)
                            ),
                            margin: EdgeInsets.symmetric(
                                horizontal: 10
                            )
                        ),
                        Text(
                            'Ростов-на-Дону',
                            style: TextStyle(
                                color: Color(0xFF006455)
                            )
                        )
                      ]
                    ),
                    Text(
                        '1 500,00 руб',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16
                        )
                    )
                  ]
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                            'Москва',
                            style: TextStyle(
                                color: Color(0xFF006455)
                            )
                        ),
                        Container(
                            child: SvgPicture.asset(
                                "assets/images/direction.svg",
                                color: Color(0xFF006455)
                            ),
                            margin: EdgeInsets.symmetric(
                                horizontal: 10
                            )
                        ),
                        Text(
                            'Минск',
                            style: TextStyle(
                                color: Color(0xFF006455)
                            )
                        )
                      ]
                    ),
                    Text(
                        '1 744,00 руб',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16
                        )
                    )
                  ]
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                            'Москва',
                            style: TextStyle(
                                color: Color(0xFF006455)
                            )
                        ),
                        Container(
                            child: SvgPicture.asset(
                                "assets/images/direction.svg",
                                color: Color(0xFF006455)
                            ),
                            margin: EdgeInsets.symmetric(
                                horizontal: 10
                            )
                        ),
                        Text(
                            'Чебоксары',
                            style: TextStyle(
                                color: Color(0xFF006455)
                            )
                        )
                      ]
                    ),
                    Text(
                        '1 090,00 руб',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16
                        )
                    )
                  ]
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                            'Москва',
                            style: TextStyle(
                                color: Color(0xFF006455)
                            )
                        ),
                        Container(
                            child: SvgPicture.asset(
                                "assets/images/direction.svg",
                                color: Color(0xFF006455)
                            ),
                            margin: EdgeInsets.symmetric(
                                horizontal: 10
                            )
                        ),
                        Text(
                            'Пенза',
                            style: TextStyle(
                                color: Color(0xFF006455)
                            )
                        )
                      ]
                    ),
                    Text(
                        '1 400,00 руб',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16
                        )
                    )
                  ]
                )
              ]
          ),
          padding: EdgeInsets.all(15)
        ),
        margin: EdgeInsets.only(
            right: MediaQuery.of(context).size.width >= 600 ?
              40
            :
              0,
            bottom: 14
        )
    );
  }
}