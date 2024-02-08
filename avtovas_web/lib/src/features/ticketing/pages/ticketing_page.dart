import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_web/src/common/widgets/base_page/base_page.dart';
import 'package:avtovas_web/src/features/ticketing/cubit/ticketing_cubit.dart';
import 'package:avtovas_web/src/features/ticketing/widgets/ticketing_body.dart';
import 'package:avtovas_web/src/features/ticketing/widgets/ticketing_shimmer_content.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:core/domain/entities/single_trip/single_trip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class TicketingPage extends StatelessWidget {
  final SingleTrip? trip;

  final String tripId;
  final String departure;
  final String destination;

  const TicketingPage({
    required this.trip,
    required this.tripId,
    required this.departure,
    required this.destination,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CubitScope<TicketingCubit>(
      child: BlocBuilder<TicketingCubit, TicketingState>(
        builder: (context, __) {
          final cubit = CubitScope.of<TicketingCubit>(context);

          return BasePageBuilder(
            layoutBuilder: (smartLayout, __) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.large,
                ),
                child: TicketingBody(
                  cubit: cubit,
                  trip: trip,
                  smartLayout: smartLayout,
                  tripId: tripId,
                  departure: departure,
                  destination: destination,
                ),
              );
            },
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

  @override
  List<Object?> get props => [
        trip,
        tripId,
        departure,
        destination,
      ];

  TicketingArguments({
    required this.trip,
    required this.tripId,
    required this.departure,
    required this.destination,
  });
}
