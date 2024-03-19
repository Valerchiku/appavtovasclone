import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:avtovas_mobile/src/common/shared_cubit/app_overlay/app_overlay_cubit.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract final class SupportMethods {
  static final _overlayCubit = i.get<AppOverlayCubit>();

  static Future<void> showAvtovasDialog({
    required BuildContext context,
    required Widget Function(BuildContext) builder,
    Color barrierColor = kCupertinoModalBarrierColor,
    bool useRootNavigator = false,
    bool userSafeArea = true,
    bool barrierDismissible = true,
  }) async {
    _overlayCubit.applyStyle(
      _overlayCubit.state.style!.copyWith(
        systemNavigationBarColor: context.theme.transparent,
      ),
    );

    await showCupertinoDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: builder,
      useRootNavigator: useRootNavigator,
    );

    _overlayCubit.applyPreviousStyle();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
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
    final sheetBody = Material(
      borderRadius: const BorderRadius.all(
        Radius.circular(CommonDimensions.large),
      ),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.large),
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
                        svgAssetPath: AppAssets.crossIcon,
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
    );

    return showModalBottomSheet(
      context: context,
      backgroundColor: context.theme.transparent,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.large,
            vertical: AppDimensions.extraLarge,
          ),
          child: sheetBody,
        );
      },
    );
  }

  static Future<DateTime?> showAvtovasDatePicker(
    BuildContext context,
    Future<DateTime?> dateTime,
  ) async {
    _overlayCubit.applyStyle(
      _overlayCubit.state.style!.copyWith(
        systemNavigationBarColor: context.theme.transparent,
      ),
    );

    final pickedDate = await dateTime;

    _overlayCubit.applyPreviousStyle();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );

    return pickedDate;
  }
}
