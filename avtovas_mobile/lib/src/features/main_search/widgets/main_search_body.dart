import 'dart:async';
import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/utils/mocks.dart';
import 'package:avtovas_mobile/src/common/widgets/support_methods/support_methods.dart';
import 'package:avtovas_mobile/src/features/main/cubit/search_cubit/search_cubit.dart';
import 'package:avtovas_mobile/src/features/main/widgets/main_serach_widgets/search_history.dart';
import 'package:common/avtovas_common_localization.dart';
import 'package:common/avtovas_common_themes.dart';
import 'package:common/avtovas_common_utils.dart';
import 'package:common/avtovas_common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

final class MainSearchBody extends StatefulWidget {
  const MainSearchBody({super.key});

  @override
  State<MainSearchBody> createState() => _MainSearchBodyState();
}

class _MainSearchBodyState extends State<MainSearchBody> {
  late final TextEditingController _departureController;
  late final TextEditingController _arrivalController;

  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();

    _departureController = TextEditingController();
    _arrivalController = TextEditingController();
  }

  Future<void> _showDatePicker(
    BuildContext context,
    SearchCubit cubit,
  ) async {
    final now = DateTime.now();

    final tripDate = await SupportMethods.showAvtovasDatePicker(
      context,
      showDatePicker(
        context: context,
        initialDate: now,
        firstDate: now,
        lastDate: now.copyWith(month: now.month + 6),
        builder: (context, child) {
          return Theme(
            data: context.themeData.copyWith(
              colorScheme: ColorScheme.dark(
                primary: context.theme.containerBackgroundColor,
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
        ..search();
    }
  }

  void _scrollToPosition() {
    const animationDelay = 500;

    Timer(
      const Duration(milliseconds: animationDelay),
      () => _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        curve: Curves.fastOutSlowIn,
        duration: const Duration(milliseconds: 200),
      ),
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
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        final cubit = CubitScope.of<SearchCubit>(context);

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
                  ),
                ),
                CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        children: [
                          const SizedBox(height: kToolbarHeight),
                          const AvtovasVectorImage(
                            svgAssetPath: AppAssets.mainActovasLogo,
                          ),
                          const Spacer(),
                          Text(
                            context.locale.mainSearchTitle,
                            style: context.themeData.textTheme.headlineLarge
                                ?.copyWith(
                              color: context.theme.whiteTextColor,
                              fontSize: AppFonts.mainTitleSize,
                              fontWeight: FontWeight.normal,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: AppDimensions.extraLarge),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppDimensions.extraLarge,
                            ),
                            child: SearchTripVertical(
                              // ignore: avoid-non-ascii-symbols
                              items: const ['Москва', 'Минск'],
                              arrivalController: _arrivalController,
                              departureController: _departureController,
                              onDepartureSubmitted: (value) {
                                cubit
                                  ..onDepartureChanged(value)
                                  ..search();
                              },
                              onArrivalSubmitted: (value) {
                                cubit
                                  ..onArrivalChanged(value)
                                  ..search();
                              },
                              onSwapButtonTap: () {},
                            ),
                          ),
                          const SizedBox(height: AppDimensions.large),
                          Row(
                            children: [
                              const SizedBox(width: AppDimensions.extraLarge),
                              AvtovasButton.icon(
                                buttonText: state.tripDate?.yMMMdFormat() ??
                                    context.locale.date,
                                svgPath: AppAssets.searchCalendarIcon,
                                sizeBetween: AppDimensions.medium,
                                iconColor:
                                    context.theme.containerBackgroundColor,
                                onTap: () => _showDatePicker(context, cubit),
                              ),
                              const SizedBox(width: AppDimensions.large),
                            ],
                          ),
                          const Spacer(),
                          const SearchHistory(
                            trips: [Mocks.trip, Mocks.trip],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }
}
