import 'dart:async';

import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/widgets/support_methods/support_methods.dart';
import 'package:avtovas_mobile/src/features/main/cubit/search_cubit/main_search_cubit.dart';
import 'package:avtovas_mobile/src/features/main/widgets/main_search_widgets/search_history.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

final class MainSearchBody extends StatefulWidget {
  final EdgeInsets viewInsets;

  const MainSearchBody({required this.viewInsets, super.key});

  @override
  State<MainSearchBody> createState() => _MainSearchBodyState();
}

class _MainSearchBodyState extends State<MainSearchBody> {
  late final TextEditingController _departureController;
  late final TextEditingController _arrivalController;

  late final AutoScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = AutoScrollController();

    _departureController = TextEditingController();
    _arrivalController = TextEditingController();
  }

  Future<void> _showDatePicker(
    BuildContext context,
    MainSearchCubit cubit,
  ) async {
    final now = DateTime.now();

    final tripDate = await SupportMethods.showAvtovasDatePicker(
      context,
      showDatePicker(
        context: context,
        initialDate: now,
        firstDate: now,
        lastDate: now.copyWith(month: now.month + 6),
        locale: Locale(context.locale.localeName),
        confirmText: 'НАЙТИ БИЛЕТ',
        builder: (context, child) {
          return Theme(
            data: context.themeData.copyWith(
              datePickerTheme: DatePickerThemeData(
                dividerColor: context.theme.mainAppColor,
                shape: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppDimensions.mediumLarge),
                  ),
                ),
                headerForegroundColor: context.theme.whiteTextColor,
                headerBackgroundColor: context.theme.mainAppColor,
                dayOverlayColor: MaterialStateProperty.all(
                  context.theme.mainAppColor.withOpacity(0.1),
                ),
                yearOverlayColor: MaterialStateProperty.all(
                  context.theme.mainAppColor.withOpacity(0.1),
                ),
                confirmButtonStyle: ElevatedButton.styleFrom(
                  backgroundColor: context.theme.mainAppColor,
                  foregroundColor: context.theme.whiteTextColor,
                  textStyle: context.themeData.textTheme.bodyLarge?.copyWith(
                    color: context.theme.whiteTextColor,
                  ),
                ),
              ),
              colorScheme: ColorScheme.light(
                primary: context.theme.mainAppColor,
              ),
            ),
            child: child!,
          );
        },
      ),
    );

    if (tripDate != null) {
      cubit
        ..setTripDate(tripDate)
        ..search(_resetPage);
    }
  }

  void _scrollToPosition() {
    const animationDelay = 500;

    Timer(
      const Duration(milliseconds: animationDelay),
      () => _scrollController.scrollToIndex(
        0,
        duration: const Duration(milliseconds: 400),
        preferPosition: AutoScrollPosition.begin,
      ),
    );
  }

  void _listener(BuildContext context, MainSearchState state) {
    if (state.route.type != null) {
      context.navigateTo(state.route);
    }
  }

  bool _listenWhen(MainSearchState prev, MainSearchState current) {
    return prev.route.type == null && current.route.type != null;
  }

  void _onSwap(MainSearchCubit cubit) {
    cubit
      ..onDepartureChanged(_departureController.text)
      ..onArrivalChanged(_arrivalController.text);
  }

  void _resetPage() {
    _departureController.clear();
    _arrivalController.clear();
  }

  void _onHistoryButtonTap(MainSearchCubit cubit, List<String> destination) {
    _departureController.text = destination.first;
    _arrivalController.text = destination.last;

    cubit
      ..setTripDate(DateTime.now())
      ..onDepartureChanged(destination.first)
      ..onArrivalChanged(destination.last)
      ..search(
        _resetPage,
      );
  }

  @override
  void dispose() {
    _arrivalController.dispose();
    _departureController.dispose();

    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<MainSearchCubit>(
      child: BlocConsumer<MainSearchCubit, MainSearchState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          final cubit = CubitScope.of<MainSearchCubit>(context);

          return KeyboardVisibilityBuilder(
            builder: (context, isKeyboardOpened) {
              if (isKeyboardOpened) _scrollToPosition();

              return Stack(
                fit: StackFit.expand,
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      AppAssets.mainSearchBackground,
                      fit: BoxFit.cover,
                      color: context.theme.backgroundOpacityColor,
                      colorBlendMode: BlendMode.darken,
                    ),
                  ),
                  ListView(
                    controller: _scrollController,
                    physics: const ClampingScrollPhysics(),
                    children: [
                      const SizedBox(height: kToolbarHeight),
                      const AvtovasVectorImage(
                        svgAssetPath: AppAssets.mainActovasLogo,
                      ),
                      const SizedBox(height: AppDimensions.extraLarge * 1.5),
                      Text(
                        context.locale.mainSearchTitle,
                        style:
                            context.themeData.textTheme.headlineLarge?.copyWith(
                          color: context.theme.whiteTextColor,
                          fontSize: AppFonts.mainTitleSize,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: AppDimensions.extraLarge * 1.5),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppDimensions.extraLarge,
                        ),
                        child: AutoScrollTag(
                          key: const ValueKey<int>(0),
                          index: 0,
                          controller: _scrollController,
                          child: SearchTripVertical(
                            items: state.suggestions,
                            arrivalController: _arrivalController,
                            departureController: _departureController,
                            onDepartureSubmitted: (value) {
                              cubit
                                ..onDepartureChanged(value)
                                ..search(_resetPage);
                            },
                            onArrivalSubmitted: (value) {
                              cubit
                                ..onArrivalChanged(value)
                                ..search(_resetPage);
                            },
                            onSwapButtonTap: () => _onSwap(cubit),
                          ),
                        ),
                      ),
                      const SizedBox(height: AppDimensions.large),
                      Row(
                        children: [
                          const SizedBox(width: AppDimensions.extraLarge),
                          AvtovasButton.icon(
                            buttonText: state.tripDate?.yMMMdFormat(
                                  context.locale.localeName,
                                ) ??
                                context.locale.date,
                            svgPath: AppAssets.searchCalendarIcon,
                            sizeBetween: AppDimensions.medium,
                            iconColor: context.theme.containerBackgroundColor,
                            onTap: () => _showDatePicker(context, cubit),
                            // _showDatePicker(context, cubit),
                          ),
                          const SizedBox(width: AppDimensions.large),
                        ],
                      ),
                      IgnorePointer(
                        child: SizedBox(height: widget.viewInsets.bottom + 150),
                      ),
                    ],
                  ),
                  if (state.searchHistory.isNotEmpty)
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SearchHistory(
                        searchHistory: state.searchHistory.length > 2
                            ? [
                                state.searchHistory.first,
                                state.searchHistory[1],
                              ]
                            : state.searchHistory,
                        onHistoryButtonTap: (destination) =>
                            _onHistoryButtonTap(
                          cubit,
                          destination,
                        ),
                        onExpansionStatusChanged: (status) {},
                        onClearButtonTap: cubit.clearSearchHistory,
                      ),
                    ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: state.pageLoading
                        ? SizedBox(
                            width: context.availableWidth,
                            height: context.availableHeight,
                            child: const ColoredBox(
                              color: Colors.black26,
                              child: CupertinoActivityIndicator(),
                            ),
                          )
                        : null,
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
