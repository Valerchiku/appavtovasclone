import 'package:avtovas_mobile/src/common/shared_cubit/navigation_panel/navigation_panel_cubit.dart';
import 'package:avtovas_mobile/src/features/authorization/cubit/authorization_cubit.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class ProfileAlert extends StatefulWidget {
  final NavigationPanelCubit cubit;
  final AuthorizationCubit authorizationCubit;

  const ProfileAlert({
    required this.cubit,
    required this.authorizationCubit,
    super.key,
  });

  @override
  State<ProfileAlert> createState() => _ProfileAlertState();
}

class _ProfileAlertState extends State<ProfileAlert> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationPanelCubit, NavigationPanelState>(
      bloc: widget.cubit,
      builder: (context, state) {
        return Container(
          width: context.availableWidth,
          height: context.availableHeight,
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.7),
          ),
          child: AvtovasAlertDialog(
            title: context.locale.authorizationWarning(widget.authorizationCubit.state.phoneNumber),
            okayCallback: widget.authorizationCubit.onSendButtonTap,
            exitCallback: widget.cubit.closeBottomSheet,
          ),
        );
      },
    );
  }
}
