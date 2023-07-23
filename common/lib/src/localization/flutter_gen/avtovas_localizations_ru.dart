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
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: prefer-correct-identifier-length
// ignore_for_file: lines_longer_than_80_chars

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
  String get enter_name => 'Введите имя';

  @override
  String get email_example => 'example@example.ru';

  @override
  String get enter_phone_number => 'Введите номер телефона';

  @override
  String get enter_question => 'Введите вопрос';

  @override
  String get ask_a_question => 'Задать вопрос';

  @override
  String get question_consent_text => 'Нажимая кнопку “Задать вопрос”, я даю';

  @override
  String get personal_data_processing_text =>
      'согласие на обработку персональных данных';

  @override
  String get call => 'Позвонить';

  @override
  String get technical_support_service => 'Служба технической поддержки';

  @override
  String get central_bus_station_helpline =>
      'Справочная Центрального автовокзала';

  @override
  String get our_qualified_experts_will_help =>
      'Наши квалифицированные специалисты обязательно вам помогут.';

  @override
  String get twenty_four_hours => 'круглосуточно';

  @override
  String get daily_from_five_to_twenty => 'с 05:00 до 20:00 ежедневно';
}
