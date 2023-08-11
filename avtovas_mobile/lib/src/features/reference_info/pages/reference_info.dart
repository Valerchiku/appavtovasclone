// ignore: implementation_imports
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/reference_info/widgets/reference_info_body.dart';
import 'package:common/avtovas_common_localization.dart';
import 'package:flutter/material.dart';

class ReferencePageInfoPage extends StatelessWidget {
  const ReferencePageInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseNavigationPage(
      appBarTitle: context.locale.help,
      body: const ReferenceInfoPageBody(),
    );
  }
}
