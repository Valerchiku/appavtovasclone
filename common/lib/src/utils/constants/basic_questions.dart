import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';

final class ReferenceQuestion {
  final String question;
  final String answer;

  const ReferenceQuestion(this.question, this.answer);
}

abstract final class BasicQuestions {
  static List<ReferenceQuestion> ticketingQuestions(BuildContext context) => [
        ReferenceQuestion(
          context.locale.referenceQuestion1,
          context.locale.referenceAnswer1,
        ),
        ReferenceQuestion(
          context.locale.referenceQuestion2,
          context.locale.referenceAnswer2,
        ),
        ReferenceQuestion(
          context.locale.referenceQuestion3,
          context.locale.referenceAnswer3,
        ),
        ReferenceQuestion(
          context.locale.referenceQuestion4,
          context.locale.referenceAnswer4,
        ),
        ReferenceQuestion(
          context.locale.referenceQuestion5,
          context.locale.referenceAnswer5,
        ),
        ReferenceQuestion(
          context.locale.referenceQuestion6,
          context.locale.referenceAnswer6,
        ),
        ReferenceQuestion(
          context.locale.referenceQuestion7,
          context.locale.referenceAnswer7,
        ),
        ReferenceQuestion(
          context.locale.referenceQuestion8,
          context.locale.referenceAnswer8,
        ),
        ReferenceQuestion(
          context.locale.referenceQuestion9,
          context.locale.referenceAnswer9,
        ),
        ReferenceQuestion(
          context.locale.referenceQuestion10,
          context.locale.referenceAnswer10,
        ),
        ReferenceQuestion(
          context.locale.referenceQuestion11,
          context.locale.referenceAnswer11,
        ),
        ReferenceQuestion(
          context.locale.referenceQuestion12,
          context.locale.referenceAnswer12,
        ),
        ReferenceQuestion(
          context.locale.referenceQuestion13,
          context.locale.referenceAnswer13,
        ),
        ReferenceQuestion(
          context.locale.referenceQuestion14,
          context.locale.referenceAnswer14,
        ),
      ];

  static List<ReferenceQuestion> refundQuestions(BuildContext context) => [
        ReferenceQuestion(
          context.locale.referenceQuestion15,
          context.locale.referenceAnswer15,
        ),
        ReferenceQuestion(
          context.locale.referenceQuestion16,
          context.locale.referenceAnswer16,
        ),
        ReferenceQuestion(
          context.locale.referenceQuestion17,
          context.locale.referenceAnswer17,
        ),
      ];

  static List<ReferenceQuestion> seatingQuestions(BuildContext context) => [
        ReferenceQuestion(
          context.locale.referenceQuestion18,
          context.locale.referenceAnswer18,
        ),
        ReferenceQuestion(
          context.locale.referenceQuestion19,
          context.locale.referenceAnswer19,
        ),
        ReferenceQuestion(
          context.locale.referenceQuestion20,
          context.locale.referenceAnswer20,
        ),
        ReferenceQuestion(
          context.locale.referenceQuestion21,
          context.locale.referenceAnswer21,
        ),
        ReferenceQuestion(
          context.locale.referenceQuestion22,
          context.locale.referenceAnswer22,
        ),
        ReferenceQuestion(
          context.locale.referenceQuestion23,
          context.locale.referenceAnswer23,
        ),
        ReferenceQuestion(
          context.locale.referenceQuestion24,
          context.locale.referenceAnswer24,
        ),
        ReferenceQuestion(
          context.locale.referenceQuestion25,
          context.locale.referenceAnswer25,
        ),
      ];

  static List<ReferenceQuestion> supportQuestions(BuildContext context) => [
    ReferenceQuestion(
      context.locale.referenceQuestion26,
      context.locale.referenceAnswer26,
    ),
  ];
}
