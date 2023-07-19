import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/search_benefits.dart';
import '../components/popular_routes.dart';
import '../components/tickets.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: null
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
                child: Column(
                    children: [
                      SearchTicketsWidget(),
                      Container(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width >= 600 ?
                              120
                            :
                              0
                          ),
                          margin: EdgeInsets.only(
                              top: 50
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'Почему стоит выбрать АвтоВАС?',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 30,
                                        color: Color(0xFF202020)
                                    )
                                ),
                                SearchBenefitsWidget(),
                                Text(
                                    'Популярные направления',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 30,
                                        color: Color(0xFF202020)
                                    )
                                ),
                                SearchPopularRoutesWidget()
                              ]
                          )
                      )
                    ]
                )
            )
        )
    );
  }
}