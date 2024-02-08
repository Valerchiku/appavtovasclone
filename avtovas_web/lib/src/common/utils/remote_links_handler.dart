import 'package:avtovas_web/src/common/utils/enums/link_types.dart';

abstract final class RemoteLinksHandler {
  static LinkTypes linkTypeFromFullLink(String link) {
    if (link.contains(LinkTypes.paymentRedirect.name)) {
      return LinkTypes.paymentRedirect;
    }

    return LinkTypes.unimplemented;
  }

  static (String, String) paymentRedirectParams(String link) {
    final linkWithoutSchema =
        link.replaceAll('https://', '').replaceAll('http://', '');

    final linkWithoutDomain = linkWithoutSchema.replaceAll(
      'localhost:59587/my-trips/${LinkTypes.paymentRedirect.name}/',
      '',
    );

    final paymentId = linkWithoutDomain.substring(
      0,
      linkWithoutDomain.indexOf('?'),
    );

    final tripId = linkWithoutDomain.substring(
      linkWithoutDomain.indexOf('?') + 1,
      linkWithoutDomain.length,
    );


    return (paymentId, tripId);
  }
}
