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
  String get info_desk_of_the_central_bus_station => 'Справочная Центрального автовокзала';

  @override
  String get from => 'с';

  @override
  String get to => 'до';

  @override
  String get daily => 'ежедневно';

  @override
  String get control_room_of_the_central_bus_station => 'Диспетчерская Центрального автовокзала';

  @override
  String get support => 'Служба технической поддержки';

  @override
  String get round_the_clock => 'Круглосуточно';

  @override
  String get contacts => 'Контакты автовокзалов';

  @override
  String get contacts_item => 'Чебоксары - Центральный автовокзал';
}
