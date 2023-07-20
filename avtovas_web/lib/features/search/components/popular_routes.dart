import 'package:flutter/material.dart';

import 'popular_route.dart';


class SearchPopularRoutesWidget extends StatefulWidget {
  const SearchPopularRoutesWidget({super.key});

  @override
  State<SearchPopularRoutesWidget> createState() => _SearchPopularRoutesWidgetState();
}

class _SearchPopularRoutesWidgetState extends State<SearchPopularRoutesWidget> {

  List<Map<String, dynamic>> routes = [
    {
      'title': 'из Москвы',
      'direction': 'from',
      'city': 'Москва',
      'trips': [
        {
          'city': 'Воронеж',
          'price': '1 050,00 руб'
        },
        {
          'city': 'Ростов-на-Дону',
          'price': '1 500,00 руб'
        },
        {
          'city': 'Минск',
          'price': '1 744,00 руб'
        },
        {
          'city': 'Чебоксары',
          'price': '1 090,00 руб'
        },
        {
          'city': 'Пенза',
          'price': '1 400,00 руб'
        }
      ]
    },
    {
      'title': 'из Санкт-Петербурга',
      'direction': 'from',
      'city': 'Санкт-Петербург',
      'trips': [
        {
          'city': 'Воронеж',
          'price': '1 400,00 руб'
        },
        {
          'city': 'Ростов-на-Дону',
          'price': '250,00 руб'
        },
        {
          'city': 'Минск',
          'price': '520,00 руб'
        },
        {
          'city': 'Чебоксары',
          'price': '1 450,00 руб'
        },
        {
          'city': 'Пенза',
          'price': '3 101,83 руб'
        }
      ]
    },
    {
      'title': 'в Москву',
      'direction': 'to',
      'city': 'Москва',
      'trips': [
        {
          'city': 'Нижний Новгород',
          'price': '1 050,00 руб'
        },
        {
          'city': 'Ростов-на-Дону',
          'price': '1 500,00 руб'
        },
        {
          'city': 'Воронеж',
          'price': '1 744,00 руб'
        },
        {
          'city': 'Минск',
          'price': '1 090,00 руб'
        },
        {
          'city': 'Пенза',
          'price': '1 400,00 руб'
        }
      ]
    },
    {
      'title': 'в Санкт-Петербург',
      'direction': 'to',
      'city': 'Санкт-Петербург',
      'trips': [
        {
          'city': 'Нижний Новгород',
          'price': '1 600,00 руб'
        },
        {
          'city': 'Ростов-на-Дону',
          'price': '500,00 руб'
        },
        {
          'city': 'Воронеж',
          'price': '250,00 руб'
        },
        {
          'city': 'Минск',
          'price': '670,00 руб'
        },
        {
          'city': 'Пенза',
          'price': '1 235,00 руб'
        }
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            PairPopularRoutesWidget(
                routes: routes,
                indices: [
                  0,
                  1
                ]
            ),
            Container(
              child: PairPopularRoutesWidget(
                  routes: routes,
                  indices: [
                    2,
                    3
                  ]
              ),
                margin: EdgeInsets.only(
                  top: 14
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