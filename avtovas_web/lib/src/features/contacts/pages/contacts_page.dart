import 'package:avtovas_web/src/features/contacts/widgets/contacts_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ContactsPageBody(),
    );
  }
}
