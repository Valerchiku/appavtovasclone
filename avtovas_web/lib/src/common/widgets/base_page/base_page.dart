import 'package:avtovas_web/src/common/constants/web_dimensions.dart';
import 'package:avtovas_web/src/common/widgets/avtovas_app_bar/avtovas_app_bar.dart';
import 'package:avtovas_web/src/common/widgets/avtovas_footer/avtovas_footer.dart';
import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  final bool isSmart;
  final Widget body;

  const BasePage({
    required this.isSmart,
    required this.body,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AvtovasAppBar(
            isSmart: isSmart,
          ),
          const SizedBox(height: AppDimensions.medium),
          body,
          // const Spacer(),
          AvtovasFooter(
            isSmart: isSmart,
          ),
        ],
      ),
    );
  }
}
