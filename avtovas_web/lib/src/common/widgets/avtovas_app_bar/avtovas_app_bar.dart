import 'package:avtovas_web/src/common/constants/web_assets.dart';
import 'package:avtovas_web/src/common/constants/web_dimensions.dart';
import 'package:avtovas_web/src/common/constants/web_fonts.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class AvtovasAppBar extends StatelessWidget {
  final bool smartLayout;
  final VoidCallback onMenuButtonTap;

  const AvtovasAppBar({
    required this.smartLayout,
    required this.onMenuButtonTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: WebDimensions.medium,
        horizontal: WebDimensions.large,
      ),
      child: Row(
        children: [
          AvtovasVectorButton(
            svgAssetPath: WebAssets.menuIcon,
            onTap: onMenuButtonTap,
          ),
          const SizedBox(width: WebDimensions.large),
          GestureDetector(
            onTap: () {},
            child: const AvtovasVectorImage(
              svgAssetPath: WebAssets.avtovasAppBar,
            ),
          ),
          if (!smartLayout) ...[
            const SizedBox(width: WebDimensions.medium),
            const Expanded(
              child: _NonSmartNavigationButtons(),
            ),
          ],
          if (smartLayout) ...[
            const Spacer(),
            AvtovasVectorButton(
              onTap: () {},
              svgAssetPath: WebAssets.personIcon,
            ),
          ],
        ],
      ),
    );
  }
}

class _NonSmartNavigationButtons extends StatelessWidget {
  const _NonSmartNavigationButtons();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AvtovasButton.text(
          backgroundOpacity: WebDimensions.none,
          buttonText: 'Поиск',
          textStyle: context.themeData.textTheme.headlineMedium?.copyWith(
            fontWeight: WebFonts.weightRegular,
            color: context.theme.quaternaryTextColor,
          ),
          onTap: () {},
        ),
        AvtovasButton.text(
          backgroundOpacity: WebDimensions.none,
          buttonText: 'Мои поездки',
          textStyle: context.themeData.textTheme.headlineMedium?.copyWith(
            fontWeight: WebFonts.weightRegular,
            color: context.theme.quaternaryTextColor,
          ),
          onTap: () {},
        ),
        AvtovasButton.text(
          backgroundOpacity: WebDimensions.none,
          buttonText: 'Помощь',
          textStyle: context.themeData.textTheme.headlineMedium?.copyWith(
            fontWeight: WebFonts.weightRegular,
            color: context.theme.quaternaryTextColor,
          ),
          onTap: () {},
        ),
        const Spacer(),
        AvtovasButton.icon(
          backgroundOpacity: WebDimensions.none,
          buttonText: 'Войти',
          textStyle: context.themeData.textTheme.headlineMedium?.copyWith(
            fontWeight: WebFonts.weightRegular,
          ),
          svgPath: WebAssets.personIcon,
          onTap: () {},
        ),
      ],
    );
  }
}
