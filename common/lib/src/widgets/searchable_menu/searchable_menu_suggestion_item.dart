import 'package:common/avtovas_common.dart';
import 'package:core/avtovas_core.dart';
import 'package:flutter/material.dart';

class SearchableMenuSuggestionItem extends StatelessWidget {
  final BusStop busStop;

  const SearchableMenuSuggestionItem({
    required this.busStop,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final subTitleTextTheme = context.themeData.textTheme.titleMedium?.copyWith(
      fontWeight: CommonFonts.weightRegular,
      color: context.theme.quaternaryTextColor,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: CommonDimensions.large),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(busStop.name),
          const SizedBox(height: CommonDimensions.extraSmall),
          if (busStop.district != null && busStop.region != null)
            Text(
              '${busStop.district}, ${busStop.region}',
              style: subTitleTextTheme,
            ),
          if (busStop.district == null && busStop.region != null)
            Text('${busStop.region}', style: subTitleTextTheme),
          if (busStop.district != null && busStop.region == null)
            Text('${busStop.district}', style: subTitleTextTheme),
        ],
      ),
    );
  }
}
