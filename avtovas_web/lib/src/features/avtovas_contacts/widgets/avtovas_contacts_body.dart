import 'package:avtovas_web/src/common/constants/web_assets.dart';
import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/mail_sender/mail_sender.dart';
import 'package:avtovas_web/src/features/avtovas_contacts/widgets/avtovas_contacts_info_section.dart';
import 'package:avtovas_web/src/features/avtovas_contacts/widgets/question_form.dart';
import 'package:avtovas_web/src/features/avtovas_contacts/widgets/section_tile.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

final class AvtovasContactsBody extends StatefulWidget {
  final bool smartLayout;
  final bool mobileLayout;
  const AvtovasContactsBody({
    required this.smartLayout,
    required this.mobileLayout,
    super.key,
  });

  @override
  State<AvtovasContactsBody> createState() => _AvtovasContactsBodyState();
}

class _AvtovasContactsBodyState extends State<AvtovasContactsBody> {
  late TextEditingController _userFullName;
  late TextEditingController _userEmail;
  late TextEditingController _userPhoneNumber;
  late TextEditingController _userQuestion;

  @override
  void initState() {
    super.initState();
    _userFullName = TextEditingController();
    _userEmail = TextEditingController();
    _userPhoneNumber = TextEditingController();
    _userQuestion = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _userFullName.dispose();
    _userEmail.dispose();
    _userPhoneNumber.dispose();
    _userQuestion.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themePath = context.themeData.textTheme;
    final localePath = context.locale;
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(
        horizontal:
            widget.smartLayout ? AppDimensions.large : AppDimensions.extraLarge,
        vertical:
            widget.smartLayout ? AppDimensions.large : AppDimensions.extraLarge,
      ),
      children: [
        if (!widget.mobileLayout)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              const Spacer(),
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
                      nameController: _userFullName,
                      emailController: _userEmail,
                      phoneController: _userPhoneNumber,
                      questionController: _userQuestion,
                      onTap: () {
                        MailSender.askQuestion(
                          fullName: _userFullName.text,
                          userEmail: _userEmail.text,
                          userPhoneNumber: _userPhoneNumber.text,
                          userQuestion: _userQuestion.text,
                        );
                      },
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
                nameController: _userFullName,
                emailController: _userEmail,
                phoneController: _userPhoneNumber,
                questionController: _userQuestion,
                onTap: () {
                  MailSender.askQuestion(
                    fullName: _userFullName.text,
                    userEmail: _userEmail.text,
                    userPhoneNumber: _userPhoneNumber.text,
                    userQuestion: _userQuestion.text,
                  );
                },
              ),
            ],
          ),
      ],
    );
  }
}
