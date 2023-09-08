import 'package:common/src/theme/theme_extension.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/constants/images_assets.dart';
import 'package:common/src/widgets/vector_button/avtovas_vector_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract final class SupportMethods {
  static Future<void> showAvtovasDialog({
    required BuildContext context,
    required Widget Function(BuildContext) builder,
    Color barrierColor = kCupertinoModalBarrierColor,
    bool useRootNavigator = false,
    bool userSafeArea = true,
  }) async {
    await showAdaptiveDialog(
      context: context,
      builder: builder,
      useRootNavigator: useRootNavigator,
      useSafeArea: userSafeArea,
      barrierColor: barrierColor,
    );
  }

  static Future<void> showAvtovasBottomSheet({
    required BuildContext context,
    required Widget child,
    String? sheetTitle,
    TextStyle? titleStyle,
    bool useCloseButton = true,
    bool useRootNavigator = false,
    Color barrierColor = kCupertinoModalBarrierColor,
  }) async {
    await showCupertinoModalPopup(
      context: context,
      useRootNavigator: useRootNavigator,
      barrierColor: barrierColor,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(CommonDimensions.large),
          child: Material(
            borderRadius: const BorderRadius.all(
              Radius.circular(CommonDimensions.large),
            ),
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Padding(
                padding: const EdgeInsets.all(CommonDimensions.large),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (sheetTitle != null || useCloseButton) ...[
                      Row(
                        children: [
                          if (sheetTitle != null)
                            Text(
                              sheetTitle,
                              style: titleStyle ??
                                  context.themeData.textTheme.displaySmall,
                            ),
                          const Spacer(),
                          if (useCloseButton)
                            AvtovasVectorButton(
                              onTap: () => Navigator.canPop(context)
                                  ? Navigator.pop(context)
                                  : throw Exception(),
                              svgAssetPath: ImagesAssets.crossIcon,
                            ),
                        ],
                      ),
                      const SizedBox(height: CommonDimensions.medium),
                    ],
                    child,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
