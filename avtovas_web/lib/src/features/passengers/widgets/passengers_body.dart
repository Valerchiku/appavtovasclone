import 'dart:async';

import 'package:avtovas_web/src/features/passengers/cubit/passengers_cubit.dart';
import 'package:avtovas_web/src/features/passengers/widgets/passenger_container.dart';
import 'package:avtovas_web/src/features/passengers/widgets/passengers_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_html/html.dart' as html;

class PassengersBody extends StatefulWidget {
  final PassengersCubit cubit;

  const PassengersBody({
    required this.cubit,
    super.key,
  });

  @override
  State<PassengersBody> createState() => _PassengersBodyState();
}

class _PassengersBodyState extends State<PassengersBody> {
  late final StreamSubscription<html.PopStateEvent> _popSubscription;

  @override
  void initState() {
    super.initState();

    _popSubscription = html.window.onPopState.listen(
      (_) {
        if (widget.cubit.state.canRenderFillContainer) {
          widget.cubit
            ..savePassengerRoute()
            ..changeFillRenderStatus();
        }
      },
    );
  }

  @override
  void dispose() {
    _popSubscription.cancel();

    print('dispose');

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PassengersCubit, PassengersState>(
      bloc: widget.cubit,
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: KeyedSubtree(
            key: ValueKey<bool>(state.canRenderFillContainer),
            child: state.canRenderFillContainer
                ? PassengerContainer(
                    state: state,
                    onClose: () {},
                    updatePassengers: state.isNewPassenger
                        ? widget.cubit.addPassenger
                        : widget.cubit.updatePassenger,
                    removePassenger: state.isNewPassenger
                        ? null
                        : widget.cubit.removePassenger,
                    onSurnameVisibleChanged: (value) =>
                        widget.cubit.changeSurnameVisibility(
                      noSurname: value,
                    ),
                    onPassengerChanged: widget.cubit.changeCurrentPassenger,
                  )
                : PassengersList(
                    cubit: widget.cubit,
                    onPassengerTap: (passenger) => widget.cubit
                      ..changePassengerStatus(isNewPassenger: false)
                      ..setExistentPassenger(passenger)
                      ..changeFillRenderStatus(),
                  ),
          ),
        );
      },
    );
  }
}
