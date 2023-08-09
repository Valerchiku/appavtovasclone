import 'package:avtovas_mobile/src/features/terms/pages/terms_detail.dart';
import 'package:avtovas_mobile/src/features/terms/utils/terms_item.dart';
import 'package:flutter/material.dart';

slideToPage(context, termsItem) {
  Navigator.of(context).push(_createRoute(termsItem));
  PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => TermsDetailPage(
      termsItem: termsItem,
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween =
      Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _createRoute(TermsItem termsItem) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        TermsDetailPage(termsItem: termsItem),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}