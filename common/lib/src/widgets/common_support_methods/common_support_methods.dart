import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/images_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract final class CommonSupportMethods {
  // static final _overlayCubit = i.get<AppOverlayCubit>();

  static Future<void> showAvtovasDialog({
    required BuildContext context,
    required Widget Function(BuildContext) builder,
    Color barrierColor = kCupertinoModalBarrierColor,
    bool useRootNavigator = false,
    bool userSafeArea = true,
  }) async {
    /*SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    _overlayCubit.applyStyle(
      _overlayCubit.state.style!.copyWith(
        systemNavigationBarColor: context.theme.transparent,
      ),
    );*/

    await showAdaptiveDialog(
      context: context,
      builder: builder,
      useRootNavigator: useRootNavigator,
      useSafeArea: userSafeArea,
      barrierColor: barrierColor,
    );

    /*_overlayCubit.applyPreviousStyle();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );*/
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

  static Future<DateTime?> showAvtovasDatePicker(
    BuildContext context,
    Future<DateTime?> dateTime,
  ) async {
    /*SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    _overlayCubit.applyStyle(
      _overlayCubit.state.style!.copyWith(
        systemNavigationBarColor: context.theme.transparent,
      ),
    );*/

    final pickedDate = await dateTime;

    /*_overlayCubit.applyPreviousStyle();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );*/

    return pickedDate;
  }
}
