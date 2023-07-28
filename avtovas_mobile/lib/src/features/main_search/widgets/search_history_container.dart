import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

final class SearchHistoryContainer extends StatelessWidget {
  final String departurePlace;
  final String arrivalPlace;

  const SearchHistoryContainer({
    required this.departurePlace,
    required this.arrivalPlace,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimensions.medium,
        horizontal: AppDimensions.medium,
      ),
      decoration: BoxDecoration(
        color: context.theme.whitespaceContainerColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(AppDimensions.medium),
        ),
      ),
      child: Text.rich(
        TextSpan(
          style: context.themeData.textTheme.titleLarge,
          children: [
            TextSpan(text: '$departurePlace -\n'),
            TextSpan(text: arrivalPlace),
          ],
        ),
      ),
    );
  }
}
