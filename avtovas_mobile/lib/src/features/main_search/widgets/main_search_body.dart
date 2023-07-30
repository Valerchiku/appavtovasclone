import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:avtovas_mobile/src/common/shared_cubit/app_overlay/app_overlay_cubit.dart';
import 'package:avtovas_mobile/src/common/utils/mocks.dart';
import 'package:avtovas_mobile/src/features/main_search/cubit/main_search_cubit.dart';
import 'package:avtovas_mobile/src/features/main_search/widgets/search_history.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class MainSearchBody extends StatefulWidget {
  const MainSearchBody({super.key});

  @override
  State<MainSearchBody> createState() => _MainSearchBodyState();
}

class _MainSearchBodyState extends State<MainSearchBody> {
  final _overlayCubit = i.get<AppOverlayCubit>();

  late final TextEditingController _arrivalController;
  late final TextEditingController _departureController;

  @override
  void initState() {
    super.initState();

    _arrivalController = TextEditingController();
    _departureController = TextEditingController();
  }

  Future<void> _showDatePicker(
    BuildContext context,
    ValueChanged<DateTime> setTripDate,
  ) async {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    _overlayCubit.applyStyle(
      _overlayCubit.state.style!.copyWith(
        systemNavigationBarColor: context.theme.transparent,
      ),
    );

    final now = DateTime.now();

    final tripDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: now.copyWith(month: now.month + 6),
      builder: (context, child) {
        return Theme(
          data: context.themeData.copyWith(
            colorScheme: ColorScheme.dark(
              primary: context.theme.whitespaceContainerColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (tripDate != null) setTripDate(tripDate);

    _overlayCubit.applyPreviousStyle();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
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
        final mainSearchCubit = CubitScope.of<MainSearchCubit>(context);

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
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      const SizedBox(height: kToolbarHeight),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppDimensions.extraLarge,
                        ),
                        child: SearchTripVertical(
                          items: const [],
                          arrivalController: _arrivalController,
                          departureController: _departureController,
                          onChangedArrival: (value) => setState(() {}),
                          onChangedDeparture: (value) => setState(() {}),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(height: AppDimensions.large),
                      Row(
                        children: [
                          const SizedBox(width: AppDimensions.extraLarge),
                          AvtovasButton.icon(
                            buttonText: state.tripDate?.yMMMdFormat() ??
                                context.locale.date,
                            isActive: _departureController.text.isNotEmpty &&
                                _arrivalController.text.isNotEmpty,
                            svgPath: AppAssets.searchCalendarIcon,
                            sizeBetween: AppDimensions.medium,
                            iconColor: _departureController.text.isNotEmpty &&
                                    _arrivalController.text.isNotEmpty
                                ? context.theme.whitespaceContainerColor
                                : context.theme.fivefoldTextColor,
                            onTap: () => _showDatePicker(
                              context,
                              mainSearchCubit.setTripDate,
                            ),
                          ),
                          const SizedBox(width: AppDimensions.large),
                        ],
                      ),
                      const Spacer(),
                      const AvtovasVectorImage(
                        svgAssetPath: AppAssets.mainActovasLogo,
                      ),
                      const Spacer(),
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
  }
}
