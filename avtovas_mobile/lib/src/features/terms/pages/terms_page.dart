import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/terms/widgets/terms_body.dart';
import 'package:flutter/material.dart';

class TermsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseNavigationPage(
        body: TermsPageBody(),
      ),
    );
  }
}
