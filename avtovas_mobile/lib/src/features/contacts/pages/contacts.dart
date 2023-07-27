import 'package:avtovas_mobile/src/common/widgets/navigation_panel/avtovas_navigation_panel.dart';
import 'package:avtovas_mobile/src/features/app/pages/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/contacts_body.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ContactsPageBody(),
      bottomNavigationBar: AvtovasNavigationPanel(selectedIndex: -1, items: [],),
    );
  }
}
