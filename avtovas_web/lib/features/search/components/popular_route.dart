import 'package:avtovas_web/features/search/components/pair_popular_routes.dart';
import 'package:flutter/material.dart';


class PairPopularRoutesWidget extends StatefulWidget {
  const PairPopularRoutesWidget({super.key});

  @override
  State<PairPopularRoutesWidget> createState() => _PairPopularRoutesWidgetState();
}

class _PairPopularRoutesWidgetState extends State<PairPopularRoutesWidget> {

  @override
  Widget build(BuildContext context) {
    return Wrap(
        children: [
          PopularRouteWidget(),
          PopularRouteWidget()
        ]
    );
  }
}