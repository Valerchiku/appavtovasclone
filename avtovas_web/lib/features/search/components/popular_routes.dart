import 'package:flutter/material.dart';

import 'popular_route.dart';


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
            PairPopularRoutesWidget(),
            Container(
              child: PairPopularRoutesWidget(),
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