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
  final VoidCallback? onAvtovasLogoTap;
  final VoidCallback? onSignInTap;
  final VoidCallback onMyTripsTap;
  final String currentRoute;

  const AvtovasAppBar({
    required this.currentRoute,
    required this.smartLayout,
    required this.onMenuButtonTap,
    required this.onHelpTap,
    required this.onAvtovasLogoTap,
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
            onTap: onAvtovasLogoTap ?? () {},
          ),
          if (!smartLayout) ...[
            const SizedBox(width: AppDimensions.medium),
            Expanded(
              child: _NonSmartNavigationButtons(
                onSignInTap: onSignInTap,
                onHelpTap: onHelpTap,
                onMyTripsTap: currentRoute != Routes.myTripsPath.name
                    ? onMyTripsTap
                    : () {},
              ),
            ),
          ],
          if (smartLayout) ...[
            const Spacer(),
            AvtovasVectorButton(
              onTap: () {},
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

  const _NonSmartNavigationButtons({
    this.onHelpTap,
    this.onMyTripsTap,
    this.onSignInTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AvtovasButton.text(
          backgroundOpacity: AppDimensions.none,
          buttonText: 'Поиск',
          textStyle: context.themeData.textTheme.headlineMedium?.copyWith(
            fontWeight: WebFonts.weightRegular,
            color: context.theme.quaternaryTextColor,
          ),
          onTap: () {},
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
