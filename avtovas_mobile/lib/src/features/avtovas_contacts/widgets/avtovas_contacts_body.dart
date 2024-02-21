import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/features/avtovas_contacts/cubit/avtovas_contacts_cubit.dart';
import 'package:avtovas_mobile/src/features/avtovas_contacts/widgets/avtovas_contacts_info_section.dart';
import 'package:avtovas_mobile/src/features/avtovas_contacts/widgets/question_form.dart';
import 'package:avtovas_mobile/src/features/avtovas_contacts/widgets/section_tile.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class AvtovasContactsBody extends StatelessWidget {
  final AvtovasContactsCubit cubit;

  const AvtovasContactsBody({required this.cubit, super.key});

  @override
  Widget build(BuildContext context) {
    final themePath = context.themeData.textTheme;
    final localePath = context.locale;

    return BlocBuilder<AvtovasContactsCubit, AvtovasContactsState>(
      builder: (context, state) {
        return ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.large,
            vertical: AppDimensions.large,
          ),
          children: [
            AvtovasContactsInfoSection(
              title: localePath.technicalSupportService,
              firstSvgPath: AppAssets.phoneIcon,
              secondSvgPath: AppAssets.twentyFourHoursIcon,
              firstLabel: state.avtovasPhoneNumber,
              secondLabel: localePath.twentyFourHours,
            ),
            const SizedBox(height: AppDimensions.extraLarge),
            AvtovasContactsInfoSection(
              title: localePath.centralBusStationHelpline,
              firstSvgPath: AppAssets.phoneIcon,
              secondSvgPath: AppAssets.calendarIcon,
              firstLabel: '+7 (8352) 28-90-00',
              secondLabel: localePath.dailyFromFiveToTwenty,
            ),
            const SizedBox(height: AppDimensions.extraLarge),
            SectionTitle(title: localePath.askQuestion),
            const SizedBox(height: AppDimensions.large),
            Text(
              localePath.ourQualifiedExpertsWillHelp,
              style: themePath.titleLarge,
            ),
            const SizedBox(height: AppDimensions.extraLarge),
            QuestionForm(
              onSend: (userName, mailAddress, phoneNumber, message) {
                cubit.sendSupportMail(
                  userName: userName,
                  mailAddress: mailAddress,
                  phoneNumber: phoneNumber,
                  message: message,
                );
              },
              onTermsOfUseTextTap: cubit.navigateToTermsOfUse,
            ),
          ],
        );
      },
    );
  }
}
