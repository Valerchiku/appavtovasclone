import 'package:intl/intl.dart' as intl;

import 'avtovas_localizations.dart';

/// The translations for Russian (`ru`).
class AvtovasLocalizationRu extends AvtovasLocalization {
  AvtovasLocalizationRu([String locale = 'ru']) : super(locale);

  @override
  String get buyTicket => 'Купить билет';

  @override
  String get carrier => 'Перевозчик';

  @override
  String get flight => 'Рейс';

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
  String get flightInformation => 'Информация о рейсе';

  @override
  String get inside => 'в';

  @override
  String get myTrips => 'Мои поездки';

  @override
  String get onWay => 'В пути: ';

  @override
  String get placesLeft => 'Осталось мест: ';

  @override
  String get primaryDetailsMessage => 'Отправление и прибытие по местному времени';

  @override
  String get profile => 'Профиль';

  @override
  String get returnConditions => 'Условия возврата';

  @override
  String get search => 'Поиск';

  @override
  String get secondaryDetailsMessage => 'Перевозчик имеет право заменить транспортное средство, в случае его неисправности, аварии и других аналогичных случаях';

  @override
  String get transport => 'Транспорт: ';

  @override
  String get tripDetails => 'Детали рейса';

  @override
  String get name => 'Имя';

  @override
  String get waypoints => 'Промежуточные пункты';

  @override
  String get inquiry => 'Позвонить или задать вопрос';

  @override
  String get directoryInfo => 'Справочная информация';

  @override
  String get busStationContacts => 'Контакты автовокзалов';

  @override
  String get enterName => 'Введите имя';

  @override
  String get emailExample => 'example@example.ru';

  @override
  String get enterPhoneNumber => 'Введите номер телефона';

  @override
  String get enterQuestion => 'Введите вопрос';

  @override
  String get askQuestion => 'Задать вопрос';

  @override
  String get questionConsentText => 'Нажимая кнопку “Задать вопрос”, я даю';

  @override
  String get personalDataProcessingText => 'согласие на обработку персональных данных';

  @override
  String get call => 'Позвонить';

  @override
  String get technicalSupportService => 'Служба технической поддержки';

  @override
  String get centralBusStationHelpline => 'Справочная Центрального автовокзала';

  @override
  String get ourQualifiedExpertsWillHelp => 'Наши квалифицированные специалисты обязательно вам помогут.';

  @override
  String get twentyFourHours => 'круглосуточно';

  @override
  String get dailyFromFiveToTwenty => 'с 05:00 до 20:00 ежедневно';

  @override
  String get sortByTime => 'Сортировка по времени';

  @override
  String get sortByPrice => 'Сортировка по цене';

  @override
  String get passport => 'Паспорт';

  @override
  String get internationalPassport => 'Заграничный паспорт';

  @override
  String get birthCertificate => 'Свидетельство о рождении';

  @override
  String get childish => 'Детский ';

  @override
  String get passengers => 'Пассажирский';
}
