import 'dart:math';

import 'package:avtovas_web/src/common/constants/app_animations.dart';
import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/widgets/pagination/pagination.dart';
import 'package:avtovas_web/src/features/my_trips/widgets/my_trip_status/my_expired_trip.dart';
import 'package:common/avtovas_common.dart';
import 'package:core/avtovas_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ArchiveTrips extends StatefulWidget {
  final bool smartLayout;
  final List<StatusedTrip>? trips;
  final ValueSetter<String> onRemoveButtonTap;

  const ArchiveTrips({
    required this.smartLayout,
    required this.trips,
    required this.onRemoveButtonTap,
    super.key,
  });

  @override
  State<ArchiveTrips> createState() => _ArchiveTripsState();
}

class _ArchiveTripsState extends State<ArchiveTrips> {
  static const _itemsPerPage = 4;

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
              'Архив пуст',
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
                              (trip) => MyExpiredTrip(
                                trip: trip,
                                onRemoveButtonTap: widget.onRemoveButtonTap,
                              ),
                            ),
                      ].insertBetween(
                        const SizedBox(height: AppDimensions.large),
                      ),
                    ),
            ),
          ),
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
