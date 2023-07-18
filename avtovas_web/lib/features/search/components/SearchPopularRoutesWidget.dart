import 'package:flutter/material.dart';


class SearchPopularRoutesWidget extends StatefulWidget {
  const SearchPopularRoutesWidget({super.key});

  @override
  State<SearchPopularRoutesWidget> createState() => _SearchPopularRoutesWidgetState();
}

class _SearchPopularRoutesWidgetState extends State<SearchPopularRoutesWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
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
                                  ),
                                ),
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
                                          child: ImageIcon(
                                              AssetImage("assets/images/direction.png"),
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
                                    ],
                                  ),
                                  Text(
                                      '1 050,00 руб',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16
                                      )
                                  )
                                ],
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
                                          child: ImageIcon(
                                              AssetImage("assets/images/direction.png"),
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
                                    ],
                                  ),
                                  Text(
                                      '1 500,00 руб',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16
                                      )
                                  )
                                ],
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
                                          child: ImageIcon(
                                              AssetImage("assets/images/direction.png"),
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
                                    ],
                                  ),
                                  Text(
                                      '1 744,00 руб',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16
                                      )
                                  )
                                ],
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
                                          child: ImageIcon(
                                              AssetImage("assets/images/direction.png"),
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
                                    ],
                                  ),
                                  Text(
                                      '1 090,00 руб',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16
                                      )
                                  )
                                ],
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
                                          child: ImageIcon(
                                              AssetImage("assets/images/direction.png"),
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
                                    ],
                                  ),
                                  Text(
                                      '1 400,00 руб',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16
                                      )
                                  )
                                ],
                              )
                            ]
                        ),
                        padding: EdgeInsets.all(15),
                      )
                  ),
                  Container(
                      child: Card(
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
                                      'из Санкт-Петербурга',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                              'Санкт-Петербург',
                                              style: TextStyle(
                                                  color: Color(0xFF006455)
                                              )
                                          ),
                                          Container(
                                              child: ImageIcon(
                                                  AssetImage("assets/images/direction.png"),
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
                                        ],
                                      ),
                                      Text(
                                          '1 400,00 руб',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16
                                          )
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                              'Санкт-Петербург',
                                              style: TextStyle(
                                                  color: Color(0xFF006455)
                                              )
                                          ),
                                          Container(
                                              child: ImageIcon(
                                                  AssetImage("assets/images/direction.png"),
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
                                        ],
                                      ),
                                      Text(
                                          '250,00 руб',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16
                                          )
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                              'Санкт-Петербург',
                                              style: TextStyle(
                                                  color: Color(0xFF006455)
                                              )
                                          ),
                                          Container(
                                              child: ImageIcon(
                                                  AssetImage("assets/images/direction.png"),
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
                                        ],
                                      ),
                                      Text(
                                          '520,00 руб',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16
                                          )
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                              'Санкт-Петербург',
                                              style: TextStyle(
                                                  color: Color(0xFF006455)
                                              )
                                          ),
                                          Container(
                                              child: ImageIcon(
                                                  AssetImage("assets/images/direction.png"),
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
                                        ],
                                      ),
                                      Text(
                                          '1 450,00 руб',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16
                                          )
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                              'Санкт-Петербург',
                                              style: TextStyle(
                                                  color: Color(0xFF006455)
                                              )
                                          ),
                                          Container(
                                              child: ImageIcon(
                                                  AssetImage("assets/images/direction.png"),
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
                                        ],
                                      ),
                                      Text(
                                          '3 101,83 руб',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16
                                          )
                                      )
                                    ],
                                  )
                                ]
                            ),
                            padding: EdgeInsets.all(15),
                          )
                      ),
                      margin: EdgeInsets.only(
                          left: 40
                      )
                  )
                ]
            ),
            Container(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
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
                                      'в Москву',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                              'Нижний Новгород',
                                              style: TextStyle(
                                                  color: Color(0xFF006455)
                                              )
                                          ),
                                          Container(
                                              child: ImageIcon(
                                                  AssetImage("assets/images/direction.png"),
                                                  color: Color(0xFF006455)
                                              ),
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10
                                              )
                                          ),
                                          Text(
                                              'Москва',
                                              style: TextStyle(
                                                  color: Color(0xFF006455)
                                              )
                                          )
                                        ],
                                      ),
                                      Text(
                                          '1 050,00 руб',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16
                                          )
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                              'Ростов-на-Дону',
                                              style: TextStyle(
                                                  color: Color(0xFF006455)
                                              )
                                          ),
                                          Container(
                                              child: ImageIcon(
                                                  AssetImage("assets/images/direction.png"),
                                                  color: Color(0xFF006455)
                                              ),
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10
                                              )
                                          ),
                                          Text(
                                              'Москва',
                                              style: TextStyle(
                                                  color: Color(0xFF006455)
                                              )
                                          )
                                        ],
                                      ),
                                      Text(
                                          '1 500,00 руб',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16
                                          )
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                              'Воронеж',
                                              style: TextStyle(
                                                  color: Color(0xFF006455)
                                              )
                                          ),
                                          Container(
                                              child: ImageIcon(
                                                  AssetImage("assets/images/direction.png"),
                                                  color: Color(0xFF006455)
                                              ),
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10
                                              )
                                          ),
                                          Text(
                                              'Москва',
                                              style: TextStyle(
                                                  color: Color(0xFF006455)
                                              )
                                          )
                                        ],
                                      ),
                                      Text(
                                          '1 744,00 руб',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16
                                          )
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                              'Минск',
                                              style: TextStyle(
                                                  color: Color(0xFF006455)
                                              )
                                          ),
                                          Container(
                                              child: ImageIcon(
                                                  AssetImage("assets/images/direction.png"),
                                                  color: Color(0xFF006455)
                                              ),
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10
                                              )
                                          ),
                                          Text(
                                              'Москва',
                                              style: TextStyle(
                                                  color: Color(0xFF006455)
                                              )
                                          )
                                        ],
                                      ),
                                      Text(
                                          '1 090,00 руб',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16
                                          )
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                              'Пенза',
                                              style: TextStyle(
                                                  color: Color(0xFF006455)
                                              )
                                          ),
                                          Container(
                                              child: ImageIcon(
                                                  AssetImage("assets/images/direction.png"),
                                                  color: Color(0xFF006455)
                                              ),
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10
                                              )
                                          ),
                                          Text(
                                              'Москва',
                                              style: TextStyle(
                                                  color: Color(0xFF006455)
                                              )
                                          )
                                        ],
                                      ),
                                      Text(
                                          '1 400,00 руб',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16
                                          )
                                      )
                                    ],
                                  )
                                ]
                            ),
                            padding: EdgeInsets.all(15),
                          )
                      ),
                      Container(
                          child: Card(
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
                                          'в Санкт-Петербург',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                  'Нижний Новгород',
                                                  style: TextStyle(
                                                      color: Color(0xFF006455)
                                                  )
                                              ),
                                              Container(
                                                  child: ImageIcon(
                                                      AssetImage("assets/images/direction.png"),
                                                      color: Color(0xFF006455)
                                                  ),
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 10
                                                  )
                                              ),
                                              Text(
                                                  'Санкт-Петербург',
                                                  style: TextStyle(
                                                      color: Color(0xFF006455)
                                                  )
                                              )
                                            ],
                                          ),
                                          Text(
                                              '1 600,00 руб',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16
                                              )
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                  'Ростов-на-Дону',
                                                  style: TextStyle(
                                                      color: Color(0xFF006455)
                                                  )
                                              ),
                                              Container(
                                                  child: ImageIcon(
                                                      AssetImage("assets/images/direction.png"),
                                                      color: Color(0xFF006455)
                                                  ),
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 10
                                                  )
                                              ),
                                              Text(
                                                  'Санкт-Петербург',
                                                  style: TextStyle(
                                                      color: Color(0xFF006455)
                                                  )
                                              )
                                            ],
                                          ),
                                          Text(
                                              '500,00 руб',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16
                                              )
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                  'Воронеж',
                                                  style: TextStyle(
                                                      color: Color(0xFF006455)
                                                  )
                                              ),
                                              Container(
                                                  child: ImageIcon(
                                                      AssetImage("assets/images/direction.png"),
                                                      color: Color(0xFF006455)
                                                  ),
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 10
                                                  )
                                              ),
                                              Text(
                                                  'Санкт-Петербург',
                                                  style: TextStyle(
                                                      color: Color(0xFF006455)
                                                  )
                                              )
                                            ],
                                          ),
                                          Text(
                                              '250,00 руб',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16
                                              )
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                  'Минск',
                                                  style: TextStyle(
                                                      color: Color(0xFF006455)
                                                  )
                                              ),
                                              Container(
                                                  child: ImageIcon(
                                                      AssetImage("assets/images/direction.png"),
                                                      color: Color(0xFF006455)
                                                  ),
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 10
                                                  )
                                              ),
                                              Text(
                                                  'Санкт-Петербург',
                                                  style: TextStyle(
                                                      color: Color(0xFF006455)
                                                  )
                                              )
                                            ],
                                          ),
                                          Text(
                                              '670,00 руб',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16
                                              )
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                  'Пенза',
                                                  style: TextStyle(
                                                      color: Color(0xFF006455)
                                                  )
                                              ),
                                              Container(
                                                  child: ImageIcon(
                                                      AssetImage("assets/images/direction.png"),
                                                      color: Color(0xFF006455)
                                                  ),
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 10
                                                  )
                                              ),
                                              Text(
                                                  'Санкт-Петербург',
                                                  style: TextStyle(
                                                      color: Color(0xFF006455)
                                                  )
                                              )
                                            ],
                                          ),
                                          Text(
                                              '1 235,89 руб',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16
                                              )
                                          )
                                        ],
                                      )
                                    ]
                                ),
                                padding: EdgeInsets.all(15),
                              )
                          ),
                          margin: EdgeInsets.only(
                              left: 40
                          )
                      )
                    ]
                ),
                margin: EdgeInsets.only(
                    top: 25
                )
            )
          ],
        ),
        margin: EdgeInsets.only(
            top: 25,
            bottom: 100
        )
    );
  }
}