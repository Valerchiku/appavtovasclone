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
            top: AppDimensions.large,
            left:
                !isSmart ? AppDimensions.rootPaddingLeft : AppDimensions.large,
            right: !isSmart ? AppDimensions.rootPadding : AppDimensions.large,
          ),
          child: FractionallySizedBox(
            child: Row(
              children: [
                const AvtovasVectorImage(svgAssetPath: WebAssets.menuIcon),
                SizedBox(
                  width:
                      !isSmart ? AppDimensions.extraLarge : AppDimensions.large,
                ),
                const AvtovasVectorImage(
                  svgAssetPath: WebAssets.avtovasAppBar,
                ),
                if (!isSmart) ...[
                  const SizedBox(width: AppDimensions.medium),
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
          buttonText: 'Мои поездки',
          textStyle: context.themeData.textTheme.headlineMedium?.copyWith(
            fontWeight: WebFonts.weightRegular,
            color: context.theme.quaternaryTextColor,
          ),
          onTap: () {},
        ),
        AvtovasButton.text(
          backgroundOpacity: AppDimensions.none,
          buttonText: 'Помощь',
          textStyle: context.themeData.textTheme.headlineMedium?.copyWith(
            fontWeight: WebFonts.weightRegular,
            color: context.theme.quaternaryTextColor,
          ),
          onTap: () {},
        ),
        const Spacer(),
        AvtovasButton.icon(
          backgroundOpacity: AppDimensions.none,
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
