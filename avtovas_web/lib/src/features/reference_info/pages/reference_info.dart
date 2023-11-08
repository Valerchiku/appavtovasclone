// ignore: implementation_imports

import 'package:avtovas_web/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_web/src/common/widgets/base_page/base_page.dart';
import 'package:avtovas_web/src/features/reference_info/cubit/reference_info_cubit.dart';
import 'package:avtovas_web/src/features/reference_info/widgets/reference_info_body.dart';

import 'package:common/avtovas_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReferencePageInfoPage extends StatelessWidget {
  const ReferencePageInfoPage({super.key});

  void _listener(BuildContext context, ReferenceInfoState state) {
    if (state.route.type != null) {
      context.navigateTo(state.route);
    }
  }

  bool _listenWhen(ReferenceInfoState prev, ReferenceInfoState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<ReferenceInfoCubit>(
      child: BlocConsumer<ReferenceInfoCubit, ReferenceInfoState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          // ignore: unused_local_variable
          final cubit = CubitScope.of<ReferenceInfoCubit>(context);

          return BasePageBuilder(
            layoutBuilder: (smartLayout, mobileLayout) {
              return ReferenceInfoBody(
                smartLayout: smartLayout,
              );
            },
          );
        },
      ),
    );
  }
}
