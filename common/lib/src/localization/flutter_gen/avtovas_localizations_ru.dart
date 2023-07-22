import 'package:intl/intl.dart' as intl;
import 'avtovas_localizations.dart';

// ignore_for_file: unnecessary_string_interpolations
// ignore_for_file: use_super_parameters
// ignore_for_file: always_use_package_imports
// ignore_for_file: prefer-match-file-name,
// ignore_for_file: omit_local_variable_types,
// ignore_for_file: avoid-non-ascii-symbols
// ignore_for_file: member-ordering
// ignore_for_file: prefer_final_locals
// ignore_for_file: no_leading_underscores_for_local_identifiers


/// The translations for Russian (`ru`).
class AvtovasLocalizationRu extends AvtovasLocalization {
  AvtovasLocalizationRu([String locale = 'ru']) : super(locale);

  @override
  String get buyTicket => 'Купить билет';
  
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
