import 'package:avtovas_web/src/common/constants/web_fonts.dart';
import 'package:avtovas_web/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_web/src/common/utils/mocks.dart';
import 'package:avtovas_web/src/common/widgets/base_page/base_page.dart';
import 'package:avtovas_web/src/features/my_trips/cubit/my_trips_cubit.dart';
import 'package:avtovas_web/src/features/my_trips/widgets/my_trip_tab/archive_trips/archive_trips.dart';
import 'package:avtovas_web/src/features/my_trips/widgets/my_trip_tab/completed_trips/completed_trips.dart';
import 'package:avtovas_web/src/features/my_trips/widgets/my_trip_tab/refund_trips/refund_trips.dart';
import 'package:avtovas_web/src/features/my_trips/widgets/my_trip_tab/upcoming_trips/upcoming_trips.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyTripsPage extends StatefulWidget {
  const MyTripsPage({super.key});

  @override
  State<MyTripsPage> createState() => _MyTripsPageState();
}

class _MyTripsPageState extends State<MyTripsPage>
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
    return CubitScope<MyTripsCubit>(
      child: BlocBuilder<MyTripsCubit, MyTripsState>(
        builder: (context, state) {
          final cubit = CubitScope.of<MyTripsCubit>(context);
          return BasePageBuilder(
            layoutBuilder: (smartLayout, mobileLayout) {
              return Column(
                children: [
                  TabBar(
                    // ignore: avoid_bool_literals_in_conditional_expressions
                    isScrollable: smartLayout ? true : false,
                    controller: _tabController,
                    dividerColor: colorPath.transparent,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: colorPath.mainAppColor,
                    labelColor: colorPath.secondaryTextColor,
                    labelStyle: themePath.headlineMedium?.copyWith(
                      fontWeight: WebFonts.weightRegular,
                    ),
                    unselectedLabelColor: colorPath.quaternaryTextColor,
                    unselectedLabelStyle: themePath.headlineMedium?.copyWith(
                      fontWeight: WebFonts.weightRegular,
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
                      children: [
                        UpcomingTrips(
                          smartLayout: smartLayout,
                          cubit: cubit,
                        ),
                        CompletedTrips(
                          smartLayout: smartLayout,
                          trips: state.finishedStatusedTrips,
                          mockBooking: Mocks.booking,
                        ),
                        ArchiveTrips(
                          smartLayout: smartLayout,
                          trips: state.archiveStatusedTrips,
                          mockBooking: Mocks.booking,
                        ),
                        RefundTrips(
                          smartLayout: smartLayout,
                          trips: state.declinedStatusedTrips,
                          mockBooking: Mocks.booking,
                        ),
                      ],
                    ),
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
