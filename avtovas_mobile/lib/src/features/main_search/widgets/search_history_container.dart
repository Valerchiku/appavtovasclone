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
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.only(
          top: AppDimensions.medium,
          bottom: AppDimensions.medium,
          left: AppDimensions.large,
          right: AppDimensions.extraLarge * 1.5,
        ),
        decoration: BoxDecoration(
          color: context.theme.searchHistoryColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(AppDimensions.medium),
          ),
        ),
        child: Text.rich(
          TextSpan(
            style: context.themeData.textTheme.titleLarge?.copyWith(),
            children: [
              TextSpan(text: '$departurePlace -\n'),
              TextSpan(text: arrivalPlace),
            ],
          ),
        ),
      ),
    );
  }
}
