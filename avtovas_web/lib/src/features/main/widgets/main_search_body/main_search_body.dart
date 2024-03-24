import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/constants/web_assets.dart';
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
  final bool narrowLayout;
  final MainSearchCubit cubit;

  const MainSearchBody({
    required this.smartLayout,
    required this.mobileLayout,
    required this.narrowLayout,
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
        locale: Locale(context.locale.localeName),
        confirmText: 'НАЙТИ БИЛЕТ',
        builder: (_, child) {
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

  void _resetPage() {
    _departureController.clear();
    _arrivalController.clear();
  }

  void _onSwap(MainSearchCubit cubit) {
    cubit
      ..onDepartureChanged(_departureController.text)
      ..onArrivalChanged(_arrivalController.text)
      ..search(_resetPage);
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
              buttonText:
                  state.tripDate?.yMMMdFormat(context.locale.localeName) ??
                      context.locale.date,
              arrivalController: _arrivalController,
              departureController: _departureController,
              onChangedArrival: (value) => widget.cubit.onArrivalChanged(value),
              onChangedDeparture: (value) =>
                  widget.cubit.onDepartureChanged(value),
              search: () => widget.cubit.search(_resetPage),
              onSwapTap: () => _onSwap(widget.cubit),
              smartLayout: widget.smartLayout,
              suggestions: state.suggestions,
              // onDateTap: () => _showDatePicker(context, widget.cubit),
              onDateTap: () => _showDatePicker(context, widget.cubit),
            ),
            const SizedBox(height: AppDimensions.rootPaddingTop),
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
            const SizedBox(height: AppDimensions.rootPaddingTop),
            Text(
              'Популярные направления',
              style: context.themeData.textTheme.headlineLarge?.copyWith(
                color: context.theme.defaultIconColor,
                fontSize: WebFonts.sizeDisplayMedium,
                fontWeight: WebFonts.weightBold,
              ),
            ),
            const SizedBox(height: AppDimensions.large),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.medium,
              ),
              child: widget.mobileLayout == true || widget.narrowLayout == true
                  ? Column(
                      children: [
                        PopularRouteWidget(
                          title: 'из Чебоксар',
                          routes: [
                            PopularRoute(
                              departure: 'Чебоксары',
                              destination: 'Москва',
                              price: '1300',
                              onTap: () => widget.cubit.searchByPopularRoute(
                                departure: 'Чебоксары Центральный АВ',
                                arrival: 'Москва АС Центральная',
                                onReset: _resetPage,
                              ),
                            ),
                            PopularRoute(
                              departure: 'Чебоксары',
                              destination: 'Казань',
                              price: '650',
                              onTap: () => widget.cubit.searchByPopularRoute(
                                departure: 'Чебоксары Центральный АВ',
                                arrival: 'Казань АВ на ЖДВ "Восстание"',
                                onReset: _resetPage,
                              ),
                            ),
                            PopularRoute(
                              departure: 'Чебоксары',
                              destination: 'Саранск',
                              price: '1150',
                              onTap: () => widget.cubit.searchByPopularRoute(
                                departure: 'Чебоксары Центральный АВ',
                                arrival: 'Саранск АВ',
                                onReset: _resetPage,
                              ),
                            ),
                            PopularRoute(
                              departure: 'Чебоксары',
                              destination: 'Йошкар-Ола',
                              price: '350',
                              onTap: () => widget.cubit.searchByPopularRoute(
                                departure: 'Чебоксары Центральный АВ',
                                arrival: 'Йошкар-Ола АВ',
                                onReset: _resetPage,
                              ),
                            ),
                          ],
                          isMobile: widget.mobileLayout,
                        ),
                        const SizedBox(height: AppDimensions.extraLarge),
                        PopularRouteWidget(
                          title: 'из Чебоксар',
                          routes: [
                            PopularRoute(
                              departure: 'Чебоксары',
                              destination: 'Ульяновск',
                              price: '1015',
                              onTap: () => widget.cubit.searchByPopularRoute(
                                departure: 'Чебоксары Центральный АВ',
                                arrival: 'Ульяновск Центральный АВ',
                                onReset: _resetPage,
                              ),
                            ),
                            PopularRoute(
                              departure: 'Чебоксары',
                              destination: 'Дзержинкс',
                              price: '900',
                              onTap: () => widget.cubit.searchByPopularRoute(
                                departure: 'Чебоксары Центральный АВ',
                                arrival: 'Дзержинск АВ',
                                onReset: _resetPage,
                              ),
                            ),
                            PopularRoute(
                              departure: 'Чебоксары',
                              destination: 'Ардатов',
                              price: '700',
                              onTap: () => widget.cubit.searchByPopularRoute(
                                departure: 'Чебоксары Центральный АВ',
                                arrival: 'Ардатов',
                                onReset: _resetPage,
                              ),
                            ),
                            PopularRoute(
                              departure: 'Чебоксары',
                              destination: 'Пенза',
                              price: '1800',
                              onTap: () => widget.cubit.searchByPopularRoute(
                                departure: 'Чебоксары Центральный АВ',
                                arrival: 'Пенза',
                                onReset: _resetPage,
                              ),
                            ),
                          ],
                          isMobile: widget.mobileLayout,
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PopularRouteWidget(
                          title: 'из Чебоксар',
                          routes: [
                            PopularRoute(
                              departure: 'Чебоксары',
                              destination: 'Москва',
                              price: '1300',
                              onTap: () => widget.cubit.searchByPopularRoute(
                                departure: 'Чебоксары Центральный АВ',
                                arrival: 'Москва АС Центральная',
                                onReset: _resetPage,
                              ),
                            ),
                            PopularRoute(
                              departure: 'Чебоксары',
                              destination: 'Казань',
                              price: '650',
                              onTap: () => widget.cubit.searchByPopularRoute(
                                departure: 'Чебоксары Центральный АВ',
                                arrival: 'Казань АВ на ЖДВ "Восстание"',
                                onReset: _resetPage,
                              ),
                            ),
                            PopularRoute(
                              departure: 'Чебоксары',
                              destination: 'Саранск',
                              price: '1150',
                              onTap: () => widget.cubit.searchByPopularRoute(
                                departure: 'Чебоксары Центральный АВ',
                                arrival: 'Саранск АВ',
                                onReset: _resetPage,
                              ),
                            ),
                            PopularRoute(
                              departure: 'Чебоксары',
                              destination: 'Йошкар-Ола',
                              price: '350',
                              onTap: () => widget.cubit.searchByPopularRoute(
                                departure: 'Чебоксары Центральный АВ',
                                arrival: 'Йошкар-Ола АВ',
                                onReset: _resetPage,
                              ),
                            ),
                          ],
                          isMobile: widget.mobileLayout,
                        ),
                        const SizedBox(width: AppDimensions.medium),
                        PopularRouteWidget(
                          title: 'из Чебоксар',
                          routes: [
                            PopularRoute(
                              departure: 'Чебоксары',
                              destination: 'Ульяновск',
                              price: '1015',
                              onTap: () => widget.cubit.searchByPopularRoute(
                                departure: 'Чебоксары Центральный АВ',
                                arrival: 'Ульяновск Центральный АВ',
                                onReset: _resetPage,
                              ),
                            ),
                            PopularRoute(
                              departure: 'Чебоксары',
                              destination: 'Дзержинск',
                              price: '900',
                              onTap: () => widget.cubit.searchByPopularRoute(
                                departure: 'Чебоксары Центральный АВ',
                                arrival: 'Дзержинск АВ',
                                onReset: _resetPage,
                              ),
                            ),
                            PopularRoute(
                              departure: 'Чебоксары',
                              destination: 'Ардатов',
                              price: '700',
                              onTap: () => widget.cubit.searchByPopularRoute(
                                departure: 'Чебоксары Центральный АВ',
                                arrival: 'Ардатов',
                                onReset: _resetPage,
                              ),
                            ),
                            PopularRoute(
                              departure: 'Чебоксары',
                              destination: 'Пенза',
                              price: '1800',
                              onTap: () => widget.cubit.searchByPopularRoute(
                                departure: 'Чебоксары Центральный АВ',
                                arrival: 'Пенза',
                                onReset: _resetPage,
                              ),
                            ),
                          ],
                          isMobile: widget.mobileLayout,
                        ),
                      ],
                    ),
            ),
            const SizedBox(height: AppDimensions.extraLarge),
          ],
        );
      },
    );
  }
}

class _AdaptiveSelectionGrid extends StatelessWidget {
  final List<Widget> children;

  const _AdaptiveSelectionGrid({required this.children});

  int getCrossAxisCount(double maxWidth) {
    if (maxWidth > AppDimensions.maxNonSmartWidth) {
      return 4;
    } else if (maxWidth < AppDimensions.maxNonSmartWidth &&
        maxWidth > AppDimensions.maxMobileWidth) {
      return 2;
    } else {
      return 1;
    }
  }

  double getChildAspectRatio(double maxWidth) {
    if (maxWidth > AppDimensions.maxNonSmartWidth) {
      return 1000;
    } else if (maxWidth < AppDimensions.maxNonSmartWidth &&
        maxWidth > AppDimensions.maxMobileWidth) {
      return 500;
    } else {
      return 200;
    }
  }

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.sizeOf(context).width;

    return GridView.count(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.medium),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      childAspectRatio: maxWidth / getChildAspectRatio(maxWidth),
      crossAxisCount: getCrossAxisCount(maxWidth),
      crossAxisSpacing: AppDimensions.medium,
      children: children,
    );
  }
}
