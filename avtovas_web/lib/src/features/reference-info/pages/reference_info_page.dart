import 'package:avtovas_web/src/features/reference-info/widgets/reference_info_body.dart';
import 'package:flutter/material.dart';

class ReferenceInfoPage extends StatelessWidget {
  const ReferenceInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const ReferenceInfoPageBody(),
    );
  }
}
