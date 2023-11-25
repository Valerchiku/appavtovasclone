import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/constants/web_fonts.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class PopularRoute extends StatelessWidget {
  final String title;
  final List<String> routes;
  final bool isMobile;
  const PopularRoute({
    required this.title,
    required this.routes,
    required this.isMobile,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.dividerColor,
        borderRadius: BorderRadius.circular(AppDimensions.small),
      ),
      padding: const EdgeInsets.all(AppDimensions.large),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: context.themeData.textTheme.headlineLarge?.copyWith(
              fontWeight: WebFonts.weightBold,
              fontSize: WebFonts.sizeSelectionTitle,
            ),
          ),
          for (final route in routes) _RouteAndPrice(fromToTitle: route),
        ],
      ),
    );
  }
}

class _RouteAndPrice extends StatelessWidget {
  final String fromToTitle;
  const _RouteAndPrice({
    required this.fromToTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          fromToTitle,
          style: context.themeData.textTheme.headlineSmall?.copyWith(
            fontWeight: WebFonts.weightNormal,
            color: context.theme.mainAppColor,
          ),
        ),
        Text(
          '1 050,00 руб',
          style: context.themeData.textTheme.headlineSmall,
          // overflow: TextOverflow.ellipsis,
        ),
        // RichText(
        //   text: TextSpan(
        //     children: <TextSpan>[
        //       TextSpan(
        //         text: fromToTitle,
        //         style: context.themeData.textTheme.headlineSmall?.copyWith(
        //           fontWeight: WebFonts.weightNormal,
        //           color: context.theme.mainAppColor,
        //         ),
        //       ),
        //       const TextSpan(text: '   '),
        //       TextSpan(
        //         text: '1 050,00 руб',
        //         style: context.themeData.textTheme.headlineSmall,
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
