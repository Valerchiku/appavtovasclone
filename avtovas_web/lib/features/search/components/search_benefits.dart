import 'package:flutter/material.dart';


class SearchBenefitsWidget extends StatefulWidget {
  const SearchBenefitsWidget({super.key});

  @override
  State<SearchBenefitsWidget> createState() => _SearchBenefitsWidgetState();
}

class _SearchBenefitsWidgetState extends State<SearchBenefitsWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: [
          Card(
            margin: EdgeInsets.only(
              right: 15,
              bottom: 15
            ),
            child: Container(
              width: 260,
              height: 175,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageIcon(
                    AssetImage("assets/images/time.png"),
                    color: Color(0xFF006455)
                  ),
                  Text(
                    'Без касс и очередей',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18
                    ),
                  ),
                  Text('Билеты онлайн в любое время\nна сайте и в приложении')
                ]
              ),
              padding: EdgeInsets.all(15),
            )
          ),
          Card(
            margin: EdgeInsets.only(
              right: 15,
              bottom: 15
            ),
            child: Container(
              width: 260,
              height: 175,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageIcon(
                    AssetImage("assets/images/routes.png"),
                    color: Color(0xFF006455)
                  ),
                  Text(
                    '50 000 направлений',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18
                    ),
                  ),
                  Text('Рейтинг рейсов перевозчиков\nпо отзывам пассажиров')
                ]
              ),
              padding: EdgeInsets.all(15)
            )
          ),
          Card(
            margin: EdgeInsets.only(
              right: 15,
              bottom: 15
            ),
            child: Container(
              width: 260,
              height: 175,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageIcon(
                    AssetImage("assets/images/card.png"),
                    color: Color(0xFF006455)
                  ),
                  Text(
                    'Безопасная оплата',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18
                    ),
                  ),
                  Text('Стандарты безопасности\nPCI DSS для защиты\nплатежных данных')
                ]
              ),
              padding: EdgeInsets.all(15),
            )
          ),
          Card(
            child: Container(
              width: 260,
              height: 175,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageIcon(
                    AssetImage("assets/images/safety.png"),
                    color: Color(0xFF006455)
                  ),
                  Text(
                    'Возврат билетов',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18
                    ),
                  ),
                  Text('Быстрое оформление возврата\nв личном кабинете')
                ]
              ),
              padding: EdgeInsets.all(15),
            )
          )
        ]
      ),
      margin: EdgeInsets.only(
        top: 25,
        bottom: 100
      )
    );
  }
}