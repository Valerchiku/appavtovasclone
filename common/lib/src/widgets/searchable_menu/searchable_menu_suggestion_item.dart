import 'package:common/avtovas_common_themes.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/constants/common_fonts.dart';
import 'package:flutter/material.dart';

class SearchableMenuSuggestionItem extends StatelessWidget {
  final String name;
  final String? district;
  final String? region;
  const SearchableMenuSuggestionItem({
    required this.name,
    required this.district,
    required this.region,
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
          Text(name),
          const SizedBox(height: CommonDimensions.extraSmall),
          if (district != null && region != null)
            Text('$district , $region', style: subTitleTextTheme),
          if (district == null && region != null)
            Text('$region', style: subTitleTextTheme),
          if (district != null && region == null)
            Text('$district', style: subTitleTextTheme),
          if (district == null && region == null)
          const SizedBox(),
        ],
      ),
    );
  }
}
