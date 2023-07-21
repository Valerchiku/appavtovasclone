import 'package:intl/intl.dart' as intl;

import 'avtovas_localizations.dart';

/// The translations for Russian (`ru`).
class AvtovasLocalizationRu extends AvtovasLocalization {
  AvtovasLocalizationRu([String locale = 'ru']) : super(locale);

  @override
  String get buyTicket => 'Купить билет';

  @override
  String freePlaces(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count мест',
      many: '$count мест',
      few: '$count места',
      two: '$count места',
      one: '$count место',
      zero: 'Продажи билетов прекращены',
    );
    return '$_temp0';
  }

  @override
  String get inside => 'в';

  @override
  String get placesLeft => 'Осталось мест: ';

  @override
  String get tripDetails => 'Детали рейса';

  @override
  String get title => 'Билеты на автобусы\nЧувашии';

  @override
  String get date => 'Дата';

  @override
  String get filters => 'Фильтры';

  @override
  String get recent => 'Раннее искали';

  @override
  String get clear_history => 'Очистить историю поиска';
}
