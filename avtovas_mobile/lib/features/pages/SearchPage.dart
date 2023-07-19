import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/bus_routes_search_field.dart';
import '../widgets/filters.dart';
import '../widgets/from_trip_selector.dart';
import '../widgets/recent_trips.dart';
import '../widgets/to_trip_selector.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 29,
              vertical: 57,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage('./assets/images/background.png')
              )
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 270.25,
                    height: 138.38
                  ),
                  Container(
                      child: Column(
                        children: [
                          Text(
                            'Билеты на автобусы\nЧувашии',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30
                            )
                          ),
                          BusRoutesSearchField(),
                          FiltersWidget(),
                          RecentTripsWidget()
                        ]
                      )
                  )
                ]
            )
        )
    );
  }
}
