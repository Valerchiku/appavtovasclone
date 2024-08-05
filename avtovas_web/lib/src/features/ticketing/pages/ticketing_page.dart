import 'package:avtovas_web/src/common/constants/app_animations.dart';
import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_web/src/common/widgets/base_page/base_page.dart';
import 'package:avtovas_web/src/features/ticketing/cubit/ticketing_cubit.dart';
import 'package:avtovas_web/src/features/ticketing/widgets/ticketing_body.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:core/domain/entities/single_trip/single_trip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

final class TicketingPage extends StatelessWidget {
  final SingleTrip? trip;

  final String tripId;
  final String departure;
  final String destination;
  final String dbName;

  const TicketingPage({
    required this.trip,
    required this.tripId,
    required this.departure,
    required this.destination,
    required this.dbName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CubitScope<TicketingCubit>(
      child: BlocBuilder<TicketingCubit, TicketingState>(
        builder: (context, state) {
          final cubit = CubitScope.of<TicketingCubit>(context);

          return Stack(
            children: [
              BasePageBuilder(
                layoutBuilder: (smartLayout, __) {
                  return TicketingBody(
                    cubit: cubit,
                    trip: trip,
                    smartLayout: smartLayout,
                    tripId: tripId,
                    departure: departure,
                    destination: destination,
                    dbName: dbName,
                  );
                },
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 150),
                child: state.isLoading
                    ? SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height,
                        child: ColoredBox(
                          color: Colors.black26,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Lottie.asset(
                                AppLottie.busLoading,
                                width: AppDimensions.extraLarge * 3,
                                height: AppDimensions.extraLarge * 3,
                                repeat: true,
                              ),
                            ],
                          ),
                        ),
                      )
                    : null,
              ),
            ],
          );
        },
      ),
    );
  }
}

final class TicketingArguments extends PageArguments {
  final SingleTrip? trip;
  final String tripId;
  final String departure;
  final String destination;
  final String dbName;

  @override
  List<Object?> get props => [
        trip,
        tripId,
        departure,
        destination,
        dbName,
      ];

  TicketingArguments({
    required this.trip,
    required this.tripId,
    required this.departure,
    required this.destination,
    required this.dbName,
  });
}
