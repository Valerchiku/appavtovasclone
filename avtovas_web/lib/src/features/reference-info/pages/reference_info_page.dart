import 'package:avtovas_web/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_web/src/features/help/cubit/help_cubit.dart';
import 'package:avtovas_web/src/features/reference-info/cubit/reference_info_cubit.dart';
import 'package:avtovas_web/src/features/reference-info/widgets/reference_info_page_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReferenceInfoPage extends StatelessWidget {
  const ReferenceInfoPage({super.key});

  void _listener(BuildContext context, ReferenceInfoState state) {
    // TODO(dev): select help item
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
              final cubit = CubitScope.of<ReferenceInfoCubit>(context);
              return Scaffold(
                appBar: AppBar(),
                body: ReferenceInfoPageBody(
                  referenceInfoCubit: cubit,
                ),
              );
            }
        )
    );
  }
}
