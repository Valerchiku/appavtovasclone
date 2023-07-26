import 'package:avtovas_mobile/features/search/widgets/search_page_body.dart';
import 'package:avtovas_mobile/src/common/widgets/navigation_panel/avtovas_navigation_panel.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SearchPageBody(), bottomNavigationBar: AvtovasNavigationPanel(
      selectedIndex: 0,
      items: [],
    ));
  }
}
