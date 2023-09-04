import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

final class SearchHistory extends StatelessWidget {
  final List<List<String>> searchHistory;
  final ValueChanged<List<String>> onHistoryButtonTap;
  final VoidCallback onClearButtonTap;

  const SearchHistory({
    required this.searchHistory,
    required this.onHistoryButtonTap,
    required this.onClearButtonTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const tripsLengthForScrolling = 2;
    const clearButtonOpacity = 0.0;

    return ExpansionContainer(
      title: Text(
        context.locale.previouslySearched,
        style: context.themeData.textTheme.titleLarge?.copyWith(
          color: context.theme.whiteTextColor,
        ),
      ),
      margin: const EdgeInsets.only(
        bottom: AppDimensions.large,
        left: AppDimensions.extraLarge,
        right: AppDimensions.extraLarge,
      ),
      padding: EdgeInsets.zero,
      arrowColor: context.theme.containerBackgroundColor,
      arrowIndent: AppDimensions.medium,
      titleAlignment: MainAxisAlignment.center,
      childrenAlignment: CrossAxisAlignment.center,
      sizeBetweenElements: AppDimensions.large,
      sizeBetweenChildren: AppDimensions.medium,
      children: [
        if (searchHistory.length > tripsLengthForScrolling)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (final history in searchHistory)
                  _SearchHistoryContainer(
                    departurePlace: history.first,
                    arrivalPlace: history.last,
                    onHistoryTap: onHistoryButtonTap,
                  ),
              ].insertBetween(
                const SizedBox(width: AppDimensions.medium),
              ),
            ),
          )
        else
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (final history in searchHistory)
                Expanded(
                  child: _SearchHistoryContainer(
                    departurePlace: history.first,
                    arrivalPlace: history.last,
                    onHistoryTap: onHistoryButtonTap,
                  ),
                ),
            ].insertBetween(
              const SizedBox(width: AppDimensions.medium),
            ),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AvtovasButton.text(
              buttonText: context.locale.clearSearchHistory,
              buttonColor: context.theme.transparent,
              backgroundOpacity: clearButtonOpacity,
              onTap: onClearButtonTap,
            ),
          ],
        ),
      ],
    );
  }
}

final class _SearchHistoryContainer extends StatelessWidget {
  final String departurePlace;
  final String arrivalPlace;
  final ValueChanged<List<String>> onHistoryTap;

  const _SearchHistoryContainer({
    required this.departurePlace,
    required this.arrivalPlace,
    required this.onHistoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onHistoryTap([departurePlace, arrivalPlace]),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: AppDimensions.medium,
          horizontal: AppDimensions.large,
        ),
        decoration: BoxDecoration(
          color: context.theme.searchHistoryColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(AppDimensions.medium),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$departurePlace -',
              style: context.themeData.textTheme.titleLarge?.copyWith(),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              arrivalPlace,
              style: context.themeData.textTheme.titleLarge?.copyWith(),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

/*Text.rich(
TextSpan(
style: context.themeData.textTheme.titleLarge?.copyWith(),
children: [
TextSpan(text: '$departurePlace -\n', ),
TextSpan(text: arrivalPlace),
],
),
),*/
