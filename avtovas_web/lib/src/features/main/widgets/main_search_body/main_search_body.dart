// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:avtovas_web/src/common/constants/web_assets.dart';
import 'package:avtovas_web/src/common/constants/web_dimensions.dart';
import 'package:avtovas_web/src/common/constants/web_fonts.dart';
import 'package:avtovas_web/src/common/widgets/avtovas_search_trip/avtovas_search_trip.dart';
import 'package:avtovas_web/src/features/main/cubit/main_search_cubit.dart';
import 'package:avtovas_web/src/features/main/widgets/popular_route/popular_route.dart';
import 'package:avtovas_web/src/features/main/widgets/selection_info_widget/selection_info_widget.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_utils_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainSearchBody extends StatefulWidget {
  final bool smartLayout;
  final bool mobileLayout;
  final MainSearchCubit cubit;

  const MainSearchBody({
    required this.smartLayout,
    required this.mobileLayout,
    required this.cubit,
    super.key,
  });

  @override
  State<MainSearchBody> createState() => _MainSearchBodyState();
}

class _MainSearchBodyState extends State<MainSearchBody> {
  late final TextEditingController _departureController;
  late final TextEditingController _arrivalController;

  @override
  void initState() {
    super.initState();
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
        builder: (context, child) {
          return Theme(
            data: context.themeData.copyWith(
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
      cubit.setTripDate(tripDate);
      // ..search(_resetPage);
    }
  }

  void _onSwap(MainSearchCubit cubit) {
    cubit
      ..onDepartureChanged(_departureController.text)
      ..onArrivalChanged(_arrivalController.text);
  }

  @override
  void dispose() {
    _arrivalController.dispose();
    _departureController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainSearchCubit, MainSearchState>(
      builder: (context, state) {
        return Column(
          children: [
            AvtovasSearchTrip(
              arrivalController: _arrivalController,
              departureController: _departureController,
              onChangedArrival: (value) => widget.cubit.onArrivalChanged(value),
              onChangedDeparture: (value) =>
                  widget.cubit.onDepartureChanged(value),
              onSwapTap: () => _onSwap(widget.cubit),
              smartLayout: widget.smartLayout,
              suggestions: state.suggestions,
              onDateTap: () => _showDatePicker(context, widget.cubit),
            ),
            const SizedBox(height: WebDimensions.rootPaddingTop),
            Text(
              'Почему стоит выбрать АвтоВАС?',
              style: context.themeData.textTheme.headlineLarge?.copyWith(
                color: context.theme.defaultIconColor,
                fontSize: WebFonts.sizeDisplayMedium,
                fontWeight: WebFonts.weightBold,
              ),
            ),
            const _AdaptiveSelectionGrid(
              children: [
                SelectionWidget(
                  vectorImagePath: WebAssets.clockIcon,
                  title: 'Без касс и очередей',
                  description:
                      'Билеты онлайн в любое время на сайте и в приложении',
                ),
                SelectionWidget(
                  vectorImagePath: WebAssets.roadIcon,
                  title: '50 000 направлений',
                  description:
                      'Рейтинг рейсов перевозчиков по отзывам пассажиров',
                ),
                SelectionWidget(
                  vectorImagePath: WebAssets.cardIcon,
                  title: 'Безопасная оплата',
                  description:
                      // ignore: lines_longer_than_80_chars,
                      'Стандарты безопасности PCI DSS для защиты платежных данных',
                ),
                SelectionWidget(
                  vectorImagePath: WebAssets.returnIcon,
                  title: 'Возврат билетов',
                  description: 'Быстрое оформление возврата в личном кабинете',
                ),
              ],
            ),
            const SizedBox(height: WebDimensions.rootPaddingTop),
            Text(
              'Популярные направления',
              style: context.themeData.textTheme.headlineLarge?.copyWith(
                color: context.theme.defaultIconColor,
                fontSize: WebFonts.sizeDisplayMedium,
                fontWeight: WebFonts.weightBold,
              ),
            ),
            const SizedBox(height: WebDimensions.large),
            _AdaptivePopularRouteGrid(
              children: [
                PopularRoute(
                  title: 'из Чебоксар',
                  routes: [
                    'Чебоксары → Йошкар-Ола',
                    'Чебоксары → Казань',
                    'Чебоксары → Канаш',
                    'Чебоксары → Пенза',
                  ],
                  isMobile: widget.mobileLayout,
                ),
                PopularRoute(
                  title: 'в Чебоксары',
                  routes: [
                    'Йошкар-Ола → Чебоксары',
                    'Казань → Чебоксары',
                    'Канаш → Чебоксары',
                    'Пенза → Чебоксары',
                  ],
                  isMobile: widget.mobileLayout,
                ),
                PopularRoute(
                  title: 'из Йошкар-Ола',
                  routes: [
                    'Йошкар-Ола → Чебоксары',
                    'Йошкар-Ола → Канаш',
                    'Йошкар-Ола → Пенза',
                    'Йошкар-Ола → Саратов',
                  ],
                  isMobile: widget.mobileLayout,
                ),
                PopularRoute(
                  title: 'в Йошкар-Ола',
                  routes: [
                    'Чебоксары → Йошкар-Ола',
                    'Казань → Йошкар-Ола',
                    'Канаш → Йошкар-Ола',
                    'Пенза → Йошкар-Ола',
                  ],
                  isMobile: widget.mobileLayout,
                ),
              ],
            ),
            const SizedBox(height: WebDimensions.extraLarge),
          ],
        );
      },
    );
  }
}

class _AdaptiveSelectionGrid extends StatelessWidget {
  final List<Widget> children;

  const _AdaptiveSelectionGrid({required this.children});

  int getCrossAxisCount(BoxConstraints constraints) {
    final maxWidth = constraints.maxWidth;
    if (maxWidth > WebDimensions.maxNonSmartWidth) {
      return 4;
    } else if (maxWidth < WebDimensions.maxNonSmartWidth &&
        maxWidth > WebDimensions.maxMobileWidth) {
      return 2;
    } else {
      return 1;
    }
  }

  double getChildAspectRatio(BoxConstraints constraints) {
    final maxWidth = constraints.maxWidth;
    if (maxWidth > WebDimensions.maxNonSmartWidth) {
      return 1000;
    } else if (maxWidth < WebDimensions.maxNonSmartWidth &&
        maxWidth > WebDimensions.maxMobileWidth) {
      return 500;
    } else {
      return 200;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        return GridView.count(
          padding: const EdgeInsets.only(
            left: WebDimensions.extraLarge,
            right: WebDimensions.extraLarge,
          ),
          shrinkWrap: true,
          childAspectRatio: maxWidth / getChildAspectRatio(constraints),
          crossAxisCount: getCrossAxisCount(constraints),
          crossAxisSpacing: WebDimensions.medium,
          children: children,
        );
      },
    );
  }
}

class _AdaptivePopularRouteGrid extends StatelessWidget {
  final List<Widget> children;

  const _AdaptivePopularRouteGrid({required this.children});

  int getCrossAxisCount(BoxConstraints constraints) {
    final maxWidth = constraints.maxWidth;
    if (maxWidth > WebDimensions.maxNonSmartWidth) {
      return 4;
    } else if (maxWidth < WebDimensions.maxNonSmartWidth &&
        maxWidth > WebDimensions.maxMobileWidth) {
      return 2;
    } else {
      return 1;
    }
  }

  double getChildAspectRatio(BoxConstraints constraints) {
    final maxWidth = constraints.maxWidth;
    if (maxWidth > WebDimensions.maxNonSmartWidth) {
      return 1400;
    } else if (maxWidth < WebDimensions.maxNonSmartWidth &&
        maxWidth > WebDimensions.maxMobileWidth) {
      return 400;
    } else {
      return 300;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        return GridView.count(
          padding: const EdgeInsets.only(
            left: WebDimensions.extraLarge,
            right: WebDimensions.extraLarge,
          ),
          shrinkWrap: true,
          childAspectRatio: maxWidth / getChildAspectRatio(constraints),
          crossAxisCount: getCrossAxisCount(constraints),
          crossAxisSpacing: WebDimensions.medium,
          children: children,
        );
      },
    );
  }
}
