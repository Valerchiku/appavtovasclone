import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'avtovas_localizations_ru.dart';

// ignore_for_file: lines_longer_than_80_chars,
// ignore_for_file: prefer-match-file-name
// ignore_for_file: always_use_package_imports
// ignore_for_file: member-ordering
// ignore_for_file: noop_primitive_operations
// ignore_for_file: public_member_api_docs,
// ignore_for_file: member-ordering
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: prefer-correct-identifier-length

/// Callers can lookup localized strings with an instance of AvtovasLocalization
/// returned by `AvtovasLocalization.of(context)`.
///
/// Applications need to include `AvtovasLocalization.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'flutter_gen/avtovas_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AvtovasLocalization.localizationsDelegates,
///   supportedLocales: AvtovasLocalization.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AvtovasLocalization.supportedLocales
/// property.
abstract class AvtovasLocalization {
  AvtovasLocalization(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AvtovasLocalization of(BuildContext context) {
    return Localizations.of<AvtovasLocalization>(context, AvtovasLocalization)!;
  }

  static const LocalizationsDelegate<AvtovasLocalization> delegate =
      _AvtovasLocalizationDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ru'),
  ];

  /// No description provided for @buyTicket.
  ///
  /// In ru, this message translates to:
  /// **'Купить билет'**
  String get buyTicket;

  /// No description provided for @freePlaces.
  ///
  /// In ru, this message translates to:
  /// **'{count, plural, =0{Продажи билетов прекращены} =1{{count} место} =2{{count} места} few{{count} места} many{{count} мест} other {{count} мест}}'**
  String freePlaces(num count);

  /// No description provided for @help.
  ///
  /// In ru, this message translates to:
  /// **'Помощь'**
  String get help;

  /// No description provided for @inside.
  ///
  /// In ru, this message translates to:
  /// **'в'**
  String get inside;

  /// No description provided for @myTrips.
  ///
  /// In ru, this message translates to:
  /// **'Мои поездки'**
  String get myTrips;

  /// No description provided for @placesLeft.
  ///
  /// In ru, this message translates to:
  /// **'Осталось мест: '**
  String get placesLeft;

  /// No description provided for @profile.
  ///
  /// In ru, this message translates to:
  /// **'Профиль'**
  String get profile;

  /// No description provided for @search.
  ///
  /// In ru, this message translates to:
  /// **'Поиск'**
  String get search;

  /// No description provided for @tripDetails.
  ///
  /// In ru, this message translates to:
  /// **'Детали рейса'**
  String get tripDetails;

  /// No description provided for @name.
  ///
  /// In ru, this message translates to:
  /// **'Имя'**
  String get name;

  /// No description provided for @enter_name.
  ///
  /// In ru, this message translates to:
  /// **'Введите имя'**
  String get enter_name;

  /// No description provided for @email_example.
  ///
  /// In ru, this message translates to:
  /// **'example@example.ru'**
  String get email_example;

  /// No description provided for @enter_phone_number.
  ///
  /// In ru, this message translates to:
  /// **'Введите номер телефона'**
  String get enter_phone_number;

  /// No description provided for @enter_question.
  ///
  /// In ru, this message translates to:
  /// **'Введите вопрос'**
  String get enter_question;

  /// No description provided for @ask_a_question.
  ///
  /// In ru, this message translates to:
  /// **'Задать вопрос'**
  String get ask_a_question;

  /// No description provided for @question_consent_text.
  ///
  /// In ru, this message translates to:
  /// **'Нажимая кнопку “Задать вопрос”, я даю'**
  String get question_consent_text;

  /// No description provided for @personal_data_processing_text.
  ///
  /// In ru, this message translates to:
  /// **'согласие на обработку персональных данных'**
  String get personal_data_processing_text;

  /// No description provided for @call.
  ///
  /// In ru, this message translates to:
  /// **'Позвонить'**
  String get call;

  /// No description provided for @technical_support_service.
  ///
  /// In ru, this message translates to:
  /// **'Служба технической поддержки'**
  String get technical_support_service;

  /// No description provided for @central_bus_station_helpline.
  ///
  /// In ru, this message translates to:
  /// **'Справочная Центрального автовокзала'**
  String get central_bus_station_helpline;

  /// No description provided for @our_qualified_experts_will_help.
  ///
  /// In ru, this message translates to:
  /// **'Наши квалифицированные специалисты обязательно вам помогут.'**
  String get our_qualified_experts_will_help;

  /// No description provided for @twenty_four_hours.
  ///
  /// In ru, this message translates to:
  /// **'круглосуточно'**
  String get twenty_four_hours;

  /// No description provided for @daily_from_five_to_twenty.
  ///
  /// In ru, this message translates to:
  /// **'с 05:00 до 20:00 ежедневно'**
  String get daily_from_five_to_twenty;
}

class _AvtovasLocalizationDelegate
    extends LocalizationsDelegate<AvtovasLocalization> {
  const _AvtovasLocalizationDelegate();

  @override
  Future<AvtovasLocalization> load(Locale locale) {
    return SynchronousFuture<AvtovasLocalization>(
      lookupAvtovasLocalization(locale),
    );
  }

  @override
  bool isSupported(Locale locale) => true;

  @override
  bool shouldReload(_AvtovasLocalizationDelegate old) => false;
}

AvtovasLocalization lookupAvtovasLocalization(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ru':
      return AvtovasLocalizationRu();
    default:
      return AvtovasLocalizationRu();
  }
}
