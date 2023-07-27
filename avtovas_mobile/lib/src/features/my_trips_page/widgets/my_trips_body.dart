import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:avtovas_mobile/src/common/utils/mocks.dart';
import 'package:avtovas_mobile/src/features/my_trips_page/widgets/history_trips.dart';
import 'package:avtovas_mobile/src/features/my_trips_page/widgets/upcoming_trips.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class MyTripsBody extends StatefulWidget {
  const MyTripsBody({super.key});

  @override
  State<MyTripsBody> createState() => _MyTripsBodyState();
}

class _MyTripsBodyState extends State<MyTripsBody>
    with TickerProviderStateMixin {
  static const tabLength = 2;
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabLength, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorPath = context.theme;
    final themePath = context.themeData.textTheme;
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          dividerColor: colorPath.transparent,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: colorPath.mainAppColor,
          labelColor: colorPath.secondaryTextColor,
          labelStyle: themePath.headlineMedium?.copyWith(
            fontWeight: AppFonts.weightRegular,
          ),
          unselectedLabelColor: colorPath.quaternaryTextColor,
          unselectedLabelStyle: themePath.headlineMedium?.copyWith(
            fontWeight: AppFonts.weightRegular,
          ),
          indicatorWeight: 1,
          tabs: [
            Tab(
              text: context.locale.upcoming,
            ),
            Tab(
              text: context.locale.history,
            ),
          ],
        ),
        Flexible(
          child: TabBarView(
            controller: _tabController,
            children: const [
              UpcomingTrips(
                // Параметры чисто для проверки
                mockTrip: Mocks.trip,
                isAuthorized: true,
                trips: ['some data'],
              ),
              HistoryTrips(
                // Параметры чисто для проверки
                mockTrip: Mocks.trip,
                isAuthorized: true,
                trips: ['some data'],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
