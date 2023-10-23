import 'package:avtovas_web/src/common/constants/web_assets.dart';
import 'package:avtovas_web/src/common/constants/web_dimensions.dart';
import 'package:avtovas_web/src/common/constants/web_fonts.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class AvtovasAppBar extends StatelessWidget {
  final bool isSmart;
  const AvtovasAppBar({
    required this.isSmart,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: EdgeInsets.only(
            top: WebDimensions.large,
            left:
                !isSmart ? WebDimensions.rootPaddingLeft : WebDimensions.large,
            right: !isSmart ? WebDimensions.rootPadding : WebDimensions.large,
          ),
          child: FractionallySizedBox(
            child: Row(
              children: [
                const AvtovasVectorImage(svgAssetPath: WebAssets.menuIcon),
                SizedBox(
                  width:
                      !isSmart ? WebDimensions.extraLarge : WebDimensions.large,
                ),
                const AvtovasVectorImage(
                  svgAssetPath: WebAssets.avtovasAppBar,
                ),
                if (!isSmart) ...[
                  const SizedBox(width: WebDimensions.medium),
                  const Expanded(
                    child: _NonSmartNavigationButtons(),
                  ),
                ],
                if (isSmart) ...[
                  const Spacer(),
                  AvtovasVectorButton(
                    onTap: () {},
                    svgAssetPath: WebAssets.personIcon,
                  ),
                ],
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
