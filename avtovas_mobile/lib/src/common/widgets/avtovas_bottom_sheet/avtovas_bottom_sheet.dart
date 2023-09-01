import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:avtovas_mobile/src/common/shared_cubit/app_overlay/app_overlay_cubit.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';

typedef OnDismissCallback = void Function([ClosureType? closureType]);

final class AvtovasBottomSheet extends StatefulWidget {
  final SheetController controller;
  final SheetBuilder? headerBuilder;
  final SheetBuilder? footerBuilder;
  final SheetBuilder contentBuilder;
  final String? title;
  final double titleBottomPadding;
  final double titleTopPadding;
  final Color backgroundColor;
  final SnapSpec? snapSpec;
  final Duration openDuration;
  final bool openBouncing;
  final double? initialSnapping;
  final EdgeInsetsGeometry contentPadding;
  final OnDismissCallback onClose;
  final VoidCallback? onOpen;
  final bool showDimming;
  final bool paintNavBarToShadowColor;
  final bool closeOnCollapse;
  final bool extendBody;
  final Color? navbarColor;
  final List<double> additionalSnappings;
  final double maxSnapping;

  const AvtovasBottomSheet({
    required this.controller,
    required this.onClose,
    required this.backgroundColor,
    required this.contentBuilder,
    this.headerBuilder,
    this.footerBuilder,
    this.title,
    this.snapSpec,
    this.titleBottomPadding = AppDimensions.large,
    this.titleTopPadding = AppDimensions.large,
    this.navbarColor,
    this.initialSnapping,
    this.openDuration = const Duration(milliseconds: 200),
    this.onOpen,
    this.openBouncing = false,
    this.showDimming = true,
    this.paintNavBarToShadowColor = false,
    this.contentPadding = EdgeInsets.zero,
    this.closeOnCollapse = true,
    this.extendBody = false,
    this.additionalSnappings = const [],
    this.maxSnapping = 1,
    super.key,
  });

  @override
  State<AvtovasBottomSheet> createState() => _AvtovasBottomSheetState();
}

class _AvtovasBottomSheetState extends State<AvtovasBottomSheet>
    with SingleTickerProviderStateMixin {
  final AppOverlayCubit _overlayCubit = i.get<AppOverlayCubit>();
  late final AnimationController _dimmingController;
  bool _isFirstBuild = true;

  @override
  void initState() {
    super.initState();

    _dimmingController = AnimationController(
      vsync: this,
      duration: widget.openDuration,
    )..forward();
  }

  void _onDismiss(ClosureType closureType) {
    _dimmingController.reverse();
    widget.onClose(closureType);
  }

  void _onDismissPrevented({
    required bool backButton,
    required bool backDrop,
  }) {
    if (backButton) {
      _onDismiss(ClosureType.backButton);
    } else if (backDrop) {
      _onDismiss(ClosureType.backDrop);
    } else {
      _onDismiss(ClosureType.swipeDown);
    }
  }

  @override
  void dispose() {
    _dimmingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _changeSystemNavigationBarColor(widget.openDuration);
    final scaffold = Scaffold(
      backgroundColor: context.theme.transparent,
      body: DecoratedBoxTransition(
        decoration: DecorationTween(
          begin: BoxDecoration(
            color: context.theme.transparent,
          ),
          end: BoxDecoration(
            color: context.theme.transparent,
          ),
        ).animate(_dimmingController),
        child: SlidingSheet(
          cornerRadiusOnFullscreen: 0,
          closeOnBackButtonPressed: true,
          closeOnBackdropTap: true,
          onDismissPrevented: _onDismissPrevented,
          onOpen: widget.onOpen?.call,
          openBouncing: widget.openBouncing,
          openDuration: widget.openDuration,
          controller: widget.controller,
          color: widget.backgroundColor,
          extendBody: widget.extendBody,
          cornerRadius: AppDimensions.mediumLarge,
          headerBuilder: _headerBuilder,
          snapSpec: widget.snapSpec ??
              SnapSpec(
                snappings: [
                  0,
                  0.5,
                  widget.maxSnapping,
                  ...widget.additionalSnappings,
                ],
                initialSnap: widget.initialSnapping ?? widget.maxSnapping,
                onSnap: (state, _) => _onSnap(state),
              ),
          builder: (context, state) {
            return Padding(
              padding: widget.contentPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.title != null)
                    Padding(
                      padding: EdgeInsets.only(
                        left: AppDimensions.large -
                            widget.contentPadding.horizontal,
                        top: widget.titleTopPadding,
                        bottom: widget.titleBottomPadding,
                      ),
                      child: Text(
                        widget.title!,
                        style: context.themeData.textTheme.displaySmall,
                      ),
                    ),
                  widget.contentBuilder(context, state),
                ],
              ),
            );
          },
          footerBuilder: widget.footerBuilder,
        ),
      ),
    );
    return AvtovasPlatform.isAndroid
        ? SafeArea(
            top: false,
            child: scaffold,
          )
        : scaffold;
  }

  Widget _headerBuilder(BuildContext context, SheetState state) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const _Grabbing(),
        if (widget.headerBuilder != null)
          widget.headerBuilder!.call(context, state),
      ],
    );
  }

  void _onSnap(SheetState state) {
    if (state.isCollapsed) {
      _overlayCubit.markShouldReplaceRoot();

      if (widget.closeOnCollapse) {
        _overlayCubit.markShouldReplaceRoot();
        _onDismiss(ClosureType.swipeDown);
      }
    }
  }

  Future<void> _changeSystemNavigationBarColor(
    Duration delay,
  ) async {
    if (_isFirstBuild) {
      await Future.delayed(delay);
      final safeAreaStyle = SystemUiOverlayStyle(
        systemNavigationBarColor: widget.navbarColor ?? widget.backgroundColor,
      );
      _overlayCubit.applyStyle(safeAreaStyle);
      setState(() => _isFirstBuild = false);
    }
  }
}

final class _Grabbing extends StatelessWidget {
  const _Grabbing();

  @override
  Widget build(BuildContext context) {
    return SheetListenerBuilder(
      builder: (context, state) {
        if (state.extent != 1) {
          return FittedBox(
            fit: BoxFit.none,
            child: Opacity(
              opacity: state.extent > 0.8 ? (1 - state.extent) / 0.2 : 1.0,
              child: Center(
                child: Container(
                  margin: const EdgeInsets.only(
                    top: AppDimensions.medium,
                    bottom: AppDimensions.mediumLarge,
                  ),
                  height: 5,
                  width: AppDimensions.size2X,
                  decoration: BoxDecoration(
                    color: context.theme.dividerColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

enum ClosureType {
  backButton,
  //tapping outside of the sheet
  backDrop,
  swipeDown,
}
