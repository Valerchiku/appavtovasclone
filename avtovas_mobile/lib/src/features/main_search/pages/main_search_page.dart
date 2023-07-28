import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/main_search/widgets/main_search_body.dart';
import 'package:flutter/material.dart';

final class MainSearchPage extends StatelessWidget {
  const MainSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseNavigationPage(
      body: MainSearchBody(),
    );
  }
}
