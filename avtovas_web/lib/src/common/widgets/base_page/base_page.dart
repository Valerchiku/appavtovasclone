import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  final Widget body;
  final Color? backgroundColor;
  const BasePage({
    required this.body,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: Column(
                  children: [
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
