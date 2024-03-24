import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/constants/web_fonts.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class PopularRouteWidget extends StatelessWidget {
  final String title;
  final List<PopularRoute> routes;
  final bool isMobile;

  const PopularRouteWidget({
    required this.title,
    required this.routes,
    required this.isMobile,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppDimensions.mediumLarge),
      padding: const EdgeInsets.all(AppDimensions.large),
      decoration: BoxDecoration(
        color: context.theme.dividerColor,
        borderRadius: BorderRadius.circular(AppDimensions.small),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Table(
            defaultColumnWidth: const FixedColumnWidth(120.0),
            children: [
              TableRow(
                children: [
                  Text(
                    title,
                    style: context.themeData.textTheme.headlineLarge?.copyWith(
                      fontWeight: WebFonts.weightBold,
                      fontSize: WebFonts.sizeSelectionTitle,
                    ),
                  ),
                  Text(
                    '',
                    style: context.themeData.textTheme.headlineLarge?.copyWith(
                      fontWeight: WebFonts.weightBold,
                      fontSize: WebFonts.sizeSelectionTitle,
                    ),
                  ),
                  Text(
                    '',
                    style: context.themeData.textTheme.headlineLarge?.copyWith(
                      fontWeight: WebFonts.weightBold,
                      fontSize: WebFonts.sizeSelectionTitle,
                    ),
                  ),
                ],
              ),
              for (final route in routes)
                _popularRoute(
                  route: route,
                  context: context,
                ),
            ],
          ),
        ],
      ),
    );
  }

  TableRow _popularRoute({
    required PopularRoute route,
    required BuildContext context,
  }) {
    return TableRow(
      children: [
        InkWell(
          onTap: route.onTap,
          child: Text(
            '${route.departure} →',
            style: context.themeData.textTheme.headlineSmall?.copyWith(
              fontWeight: WebFonts.weightNormal,
              color: context.theme.mainAppColor,
            ),
          ),
        ),
        InkWell(
          onTap: route.onTap,
          child: Text(
            route.destination,
            style: context.themeData.textTheme.headlineSmall?.copyWith(
              fontWeight: WebFonts.weightNormal,
              color: context.theme.mainAppColor,
            ),
          ),
        ),
        InkWell(
          onTap: route.onTap,
          child: Text(
            'от ${context.locale.price(route.price)}',
            style: context.themeData.textTheme.headlineSmall?.copyWith(
              fontWeight: WebFonts.weightBold,
            ),
          ),
        ),
      ],
    );
  }
}

class PopularRoute {
  final String departure;
  final String destination;
  final String price;
  final VoidCallback onTap;

  const PopularRoute({
    required this.departure,
    required this.destination,
    required this.price,
    required this.onTap,
  });
}
