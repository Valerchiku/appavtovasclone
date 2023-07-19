import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/bus_routes_search_field.dart';
import '../widgets/clear_recent_trips.dart';
import '../widgets/filters.dart';
import '../widgets/recent_trips.dart';
import '../widgets/recent_trips_header.dart';
import '../widgets/title.dart';

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
            SvgPicture.asset(
              'assets/images/logo.svg',
              width: 270.25,
              height: 138.38
            ),
            Container(
              child: Column(
                children: [
                  TitleWidget(),
                  BusRoutesSearchField(),
                  FiltersWidget(),
                  RecentTripsHeaderWidget(),
                  RecentTripsWidget(),
                  ClearRecentTripsWidget()
                ]
              )
            )
          ]
        )
      )
    );
  }
}
