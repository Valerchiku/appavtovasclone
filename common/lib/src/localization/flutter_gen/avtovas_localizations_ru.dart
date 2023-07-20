import 'package:common/src/localization/flutter_gen/avtovas_localizations.dart';
import 'package:intl/intl.dart' as intl;

// ignore_for_file: prefer-match-file-name
// ignore_for_file: avoid-non-ascii-symbols
// ignore_for_file: omit_local_variable_types

/// The translations for Russian (`ru`).
class AvtovasLocalizationRu extends AvtovasLocalization {
  @override
  String get buyTicket => 'Купить билет';

  @override
  String get inside => 'в';

  @override
  String get placesLeft => 'Осталось мест: ';

  @override
  String get tripDetails => 'Детали рейса';

  AvtovasLocalizationRu([super.locale = 'ru']);

  @override
  String freePlaces(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count мест',
      many: '$count мест',
      few: '$count места',
      two: '$count места',
      one: '$count место',
      zero: 'Продажи билетов прекращены',
    );
  }
}
