import 'package:avtovas_web/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_web/src/common/widgets/base_page/base_page.dart';
import 'package:avtovas_web/src/features/return_condition/cubit/return_condition_cubit.dart';
import 'package:avtovas_web/src/features/return_condition/widget/return_condition_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReturnConditionPage extends StatelessWidget {
  const ReturnConditionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitScope<ReturnConditionCubit>(
      child: BlocBuilder<ReturnConditionCubit, ReturnConditionState>(
        builder: (context, state) {
          return BasePageBuilder(
            layoutBuilder: (smartLayout, mobileLayout) {
              return ReturnConditionBody(
                smartLayout: smartLayout,
              );
            },
          );
        },
      ),
    );
  }
}
