import 'package:avtovas_web/src/common/constants/web_assets.dart';
import 'package:avtovas_web/src/common/constants/web_dimensions.dart';
import 'package:avtovas_web/src/common/constants/web_fonts.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class AvtovasAppBar extends StatelessWidget {
  const AvtovasAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final isNonSmart = maxWidth > WebDimensions.maxNonSmartWidth;
        final isSmart = maxWidth <= WebDimensions.maxNonSmartWidth;

        return Padding(
          padding: EdgeInsets.only(
            top: WebDimensions.large,
            left: isNonSmart
                ? WebDimensions.rootPaddingLeft
                : WebDimensions.large,
            right: isNonSmart ? WebDimensions.rootPadding : WebDimensions.large,
          ),
          child: FractionallySizedBox(
            child: Row(
              children: [
                const AvtovasVectorImage(svgAssetPath: WebAssets.menuIcon),
                SizedBox(
                  width: isNonSmart
                      ? WebDimensions.extraLarge
                      : WebDimensions.large,
                ),
                AvtovasVectorImage(
                  svgAssetPath: WebAssets.avtovasAppBar,
                  width: isNonSmart ? null : maxWidth / 4,
                ),
                if (isNonSmart) const SizedBox(width: WebDimensions.medium),
                if (isSmart) const Spacer(),
                if (isNonSmart)
                  const Expanded(
                    child: _NonSmartNavigationButtons(),
                  ),
                if (isSmart)
                  AvtovasVectorButton(
                    onTap: () {},
                    svgAssetPath: WebAssets.personIcon,
                  ),
              ],
            ),
          ),
        );
      },
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
