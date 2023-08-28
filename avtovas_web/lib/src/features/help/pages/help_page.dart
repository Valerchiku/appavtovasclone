import 'package:avtovas_web/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_web/src/features/help/cubit/help_cubit.dart';
import 'package:avtovas_web/src/features/help/widgets/help_page_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  void _listener(BuildContext context, HelpState state) {
    // TODO(dev): select help item
  }

  bool _listenWhen(HelpState prev, HelpState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<HelpCubit>(
        child: BlocConsumer<HelpCubit, HelpState>(
            listener: _listener,
            listenWhen: _listenWhen,
            builder: (context, state) {
              final cubit = CubitScope.of<HelpCubit>(context);
              return Scaffold(
                appBar: AppBar(),
                body: HelpPageBody(
                  helpCubit: cubit,
                ),
              );
            }
        )
    );
  }
}
