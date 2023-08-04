import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:avtovas_mobile/src/common/shared_cubit/app_overlay/app_overlay_cubit.dart';
import 'package:common/avtovas_common_themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

abstract final class SupportMethods {
  static final _overlayCubit = i.get<AppOverlayCubit>();

  static Future<void> showAvtovasDialog({
    required BuildContext context,
    required AsyncCallback showWindow,
  }) async {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    _overlayCubit.applyStyle(
      _overlayCubit.state.style!.copyWith(
        systemNavigationBarColor: context.theme.transparent,
      ),
    );

    await showWindow();

    _overlayCubit.applyPreviousStyle();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }

  static Future<DateTime?> showAvtovasDatePicker(
    BuildContext context,
    Future<DateTime?> dateTime,
  ) async {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
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
