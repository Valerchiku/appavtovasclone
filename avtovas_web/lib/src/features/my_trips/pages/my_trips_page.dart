import 'package:avtovas_web/src/common/constants/app_animations.dart';
import 'package:avtovas_web/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_web/src/common/widgets/base_page/base_page.dart';
import 'package:avtovas_web/src/features/my_trips/cubit/my_trips_cubit.dart';
import 'package:avtovas_web/src/features/my_trips/widgets/my_trips_body.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class MyTripsPage extends StatelessWidget {
  final String statusedTripId;
  final String paymentId;

  const MyTripsPage({
    required this.statusedTripId,
    required this.paymentId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CubitScope<MyTripsCubit>(
      child: BlocBuilder<MyTripsCubit, MyTripsState>(
        builder: (context, state) {
          return Stack(
            children: [
              BasePageBuilder(
                layoutBuilder: (smartLayout, mobileLayout) {
                  final cubit = CubitScope.of<MyTripsCubit>(context);

                  return MyTripsBody(
                    cubit: cubit,
                    smartLayout: smartLayout,
                    paymentId: paymentId,
                    statusedTripId: statusedTripId,
                  );
                },
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: state.shouldShowTranslucentLoadingAnimation
                    ? SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height,
                        child: ColoredBox(
                          color: Colors.black26,
                          child: Center(
                            child: Lottie.asset(
                              AppLottie.busLoading,
                              width: 100,
                               height: 100,
                            ),
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

final class MyTripsArguments extends PageArguments {
  final String statusedTripId;
  final String paymentId;

  MyTripsArguments({
    required this.statusedTripId,
    required this.paymentId,
  });

  @override
  List<Object?> get props => [statusedTripId, paymentId];
}
