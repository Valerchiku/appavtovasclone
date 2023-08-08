import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:common/avtovas_common_localization.dart';
import 'package:common/avtovas_common_widgets.dart';
import 'package:flutter/cupertino.dart';

class TermsBody extends StatelessWidget {
  const TermsBody({
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
          arrowAlignment: ArrowAlignment.end,
          children: const <Widget>[Text('content')],
        ),
        ExpansionContainer(
          title: Text(
            context.locale.consentToTheProcessingOfPersonalData,
          ),
          arrowAlignment: ArrowAlignment.end,
          children: const <Widget>[Text('content')],
        ),
        ExpansionContainer(
          title: Text(
            context.locale.contractOffer,
          ),
          arrowAlignment: ArrowAlignment.end,
          children: const <Widget>[Text('content')],
        ),
      ],
    );
  }
}
