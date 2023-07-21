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

  @override
  String get popular_trips => 'Популярные направления';

  @override
  String get benefits => 'Почему стоит выбрать АвтоВАС?';

  @override
  String get web_title => 'Билеты на автобусы Чувашии';

  @override
  String get refund_benefit_title => 'Возврат билетов';

  @override
  String get refund_benefit_subtitle => 'Быстрое оформление возврата\nв личном кабинете';

  @override
  String get payment_benefit_title => 'Безопасная оплата';

  @override
  String get payment_benefit_subtitle => 'Стандарты безопасности\nPCI DSS для защиты\nплатежных данных';

  @override
  String get trips_benefit_title => '50 000 направлений';

  @override
  String get trips_benefit_subtitle => 'Рейтинг рейсов перевозчиков\nпо отзывам пассажиров';

  @override
  String get time_benefit_title => 'Без касс и очередей';

  @override
  String get time_benefit_subtitle => 'Билеты онлайн в любое время\nна сайте и в приложении';

  @override
  String get find_ticket => 'Найти билет';

  @override
  String get from => 'Откуда';

  @override
  String get to => 'Куда';

  @override
  String get all_days => 'На все дни';

  @override
  String get today => 'Сегодня';

  @override
  String get tomorrow => 'Завтра';
}
