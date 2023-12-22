import 'package:avtovas_web/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_web/src/common/widgets/base_page/base_page.dart';
import 'package:avtovas_web/src/features/return_conditions_page/cubit/return_conditions_cubit.dart';
import 'package:avtovas_web/src/features/return_conditions_page/widgets/return_conditions_body.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReturnConditionsPage extends StatelessWidget {
  const ReturnConditionsPage({super.key});

  void _listener(BuildContext context, ReturnConditionsState state) {
    if (state.route.type != null) {
      context.navigateTo(state.route);
    }
  }

  bool _listenWhen(ReturnConditionsState prev, ReturnConditionsState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<ReturnConditionsCubit>(
      child: BlocConsumer<ReturnConditionsCubit, ReturnConditionsState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          // ignore: unused_local_variable
          final cubit = CubitScope.of<ReturnConditionsCubit>(context);

          return BasePageBuilder(
            layoutBuilder: (smartLayout, mobileLayout) {
              return ReturnConditionsBody(
                smartLayout: smartLayout,
              );
            },
          );
        },
      ),
    );
  }
}
