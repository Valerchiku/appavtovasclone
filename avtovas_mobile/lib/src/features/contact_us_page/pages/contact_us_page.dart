import 'package:avtovas_mobile/src/features/contact_us_page/widgets/contact_info_section.dart';
import 'package:avtovas_mobile/src/features/contact_us_page/widgets/question_form.dart';
import 'package:avtovas_mobile/src/features/contact_us_page/widgets/section_tile.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/constants/common_fonts.dart';
import 'package:common/src/utils/constants/images_assets.dart';

// ignore_for_file: avoid_returning_null_for_void
// ignore_for_file: implementation_imports
// ignore_for_file: directives_ordering

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _questionController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _questionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themePath = context.themeData.textTheme;
    return Scaffold(
      // AppBar будем выносить ? Там почти одинаково везде
      appBar: AppBar(
        backgroundColor: context.theme.mainAppColor,
        leading: IconButton(
          onPressed: () {},
          icon: const AvtovasVectorImage(
            svgAssetPath: ImagesAssets.backArrowIcon,
          ),
          // Icon(
          //   Icons.arrow_back,
          //   color: context.theme.fivefoldTextColor,
          // ),
        ),
        title: Text(
          context.locale.call,
          style: themePath.displaySmall?.copyWith(
            color: context.theme.whitespaceContainerColor,
            fontWeight: CommonFonts.weightRegular,
            fontSize: CommonFonts.appBarFontSize,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: CommonDimensions.large,
          vertical: CommonDimensions.large,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ContactInfoSection(
                title: context.locale.technical_support_service,
                icon: const Icon(Icons.call),
                icon_2: const Icon(Icons.timer),
                label: '8 (800) 700 - 02 - 40',
                label_2: context.locale.twenty_four_hours,
              ),
              const SizedBox(height: CommonDimensions.extraLarge),
              ContactInfoSection(
                title: context.locale.central_bus_station_helpline,
                icon: const Icon(Icons.call),
                icon_2: const Icon(Icons.date_range_rounded),
                label: '+7 (8352) 28-90-00',
                label_2: context.locale.daily_from_five_to_twenty,
              ),
              const SizedBox(height: CommonDimensions.extraLarge),
              SectionTitle(title: context.locale.ask_a_question),
              const SizedBox(height: CommonDimensions.large),
              Text(
                context.locale.our_qualified_experts_will_help,
                style: themePath.titleLarge,
              ),
              const SizedBox(height: CommonDimensions.extraLarge),
              QuestionForm(
                nameController: _nameController,
                emailController: _emailController,
                phoneController: _phoneController,
                questionController: _questionController,
                onTap: () => null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
