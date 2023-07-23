import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:avtovas_mobile/src/features/contacts/utils/constants/dimensions.dart';

class ContactsPageBody extends StatelessWidget {
  const ContactsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: Dimensions.contactsPaddingLeft,
          top: Dimensions.contactsPaddingTop),
      child: Placeholder(),
    );
  }
}
