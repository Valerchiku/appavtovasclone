import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/about/widgets/about_body.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseNavigationPage(
      appBarTitle: context.locale.about,
      body: const AboutPageBody(),
    );
  }
}
