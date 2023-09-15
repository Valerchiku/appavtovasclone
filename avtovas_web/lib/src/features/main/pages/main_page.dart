import 'package:avtovas_web/src/common/widgets/avtovas_footer/avtovas_footer.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: context.theme.assistiveTextColor,
      body: const Column(
        children: [
          AvtovasFooter(),
        ],
      ),
    );
  }
}
