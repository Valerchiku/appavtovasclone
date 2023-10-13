import 'package:avtovas_web/src/common/constants/web_dimensions.dart';
import 'package:avtovas_web/src/common/widgets/avtovas_app_bar/avtovas_app_bar.dart';
import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  final Widget body;
  const BasePage({
    required this.body,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return CustomScrollView(
            physics: const NeverScrollableScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                child: Column(
                  children: [
                    const AvtovasAppBar(),
                    const SizedBox(height: WebDimensions.medium),
                    Expanded(child: body),
                    // const Spacer(),
                    // AvtovasFooter(constraints: constraints),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
