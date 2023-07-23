import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/contacts_body.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContactsPageBody(),
    );
  }
}
