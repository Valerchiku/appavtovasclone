import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'avtovas_localizations_ru.dart';

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
  AvtovasLocalization(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AvtovasLocalization of(BuildContext context) {
    return Localizations.of<AvtovasLocalization>(context, AvtovasLocalization)!;
  }

  static const LocalizationsDelegate<AvtovasLocalization> delegate = _AvtovasLocalizationDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ru')
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

  /// No description provided for @inside.
  ///
  /// In ru, this message translates to:
  /// **'в'**
  String get inside;

  /// No description provided for @placesLeft.
  ///
  /// In ru, this message translates to:
  /// **'Осталось мест: '**
  String get placesLeft;

  /// No description provided for @tripDetails.
  ///
  /// In ru, this message translates to:
  /// **'Детали рейса'**
  String get tripDetails;

  /// No description provided for @title.
  ///
  /// In ru, this message translates to:
  /// **'Билеты на автобусы\nЧувашии'**
  String get title;

  /// No description provided for @date.
  ///
  /// In ru, this message translates to:
  /// **'Дата'**
  String get date;

  /// No description provided for @filters.
  ///
  /// In ru, this message translates to:
  /// **'Фильтры'**
  String get filters;

  /// No description provided for @recent.
  ///
  /// In ru, this message translates to:
  /// **'Раннее искали'**
  String get recent;

  /// No description provided for @clear_history.
  ///
  /// In ru, this message translates to:
  /// **'Очистить историю поиска'**
  String get clear_history;

  /// No description provided for @popular_trips.
  ///
  /// In ru, this message translates to:
  /// **'Популярные направления'**
  String get popular_trips;

  /// No description provided for @benefits.
  ///
  /// In ru, this message translates to:
  /// **'Почему стоит выбрать АвтоВАС?'**
  String get benefits;

  /// No description provided for @web_title.
  ///
  /// In ru, this message translates to:
  /// **'Билеты на автобусы Чувашии'**
  String get web_title;

  /// No description provided for @refund_benefit_title.
  ///
  /// In ru, this message translates to:
  /// **'Возврат билетов'**
  String get refund_benefit_title;

  /// No description provided for @refund_benefit_subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Быстрое оформление возврата\nв личном кабинете'**
  String get refund_benefit_subtitle;

  /// No description provided for @payment_benefit_title.
  ///
  /// In ru, this message translates to:
  /// **'Безопасная оплата'**
  String get payment_benefit_title;

  /// No description provided for @payment_benefit_subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Стандарты безопасности\nPCI DSS для защиты\nплатежных данных'**
  String get payment_benefit_subtitle;

  /// No description provided for @trips_benefit_title.
  ///
  /// In ru, this message translates to:
  /// **'50 000 направлений'**
  String get trips_benefit_title;

  /// No description provided for @trips_benefit_subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Рейтинг рейсов перевозчиков\nпо отзывам пассажиров'**
  String get trips_benefit_subtitle;

  /// No description provided for @time_benefit_title.
  ///
  /// In ru, this message translates to:
  /// **'Без касс и очередей'**
  String get time_benefit_title;

  /// No description provided for @time_benefit_subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Билеты онлайн в любое время\nна сайте и в приложении'**
  String get time_benefit_subtitle;

  /// No description provided for @find_ticket.
  ///
  /// In ru, this message translates to:
  /// **'Найти билет'**
  String get find_ticket;

  /// No description provided for @from.
  ///
  /// In ru, this message translates to:
  /// **'Откуда'**
  String get from;

  /// No description provided for @to.
  ///
  /// In ru, this message translates to:
  /// **'Куда'**
  String get to;

  /// No description provided for @all_days.
  ///
  /// In ru, this message translates to:
  /// **'На все дни'**
  String get all_days;

  /// No description provided for @today.
  ///
  /// In ru, this message translates to:
  /// **'Сегодня'**
  String get today;

  /// No description provided for @tomorrow.
  ///
  /// In ru, this message translates to:
  /// **'Завтра'**
  String get tomorrow;
}

class _AvtovasLocalizationDelegate extends LocalizationsDelegate<AvtovasLocalization> {
  const _AvtovasLocalizationDelegate();

  @override
  Future<AvtovasLocalization> load(Locale locale) {
    return SynchronousFuture<AvtovasLocalization>(lookupAvtovasLocalization(locale));
  }

  @override
  bool isSupported(Locale locale) => true;

  @override
  bool shouldReload(_AvtovasLocalizationDelegate old) => false;
}

AvtovasLocalization lookupAvtovasLocalization(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ru': return AvtovasLocalizationRu();
    default: return AvtovasLocalizationRu();
  }
}
