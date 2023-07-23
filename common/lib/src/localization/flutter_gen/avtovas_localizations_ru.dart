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
  String get help => 'Помощь';

  @override
  String get inside => 'в';

  @override
  String get myTrips => 'Мои поездки';

  @override
  String get placesLeft => 'Осталось мест: ';

  @override
  String get profile => 'Профиль';

  @override
  String get search => 'Поиск';

  @override
  String get tripDetails => 'Детали рейса';

  @override
  String get name => 'Имя';

  @override
  String get what_trips_are_there => 'Какие рейсы есть - рейсы и расписание';

  @override
  String get will_there_be_a_trip => 'Точно ли будет рейс';

  @override
  String get how_far_in_advance_do_you_need_to_buy_a_ticket => 'Насколько заранее надо покупать билет';

  @override
  String get how_to_calculate_travel_time_and_arrival_time => 'Как рассчитать время в пути и время\nприбытия';

  @override
  String get reference_info => 'Справочная информация';
}
