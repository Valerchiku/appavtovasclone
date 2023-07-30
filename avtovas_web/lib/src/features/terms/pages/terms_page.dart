import 'package:avtovas_web/src/features/terms/widgets/terms_body.dart';
import 'package:flutter/material.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TermsPageBody(),
    );
  }
}
