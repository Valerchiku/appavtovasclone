import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

abstract final class DocumentTypes {
  static const List<String> ruDocumentTypes = [
    'Паспорт РФ',
    'Паспорт моряка',
    'Загранпаспорт гражданина РФ',
    'Паспорт иностранного гражданина',
    'Свидетельство о рождении',
    'Удостоверение личности военнослужащего РФ',
    'Удостоверение личности лица без гражданства',
    'Временное удостоверение личности',
    'Военный билет',
    'Вид на жительство',
    'Справка об освобождении из мест лишения свободы',
    'Паспорт гражданина СССР',
    'Дипломатический паспорт гражданина РФ',
    'Загранпаспорт гражданина СССР',
    'Паспорт Минморфлота',
    'Военный билет офицера запаса',
    'Свидетельство о возвращении из стран СНГ',
    'Справка об утере паспорта',
    'Свидетельство о предоставлении временного убежища',
  ];

  static List<String> documentTypes(BuildContext context) {
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
