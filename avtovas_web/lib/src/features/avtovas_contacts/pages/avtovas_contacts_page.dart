import 'package:avtovas_web/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_web/src/common/widgets/base_page/base_page.dart';
import 'package:avtovas_web/src/features/avtovas_contacts/cubit/avtovas_contacts_cubit.dart';
import 'package:avtovas_web/src/features/avtovas_contacts/widgets/avtovas_contacts_body.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AvtovasContactsPage extends StatelessWidget {
  const AvtovasContactsPage({super.key});

  void _listener(BuildContext context, AvtovasContactsState state) {
    if (state.route.type != null) {
      context.navigateTo(state.route);
    }
  }

  bool _listenWhen(AvtovasContactsState prev, AvtovasContactsState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<AvtovasContactsCubit>(
      child: BlocConsumer<AvtovasContactsCubit, AvtovasContactsState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, _) {
          // ignore: unused_local_variable
          final cubit = CubitScope.of<AvtovasContactsCubit>(context);

          return BasePageBuilder(
            layoutBuilder: (smartLayout, mobileLayout) {
              return AvtovasContactsBody(
                cubit: cubit,
                smartLayout: smartLayout,
                mobileLayout: mobileLayout,
              );
            },
          );
        },
      ),
    );
  }
}
