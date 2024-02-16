import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/constants/web_assets.dart';
import 'package:avtovas_web/src/features/avtovas_contacts/cubit/avtovas_contacts_cubit.dart';
import 'package:avtovas_web/src/features/avtovas_contacts/widgets/avtovas_contacts_info_section.dart';
import 'package:avtovas_web/src/features/avtovas_contacts/widgets/question_form.dart';
import 'package:avtovas_web/src/features/avtovas_contacts/widgets/section_tile.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

final class AvtovasContactsBody extends StatefulWidget {
  final bool smartLayout;
  final bool mobileLayout;
  final String avtovasPhoneNubmer;

  final AvtovasContactsCubit cubit;

  const AvtovasContactsBody({
    required this.cubit,
    required this.smartLayout,
    required this.mobileLayout,
    required this.avtovasPhoneNubmer,
    super.key,
  });

  @override
  State<AvtovasContactsBody> createState() => _AvtovasContactsBodyState();
}

class _AvtovasContactsBodyState extends State<AvtovasContactsBody> {
  late final TextEditingController _userFullNameController;
  late final TextEditingController _userEmailController;
  late final TextEditingController _userPhoneNumberController;
  late final TextEditingController _userQuestionController;

  @override
  void initState() {
    super.initState();
    _userFullNameController = TextEditingController();
    _userEmailController = TextEditingController();
    _userPhoneNumberController = TextEditingController();
    _userQuestionController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _userFullNameController.dispose();
    _userEmailController.dispose();
    _userPhoneNumberController.dispose();
    _userQuestionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themePath = context.themeData.textTheme;
    final localePath = context.locale;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: !widget.smartLayout
            ? AppDimensions.extraLarge
            : AppDimensions.large,
        vertical: AppDimensions.large,
      ),
      child: Column(
        children: [
          if (!widget.mobileLayout)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AvtovasContactsInfoSection(
                        title: localePath.technicalSupportService,
                        firstSvgPath: WebAssets.phoneIcon,
                        secondSvgPath: WebAssets.twentyFourHoursIcon,
                        firstLabel: 'it@avtovas.com',
                        secondLabel: localePath.twentyFourHours,
                      ),
                      const SizedBox(height: AppDimensions.extraLarge),
                      AvtovasContactsInfoSection(
                        title: localePath.centralBusStationHelpline,
                        firstSvgPath: WebAssets.phoneIcon,
                        secondSvgPath: WebAssets.calendarIcon,
                        firstLabel: '+7 (8352) 28-90-00',
                        secondLabel: localePath.dailyFromFiveToTwenty,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionTitle(title: localePath.askQuestion),
                      const SizedBox(height: AppDimensions.medium),
                      Text(
                        localePath.ourQualifiedExpertsWillHelp,
                        style: themePath.titleLarge,
                      ),
                      const SizedBox(height: AppDimensions.large),
                      QuestionForm(
                        nameController: _userFullNameController,
                        emailController: _userEmailController,
                        phoneController: _userPhoneNumberController,
                        questionController: _userQuestionController,
                        onQuestionSendTap: () => widget.cubit.sendSupportMail(
                          userName: _userFullNameController.text,
                          mailAddress: _userEmailController.text,
                          phoneNumber: _userPhoneNumberController.text,
                          message: _userQuestionController.text,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          if (widget.mobileLayout)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                AvtovasContactsInfoSection(
                  title: localePath.technicalSupportService,
                  firstSvgPath: WebAssets.phoneIcon,
                  secondSvgPath: WebAssets.twentyFourHoursIcon,
                  firstLabel: '8 (800) 700 - 02 - 40',
                  secondLabel: localePath.twentyFourHours,
                ),
                AvtovasContactsInfoSection(
                  title: localePath.centralBusStationHelpline,
                  firstSvgPath: WebAssets.phoneIcon,
                  secondSvgPath: WebAssets.calendarIcon,
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
                  nameController: _userFullNameController,
                  emailController: _userEmailController,
                  phoneController: _userPhoneNumberController,
                  questionController: _userQuestionController,
                  onQuestionSendTap: () {
                    widget.cubit.sendSupportMail(
                      userName: _userFullNameController.text,
                      mailAddress: _userEmailController.text,
                      phoneNumber: _userPhoneNumberController.text,
                      message: _userQuestionController.text,
                    );
                  },
                ),
              ],
            ),
        ],
      ),
    );
  }
}
