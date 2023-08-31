import 'package:avtovas_mobile/src/features/main/cubit/profile_cubit/profile_cubit.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class ProfileAlert extends StatefulWidget {
  final ProfileCubit cubit;

  const ProfileAlert({
    required this.cubit,
    super.key,
  });

  @override
  State<ProfileAlert> createState() => _ProfileAlertState();
}

class _ProfileAlertState extends State<ProfileAlert> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      bloc: widget.cubit,
      builder: (context, state) {
        return AvtovasAlertDialog();
      },
    );
  }
}
