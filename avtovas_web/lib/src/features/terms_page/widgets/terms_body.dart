import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';

class TermsBody extends StatelessWidget {
  final bool smartLayout;
  final VoidCallback onPrivacyPolicyTap;
  final VoidCallback onConsentToProcessingTap;
  final VoidCallback onContractOfferTap;

  const TermsBody({
    required this.smartLayout,
    required this.onPrivacyPolicyTap,
    required this.onConsentToProcessingTap,
    required this.onContractOfferTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal:
            smartLayout ? AppDimensions.large : AppDimensions.extraLarge,
        vertical: smartLayout ? AppDimensions.large : AppDimensions.extraLarge,
      ),
      child: Column(
        children: [
          Text(
            context.locale.termsSubtitle,
          ),
          PageOptionTile(
            title: context.locale.privacyPolicy,
            onTap: onPrivacyPolicyTap,
          ),
          PageOptionTile(
            title: context.locale.consentToTheProcessingOfPersonalData,
            onTap: onConsentToProcessingTap,
          ),
          PageOptionTile(
            title: context.locale.contractOffer,
            onTap: onContractOfferTap,
          ),
        ],
      ),
    );
  }
}
