import 'package:avtovas_web/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_web/src/common/widgets/base_page/base_page.dart';
import 'package:avtovas_web/src/features/trip-details/cubit/trip_details_cubit.dart';
import 'package:avtovas_web/src/features/trip-details/widgets/trip_details_body.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class TripDetailsPage extends StatelessWidget {
  final String tripId;
  final String departure;
  final String destination;
  final String dbName;

  const TripDetailsPage({
    required this.tripId,
    required this.departure,
    required this.destination,
    required this.dbName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CubitScope<TripDetailsCubit>(
      child: BlocBuilder<TripDetailsCubit, TripDetailsState>(
        builder: (context, state) {
          final cubit = CubitScope.of<TripDetailsCubit>(context);

          return BasePageBuilder(
            layoutBuilder: (smartLayout, __) {
              return TripDetailsBody(
                tripId: tripId,
                departure: departure,
                destination: destination,
                smartLayout: smartLayout,
                dbName: dbName,
                cubit: cubit,
              );
            },
          );
        },
      ),
    );
  }
}

final class TripDetailsArguments extends PageArguments {
  final String routeId;
  final String departure;
  final String destination;
  final String dbName;

  @override
  List<Object?> get props => [
        routeId,
        departure,
        destination,
        dbName,
      ];

  TripDetailsArguments({
    required this.routeId,
    required this.departure,
    required this.destination,
    required this.dbName,
  });
}
