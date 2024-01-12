import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/constants/web_assets.dart';
import 'package:avtovas_web/src/common/constants/web_fonts.dart';
import 'package:avtovas_web/src/common/navigation/routes.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class AvtovasAppBar extends StatelessWidget {
  final bool smartLayout;
  final VoidCallback onMenuButtonTap;
  final VoidCallback onHelpTap;
  final VoidCallback? navigateToMainScreen;
  final VoidCallback? onSignInTap;
  final VoidCallback onMyTripsTap;
  final String currentRoute;

  const AvtovasAppBar({
    required this.currentRoute,
    required this.smartLayout,
    required this.onMenuButtonTap,
    required this.onHelpTap,
    required this.navigateToMainScreen,
    required this.onMyTripsTap,
    this.onSignInTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimensions.medium,
        horizontal: AppDimensions.large,
      ),
      child: Row(
        children: [
          AvtovasVectorButton(
            svgAssetPath: WebAssets.menuIcon,
            innerPadding: const EdgeInsets.symmetric(
              vertical: AppDimensions.mediumLarge,
            ),
            onTap: onMenuButtonTap,
          ),
          const SizedBox(width: AppDimensions.large),
          AvtovasVectorButton(
            svgAssetPath: WebAssets.avtovasAppBar,
            innerPadding: const EdgeInsets.symmetric(
              vertical: AppDimensions.medium,
              horizontal: AppDimensions.medium,
            ),
            onTap: navigateToMainScreen ?? () {},
          ),
          if (!smartLayout) ...[
            const SizedBox(width: AppDimensions.medium),
            Expanded(
              child: _NonSmartNavigationButtons(
                onSignInTap:
                    currentRoute != Routes.authPath.name ? onSignInTap : () {},
                onHelpTap: onHelpTap,
                onMyTripsTap: currentRoute != Routes.myTripsPath.name
                    ? onMyTripsTap
                    : () {},
                onSearchTap: navigateToMainScreen ?? () {},
              ),
            ),
          ],
          if (smartLayout && onSignInTap != null) ...[
            const Spacer(),
            AvtovasVectorButton(
              onTap: onSignInTap,
              innerPadding: const EdgeInsets.symmetric(
                vertical: AppDimensions.medium,
                horizontal: AppDimensions.medium,
              ),
              svgAssetPath: WebAssets.personIcon,
            ),
          ],
        ],
      ),
    );
  }
}

class _NonSmartNavigationButtons extends StatelessWidget {
  final VoidCallback? onSignInTap;
  final VoidCallback? onHelpTap;
  final VoidCallback? onMyTripsTap;
  final VoidCallback? onSearchTap;

  const _NonSmartNavigationButtons({
    this.onHelpTap,
    this.onMyTripsTap,
    this.onSignInTap,
    this.onSearchTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AvtovasButton.text(
          backgroundOpacity: AppDimensions.none,
          buttonText: context.locale.search,
          textStyle: context.themeData.textTheme.headlineMedium?.copyWith(
            fontWeight: WebFonts.weightRegular,
            color: context.theme.quaternaryTextColor,
          ),
          onTap: onSearchTap,
        ),
        AvtovasButton.text(
          backgroundOpacity: AppDimensions.none,
          buttonText: context.locale.myTrips,
          textStyle: context.themeData.textTheme.headlineMedium?.copyWith(
            fontWeight: WebFonts.weightRegular,
            color: context.theme.quaternaryTextColor,
          ),
          onTap: onMyTripsTap,
        ),
        AvtovasButton.text(
          backgroundOpacity: AppDimensions.none,
          buttonText: context.locale.help,
          textStyle: context.themeData.textTheme.headlineMedium?.copyWith(
            fontWeight: WebFonts.weightRegular,
            color: context.theme.quaternaryTextColor,
          ),
          onTap: onHelpTap,
        ),
        if (onSignInTap != null) ...[
          const Spacer(),
          AvtovasButton.icon(
            backgroundOpacity: AppDimensions.none,
            buttonText: 'Войти',
            textStyle: context.themeData.textTheme.headlineMedium?.copyWith(
              fontWeight: WebFonts.weightRegular,
            ),
            svgPath: WebAssets.personIcon,
            onTap: onSignInTap!,
          ),
        ],
      ],
    );
  }
}
