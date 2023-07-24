import 'package:intl/intl.dart' as intl;

import 'avtovas_localizations.dart';

/// The translations for Russian (`ru`).
class AvtovasLocalizationRu extends AvtovasLocalization {
  AvtovasLocalizationRu([String locale = 'ru']) : super(locale);

  @override
  String get buyTicket
    => 'Купить билет';

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
  String get inside
    => 'в';

  @override
  String get placesLeft
    => 'Осталось мест: ';

  @override
  String get tripDetails
    => 'Детали рейса';

  @override
  String get title
    => 'Билеты на автобусы\nЧувашии';

  @override
  String get date
    => 'Дата';

  @override
  String get filters
    => 'Фильтры';

  @override
  String get recent
    => 'Раннее искали';

  @override
  String get clearHistory
    => 'Очистить историю поиска';

  @override
  String get popularTrips
    => 'Популярные направления';

  @override
  String get benefits
    => 'Почему стоит выбрать АвтоВАС?';

  @override
  String get webTitle
    => 'Билеты на автобусы Чувашии';

  @override
  String get refundBenefitTitle
    => 'Возврат билетов';

  @override
  String get refundBenefitSubtitle
    => 'Быстрое оформление возврата\nв личном кабинете';

  @override
  String get paymentBenefitTitle
    => 'Безопасная оплата';

  @override
  String get paymentBenefitSubtitle
    => 'Стандарты безопасности\nPCI DSS для защиты\nплатежных данных';

  @override
  String get tripsBenefitTitle
    => '50 000 направлений';

  @override
  String get tripsBenefitSubtitle
    => 'Рейтинг рейсов перевозчиков\nпо отзывам пассажиров';

  @override
  String get timeBenefitTitle
    => 'Без касс и очередей';

  @override
  String get timeBenefitSubtitle
    => 'Билеты онлайн в любое время\nна сайте и в приложении';

  @override
  String get findTicket
    => 'Найти билет';

  @override
  String get from
    => 'Откуда';

  @override
  String get to
    => 'Куда';

  @override
  String get allDays
    => 'На все дни';

  @override
  String get today
    => 'Сегодня';

  @override
  String get tomorrow
    => 'Завтра';
}
