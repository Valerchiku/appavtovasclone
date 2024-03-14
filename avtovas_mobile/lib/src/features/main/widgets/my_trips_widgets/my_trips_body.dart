import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/utils/mocks.dart';
import 'package:avtovas_mobile/src/common/widgets/support_methods/support_methods.dart';
import 'package:avtovas_mobile/src/features/main/cubit/my_trips_cubit/my_trips_cubit.dart';
import 'package:avtovas_mobile/src/features/main/widgets/my_trips_widgets/my_trip_tabs/archive_trips.dart';
import 'package:avtovas_mobile/src/features/main/widgets/my_trips_widgets/my_trip_tabs/completed_trips.dart';
import 'package:avtovas_mobile/src/features/main/widgets/my_trips_widgets/my_trip_tabs/refund_trips.dart';
import 'package:avtovas_mobile/src/features/main/widgets/my_trips_widgets/my_trip_tabs/upcoming_trips.dart';
import 'package:avtovas_mobile/src/features/main/widgets/my_trips_widgets/payment_confirm_view.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyTripsBody extends StatefulWidget {
  final ValueChanged<bool> loadingStatusChanged;

  const MyTripsBody({required this.loadingStatusChanged, super.key});

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

  Future<void> _showPageErrorDialog(
    BuildContext context,
    bool forPayment,
  ) async {
    if (!context.mounted) return;

    return SupportMethods.showAvtovasDialog(
      context: context,
      builder: (_) {
        return AvtovasAlertDialog(
          title: forPayment
              ? 'Ошибка во время платежа.\nПлатёж не принят.'
              : 'Ошибка во время возврата!\nВозврат не принят',
          withCancel: false,
        );
      },
    );
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

          if (state.nowUtc == null || state.pageLoading) {
            return Center(
              child: state.transparentPageLoading
                  ? null
                  : const CupertinoActivityIndicator(),
            );
          }

          if (state.paymentConfirmationUrl.isNotEmpty) {
            return PaymentConfirmView(
              onConfirmPressed: () => cubit.confirmProcessPassed(
                () => _showPageErrorDialog(context, true),
                widget.loadingStatusChanged,
              ),
              confirmationUrl: state.paymentConfirmationUrl,
            );
          }

          return Stack(
            children: [
              Column(
                children: [
                  TabBar(
                    tabAlignment: TabAlignment.start,
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
                      children: [
                        UpcomingTrips(
                          cubit: cubit,
                          onErrorAction: (fromPayment) => _showPageErrorDialog(
                            context,
                            fromPayment,
                          ),
                          updatePageLoadingStatus: widget.loadingStatusChanged,
                        ),
                        CompletedTrips(
                          trips: state.finishedStatusedTrips,
                          mockBooking: Mocks.booking,
                        ),
                        ArchiveTrips(
                          onRemoveButtonTap: cubit.removeTripFromArchive,
                          clearArchive: cubit.clearArchive,
                          trips: state.archiveStatusedTrips,
                        ),
                        RefundTrips(
                          cubit: cubit,
                          trips: state.declinedStatusedTrips,
                          mockBooking: Mocks.booking,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
