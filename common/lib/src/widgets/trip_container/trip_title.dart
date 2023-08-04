import 'package:common/avtovas_common_themes.dart';
import 'package:flutter/material.dart';

final class TripTitle extends StatelessWidget {
  final String departurePlace;
  final String arrivalPlace;

  const TripTitle({
    required this.departurePlace,
    required this.arrivalPlace,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textHeadlineLarge =
        context.themeData.textTheme.headlineLarge?.copyWith(
      color: context.theme.mainAppColor,
      fontWeight: FontWeight.bold,
    );

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '$departurePlace - ',
            style: textHeadlineLarge,
          ),
          TextSpan(
            text: arrivalPlace,
            style: textHeadlineLarge,
          ),
        ],
      ),
    );
  }
}
