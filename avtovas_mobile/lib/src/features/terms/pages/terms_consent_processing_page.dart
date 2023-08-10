import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/terms/cubit/terms_cubit.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TermsConsentProcessingPage extends StatefulWidget {
  const TermsConsentProcessingPage({super.key});

  @override
  State<StatefulWidget> createState() => _TermsConsentProcessingPageState();
}

class _TermsConsentProcessingPageState extends State<TermsConsentProcessingPage> {
  void _listener(BuildContext context, TermsState state) {
    if (state.route.type != null) {
      context.navigateTo(state.route);
    }
  }

  bool _listenWhen(TermsState prev, TermsState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<TermsCubit>(
      child: BlocConsumer<TermsCubit, TermsState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          final cubit = CubitScope.of<TermsCubit>(context);
          return BaseNavigationPage(
            appBarTitle: '''${context.locale.consentToTheProcessingOfPersonalData}'''
                ''' ${context.locale.avtovas}''',
            leadingSvgPath: AppAssets.backArrowIcon,
            onLeadingTap: cubit.onBackButtonTap,
            onNavigationItemTap: cubit.onNavigationItemTap,
            body: ListView(
              padding: const EdgeInsets.all(
                AppDimensions.preExtraLarge,
              ),
              children: [
                Text(
                  context.locale.consentToTheProcessingOfPersonalData,
                  style: context.themeData.textTheme.titleLarge?.copyWith(
                    fontSize: AppFonts.sizeHeadlineMedium,
                    fontWeight: AppFonts.weightRegular,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: AppDimensions.large,
                    bottom: AppDimensions.preExtraLarge,
                  ),
                  child: Text(context.locale.additionalPrecautions,),
                ),
                Text(
                  context.locale.methodsAndTermsOfPersonalDataProcessing,
                  style: context.themeData.textTheme.titleLarge?.copyWith(
                    fontSize: AppFonts.sizeHeadlineMedium,
                    fontWeight: AppFonts.weightRegular,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: AppDimensions.large,
                  ),
                  child: Text(context.locale.personalDataProcessingDesc,),
                ),
              ],
            ),
          );
        },),);
  }
}
