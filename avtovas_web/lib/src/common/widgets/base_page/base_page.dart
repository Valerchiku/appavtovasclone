import 'package:avtovas_web/src/common/widgets/avtovas_footer/avtovas_footer.dart';
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
          return ListView(
            children: [
              body,
              AvtovasFooter(constraints: constraints),
            ],
          );
          /* return CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: Column(
                  children: [
                  ],
                ),
              ),
            ],
          );*/
        },
      ),
    );
  }
}
