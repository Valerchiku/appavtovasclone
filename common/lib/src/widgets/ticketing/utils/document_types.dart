import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

abstract final class DocumentTypes {
  static List<String> documentType(BuildContext context) {
    return [
      context.locale.passportRF,
      context.locale.sailorPassport,
      context.locale.intlPassportRF,
      context.locale.foreignPassport,
      context.locale.birthCertificate,
      context.locale.militaryId,
      context.locale.statelessId,
      context.locale.tempId,
      context.locale.militaryTicket,
      context.locale.residencePermit,
      context.locale.releaseCertificate,
      context.locale.ussrPassport,
      context.locale.diplomatRfPassport,
      context.locale.intlUssrPassport,
      context.locale.minflotPassport,
      context.locale.reserveOfficerTicket,
      context.locale.returnFromCisCertificate,
      context.locale.lostPassportCertificate,
      context.locale.asylumCertificate,
    ];
  }
}
