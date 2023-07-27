import 'package:avtovas_mobile/src/common/widgets/navigation_panel/avtovas_navigation_panel.dart';
import 'package:avtovas_mobile/src/features/contacts/widgets/contacts_body.dart';
import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const ContactsPageBody(),
      bottomNavigationBar:
        const AvtovasNavigationPanel(
          selectedIndex: -1,
          items: [],
        ),
    );
  }
}
