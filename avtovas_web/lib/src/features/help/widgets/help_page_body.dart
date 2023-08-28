import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/constants/app_fonts.dart';
import 'package:avtovas_web/src/features/help/cubit/help_cubit.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class HelpPageBody extends StatelessWidget {
  final HelpCubit helpCubit;
  const HelpPageBody({
    required this.helpCubit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(
        AppDimensions.rootPadding,
      ),
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: AppDimensions.large,
          ),
          child: Text(
            '${context.locale.main} / ${context.locale.help}',
          ),
        ),
        Text(
          context.locale.help,
          style: context.themeData.textTheme.titleLarge?.copyWith(
            fontSize: AppFonts.extraLarge,
            fontWeight: AppFonts.titleWeight
          ),
        ),
        PageOptionTile(
          title: context.locale.inquiry,
          onTap: helpCubit.onCallOrAskQuestionButtonTap,
        ),
        PageOptionTile(
          title: context.locale.directoryInfo,
          onTap: helpCubit.onReferenceInfoButtonTap,
        ),
        PageOptionTile(
          title: context.locale.busStationContacts,
          onTap: helpCubit.onContactsButtonTap,
        ),
      ],
    );
  }
}

