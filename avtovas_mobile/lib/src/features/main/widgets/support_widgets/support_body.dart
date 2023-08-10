import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/features/support/cubit/support_cubit.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class SupportBody extends StatelessWidget {
  const SupportBody({super.key});

  void _listener(BuildContext context, SupportState state) {
    if (state.route.type != null) {
      context.navigateTo(state.route);
    }
  }

  bool _listenWhen(SupportState prev, SupportState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<SupportCubit>(
        child: BlocConsumer<SupportCubit, SupportState>(
            listener: _listener,
            listenWhen: _listenWhen,
            builder: (context, state) {
              final cubit = CubitScope.of<SupportCubit>(context);

              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.large,
                  vertical: AppDimensions.large,
                ),
                child: Column(
                  children: [
                    PageOptionTile(
                      title: context.locale.inquiry,
                      onTap: cubit.onCallButtonTap,
                    ),
                    PageOptionTile(
                      title: context.locale.directoryInfo,
                      onTap: cubit.onReferenceInfoButtonTap,
                    ),
                    PageOptionTile(
                      title: context.locale.busStationContacts,
                      onTap: cubit.onContactsButtonTap,
                    ),
                  ],
                ),
              );
            },),);
  }
}
