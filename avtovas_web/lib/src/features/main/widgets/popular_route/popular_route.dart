import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/constants/web_fonts.dart';
import 'package:common/avtovas_common.dart';
// ignore: implementation_imports
import 'package:common/src/utils/mock_popular_routes.dart';
import 'package:flutter/material.dart';

class PopularRoute extends StatelessWidget {
  final String title;
  final List<MockPopularRoutes> routes;
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
          for (final route in routes) _RouteAndPrice(mockPopularRoutes: route),
        ],
      ),
    );
  }
}

class _RouteAndPrice extends StatelessWidget {
  final MockPopularRoutes mockPopularRoutes;
  const _RouteAndPrice({
    required this.mockPopularRoutes,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${mockPopularRoutes.departure} → ${mockPopularRoutes.arrival}',
          style: context.themeData.textTheme.headlineSmall?.copyWith(
            fontWeight: WebFonts.weightNormal,
            color: context.theme.mainAppColor,
          ),
        ),
        Text(
          'от ${context.locale.price(mockPopularRoutes.price)}',
          style: context.themeData.textTheme.headlineSmall,
        ),
      ],
    );
  }
}
