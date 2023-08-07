import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:avtovas_mobile/src/common/utils/mocks.dart';
import 'package:avtovas_mobile/src/features/main/widgets/my_trips_widgets/my_trip_tabs/archive_trips.dart';
import 'package:avtovas_mobile/src/features/main/widgets/my_trips_widgets/my_trip_tabs/completed_trips.dart';
import 'package:avtovas_mobile/src/features/main/widgets/my_trips_widgets/my_trip_tabs/refund_trips.dart';
import 'package:avtovas_mobile/src/features/main/widgets/my_trips_widgets/my_trip_tabs/upcoming_trips.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class MyTripsBody extends StatefulWidget {
  const MyTripsBody({super.key});

  @override
  State<MyTripsBody> createState() => _MyTripsBodyState();
}

class _MyTripsBodyState extends State<MyTripsBody>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    const tabLength = 4;
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
          isScrollable: true,
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
              text: context.locale.completed,
            ),
            Tab(
              text: context.locale.archived,
            ),
            Tab(
              text: context.locale.refund,
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
                mockBooking: Mocks.booking,
                trips: ['some data', 'some data'],
              ),
              CompletedTrips(
                // Параметры чисто для проверки
                mockTrip: Mocks.trip,
                mockBooking: Mocks.booking,
                trips: ['some data'],
              ),
              ArchiveTrips(
                // Параметры чисто для проверки
                mockTrip: Mocks.trip,
                mockBooking: Mocks.booking,
                trips: ['some data', 'some data'],
              ),
              RefundTrips(
                // Параметры чисто для проверки
                mockTrip: Mocks.trip,
                mockBooking: Mocks.booking,
                trips: ['some data'],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
