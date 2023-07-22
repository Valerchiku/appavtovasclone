import 'package:avtovas_web/features/search/components/pair_popular_routes.dart';
import 'package:flutter/material.dart';

class PairPopularRoutesWidget extends StatelessWidget {
  final List<Map<String, dynamic>> routes;
  final List<int> indices;

  const PairPopularRoutesWidget(
      {super.key,
      required List<Map<String, dynamic>> this.routes,
      required List<int> this.indices});

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      PopularRouteWidget(routes: routes, index: indices[0]),
      PopularRouteWidget(routes: routes, index: indices[1])
    ]);
  }
}
