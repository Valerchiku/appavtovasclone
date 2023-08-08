import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/terms/widgets/terms_body.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseNavigationPage(
      appBarTitle: context.locale.termsTitle,
      body: const TermsBody(),
    );
  }
}
