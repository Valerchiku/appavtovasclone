import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/terms/cubit/terms_cubit.dart';
import 'package:avtovas_mobile/src/features/terms/utils/terms_item.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TermsDetailPage extends StatefulWidget {
  final TermsItem termsItem;

  const TermsDetailPage({required this.termsItem, super.key});

  @override
  State<StatefulWidget> createState() => _TermsDetailPageState();
}

class _TermsDetailPageState extends State<TermsDetailPage> {
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
              var title = '';
              var content = null;
              switch (widget.termsItem) {
                case TermsItem.privacyPolicy:
                  title = '${context.locale.privacyPolicy} ${context.locale.avtovas}';
                  content = ListView(
                    padding: EdgeInsets.all(
                      AppDimensions.preExtraLarge,
                    ),
                    children: [
                      Text(
                        context.locale.consentToTheProcessingOfChildPersonalData,
                        style: context.themeData.textTheme.titleLarge?.copyWith(
                          fontSize: AppFonts.sizeHeadlineMedium,
                          fontWeight: AppFonts.weightRegular,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: AppDimensions.large,
                          bottom: AppDimensions.preExtraLarge,
                        ),
                        child: Text(
                            context.locale.additionalPrecautions),
                      ),
                      Text(
                        context.locale.methodsAndTermsOfPersonalDataProcessing,
                        style: context.themeData.textTheme.titleLarge?.copyWith(
                          fontSize: AppFonts.sizeHeadlineMedium,
                          fontWeight: AppFonts.weightRegular,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: AppDimensions.large,
                        ),
                        child: Text(
                            context.locale.personalDataProcessingDesc),
                      ),
                    ],
                  );
                  break;
                case TermsItem.consentToProcessing:
                  title = '${context.locale.consentToTheProcessingOfPersonalData} ${context.locale.avtovas}';
                  content = ListView(
                    padding: EdgeInsets.all(
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
                        padding: EdgeInsets.only(
                          top: AppDimensions.large,
                          bottom: AppDimensions.preExtraLarge,
                        ),
                        child: Text(
                            context.locale.additionalPrecautions),
                      ),
                      Text(
                        context.locale.methodsAndTermsOfPersonalDataProcessing,
                        style: context.themeData.textTheme.titleLarge?.copyWith(
                          fontSize: AppFonts.sizeHeadlineMedium,
                          fontWeight: AppFonts.weightRegular,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: AppDimensions.large,
                        ),
                        child: Text(
                            context.locale.personalDataProcessingDesc),
                      ),
                    ],
                  );
                  break;
                case TermsItem.contractOffer:
                  title = context.locale.agreement;
                  content = ListView(
                    padding: EdgeInsets.all(
                      AppDimensions.preExtraLarge,
                    ),
                    children: [
                      Text(
                        context.locale.generalProvisionsTitle,
                        style: context.themeData.textTheme.titleLarge?.copyWith(
                          fontSize: AppFonts.sizeHeadlineMedium,
                          fontWeight: AppFonts.weightRegular,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: AppDimensions.large,
                        ),
                        child: Text(context.locale.generalProvisions),
                      ),
                    ],
                  );
                  break;
              }
              return BaseNavigationPage(
                appBarTitle: title,
                leadingSvgPath: AppAssets.backArrowIcon,
                onLeadingTap: cubit.onBackButtonTap,
                onNavigationItemTap: cubit.onNavigationItemTap,
                body: content,
              );
            }));
  }
}
