import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';

class TermsPageBody extends StatelessWidget {
  const TermsPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(
        top: AppDimensions.large,
        left: AppDimensions.large,
        right: AppDimensions.large,
      ),
      children: [
        Text(
          context.locale.termsSubtitle,
        ),
        ExpansionContainer(
          title: Text(
            context.locale.privacyPolicy,
          ),
          children: const <Widget>[Text('content')],
        ),
        ExpansionContainer(
          title: Text(
            context.locale.consentToTheProcessingOfPersonalData,
          ),
          children: const <Widget>[Text('content')],
        ),
        ExpansionContainer(
          title: Text(
            context.locale.contractOffer,
          ),
          children: const <Widget>[Text('content')],
        ),
      ],
    );
  }
}
