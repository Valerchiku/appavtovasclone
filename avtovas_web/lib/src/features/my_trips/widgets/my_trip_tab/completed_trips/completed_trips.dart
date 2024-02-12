import 'dart:math';

import 'package:avtovas_web/src/common/constants/app_animations.dart';
import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/widgets/pagination/pagination.dart';
import 'package:avtovas_web/src/features/my_trips/widgets/my_trip_status/my_completed_trip.dart';
import 'package:common/avtovas_common.dart';
import 'package:core/avtovas_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CompletedTrips extends StatefulWidget {
  final bool smartLayout;
  final List<StatusedTrip>? trips;
  final MockBooking mockBooking;

  const CompletedTrips({
    required this.smartLayout,
    required this.trips,
    required this.mockBooking,
    super.key,
  });

  @override
  State<CompletedTrips> createState() => _CompletedTripsState();
}

class _CompletedTripsState extends State<CompletedTrips> {
  static const _itemsPerPage = 10;

  var _paginationValue = 1;
  var _shouldShowPaginationAnimation = false;

  void _updatePaginationSublist(int number) {
    if (number == _paginationValue) return;

    setState(() {
      _paginationValue = number;
      _shouldShowPaginationAnimation = true;
    });

    final randomDuration = Random().nextInt(2000) + 200;

    Future.delayed(
      Duration(milliseconds: randomDuration),
      () => setState(() => _shouldShowPaginationAnimation = false),
    );
  }

  int _totalPaginationValues() {
    if (widget.trips == null) return 0;

    return (widget.trips!.length / _itemsPerPage).ceil();
  }

  int _endPaginationIndex() {
    return (_paginationValue * _itemsPerPage) < widget.trips!.length
        ? _paginationValue * _itemsPerPage
        : widget.trips!.length;
  }

  int _startPaginationIndex() => (_paginationValue - 1) * _itemsPerPage;

  @override
  Widget build(BuildContext context) {
    if (widget.trips == null || widget.trips!.isEmpty) {
      return Column(
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.2),
          Center(
            child: Text(
              context.locale.noCompletedTrips,
              style: context.themeData.textTheme.displayMedium?.copyWith(
                color: context.theme.fivefoldTextColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.2),
        ],
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.medium),
      child: Column(
        children: <Widget>[
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 150),
            child: KeyedSubtree(
              key: ValueKey<bool>(_shouldShowPaginationAnimation),
              child: _shouldShowPaginationAnimation
                  ? Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.15,
                        ),
                        Center(
                          child: Lottie.asset(
                            AppLottie.busLoading,
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: <Widget>[
                        ...widget.trips!
                            .sublist(
                              _startPaginationIndex(),
                              _endPaginationIndex(),
                            )
                            .map(
                              (trip) => MyCompletedTrip(
                                key: UniqueKey(),
                                smartLayout: widget.smartLayout,
                                trip: trip,
                              ),
                            ),
                      ].insertBetween(
                        const SizedBox(height: AppDimensions.large),
                      ),
                    ),
            ),
          ),

          /*for (final trip in widget.trips!)
            MyCompletedTrip(
              smartLayout: widget.smartLayout,
              trip: trip,
            ),*/
          const SizedBox(height: AppDimensions.large),
          Pagination(
            availableSources: _totalPaginationValues(),
            onPageChanged: _updatePaginationSublist,
          ),
        ].insertBetween(
          const SizedBox(height: AppDimensions.large),
        ),
      ),
    );
  }
}
