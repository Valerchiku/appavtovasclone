import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';

class TermsBody extends StatelessWidget {
  final VoidCallback onPrivacyPolicyTap;
  final VoidCallback onConsentToProcessingTap;
  final VoidCallback onContractOfferTap;

  const TermsBody({
    required this.onPrivacyPolicyTap,
    required this.onConsentToProcessingTap,
    required this.onContractOfferTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(
        AppDimensions.large,
      ),
      children: [
        Text(
          context.locale.termsSubtitle,
        ),
        PageOptionTile(
          title: context.locale.privacyPolicy,
          onTap: onPrivacyPolicyTap,
        ),
        PageOptionTile(
          title: context.locale.contractOffer,
          onTap: onContractOfferTap,
        ),
        PageOptionTile(
          title: context.locale.termsOfUse,
          onTap: onConsentToProcessingTap,
        ),
      ],
    );
  }
}
