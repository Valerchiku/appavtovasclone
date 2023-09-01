import 'package:avtovas_mobile/src/common/shared_cubit/navigation_panel/navigation_panel_cubit.dart';
import 'package:avtovas_mobile/src/features/authorization/cubit/authorization_cubit.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class ProfileLogoutAlert extends StatefulWidget {
  final NavigationPanelCubit cubit;

  const ProfileLogoutAlert({
    required this.cubit,
    super.key,
  });

  @override
  State<ProfileLogoutAlert> createState() => _ProfileLogoutAlertState();
}

class _ProfileLogoutAlertState extends State<ProfileLogoutAlert> {
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
            title: context.locale.exitWarning,
            okayCallback: widget.cubit.onExitTap,
            exitCallback: widget.cubit.closeAlert,
          ),
        );
      },
    );
  }
}
