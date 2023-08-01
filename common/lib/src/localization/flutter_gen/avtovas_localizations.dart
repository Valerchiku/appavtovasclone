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

  /// No description provided for @carrier.
  ///
  /// In ru, this message translates to:
  /// **'Перевозчик'**
  String get carrier;

  /// No description provided for @flight.
  ///
  /// In ru, this message translates to:
  /// **'Рейс'**
  String get flight;

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

  /// No description provided for @flightInformation.
  ///
  /// In ru, this message translates to:
  /// **'Информация о рейсе'**
  String get flightInformation;

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

  /// No description provided for @onWay.
  ///
  /// In ru, this message translates to:
  /// **'В пути: '**
  String get onWay;

  /// No description provided for @placesLeft.
  ///
  /// In ru, this message translates to:
  /// **'Осталось мест: '**
  String get placesLeft;

  /// No description provided for @primaryDetailsMessage.
  ///
  /// In ru, this message translates to:
  /// **'Отправление и прибытие по местному времени'**
  String get primaryDetailsMessage;

  /// No description provided for @profile.
  ///
  /// In ru, this message translates to:
  /// **'Профиль'**
  String get profile;

  /// No description provided for @returnConditions.
  ///
  /// In ru, this message translates to:
  /// **'Условия возврата'**
  String get returnConditions;

  /// No description provided for @search.
  ///
  /// In ru, this message translates to:
  /// **'Поиск'**
  String get search;

  /// No description provided for @secondaryDetailsMessage.
  ///
  /// In ru, this message translates to:
  /// **'Перевозчик имеет право заменить транспортное средство, в случае его неисправности, аварии и других аналогичных случаях'**
  String get secondaryDetailsMessage;

  /// No description provided for @transport.
  ///
  /// In ru, this message translates to:
  /// **'Транспорт: '**
  String get transport;

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

  /// No description provided for @waypoints.
  ///
  /// In ru, this message translates to:
  /// **'Промежуточные пункты'**
  String get waypoints;

  /// No description provided for @inquiry.
  ///
  /// In ru, this message translates to:
  /// **'Позвонить или задать вопрос'**
  String get inquiry;

  /// No description provided for @directoryInfo.
  ///
  /// In ru, this message translates to:
  /// **'Справочная информация'**
  String get directoryInfo;

  /// No description provided for @busStationContacts.
  ///
  /// In ru, this message translates to:
  /// **'Контакты автовокзалов'**
  String get busStationContacts;

  /// No description provided for @enterName.
  ///
  /// In ru, this message translates to:
  /// **'Введите имя'**
  String get enterName;

  /// No description provided for @emailExample.
  ///
  /// In ru, this message translates to:
  /// **'example@example.ru'**
  String get emailExample;

  /// No description provided for @enterPhoneNumber.
  ///
  /// In ru, this message translates to:
  /// **'Введите номер телефона'**
  String get enterPhoneNumber;

  /// No description provided for @enterQuestion.
  ///
  /// In ru, this message translates to:
  /// **'Введите вопрос'**
  String get enterQuestion;

  /// No description provided for @askQuestion.
  ///
  /// In ru, this message translates to:
  /// **'Задать вопрос'**
  String get askQuestion;

  /// No description provided for @questionConsentText.
  ///
  /// In ru, this message translates to:
  /// **'Нажимая кнопку “Задать вопрос”, я даю'**
  String get questionConsentText;

  /// No description provided for @personalDataProcessingText.
  ///
  /// In ru, this message translates to:
  /// **'согласие на обработку персональных данных'**
  String get personalDataProcessingText;

  /// No description provided for @call.
  ///
  /// In ru, this message translates to:
  /// **'Позвонить'**
  String get call;

  /// No description provided for @technicalSupportService.
  ///
  /// In ru, this message translates to:
  /// **'Служба технической поддержки'**
  String get technicalSupportService;

  /// No description provided for @centralBusStationHelpline.
  ///
  /// In ru, this message translates to:
  /// **'Справочная Центрального автовокзала'**
  String get centralBusStationHelpline;

  /// No description provided for @ourQualifiedExpertsWillHelp.
  ///
  /// In ru, this message translates to:
  /// **'Наши квалифицированные специалисты обязательно вам помогут.'**
  String get ourQualifiedExpertsWillHelp;

  /// No description provided for @twentyFourHours.
  ///
  /// In ru, this message translates to:
  /// **'круглосуточно'**
  String get twentyFourHours;

  /// No description provided for @dailyFromFiveToTwenty.
  ///
  /// In ru, this message translates to:
  /// **'с 05:00 до 20:00 ежедневно'**
  String get dailyFromFiveToTwenty;

  /// No description provided for @sortByTime.
  ///
  /// In ru, this message translates to:
  /// **'Сортировка по времени'**
  String get sortByTime;

  /// No description provided for @sortByPrice.
  ///
  /// In ru, this message translates to:
  /// **'Сортировка по цене'**
  String get sortByPrice;

  /// No description provided for @passport.
  ///
  /// In ru, this message translates to:
  /// **'Паспорт'**
  String get passport;

  /// No description provided for @internationalPassport.
  ///
  /// In ru, this message translates to:
  /// **'Заграничный паспорт'**
  String get internationalPassport;

  /// No description provided for @birthCertificate.
  ///
  /// In ru, this message translates to:
  /// **'Свидетельство о рождении'**
  String get birthCertificate;

  /// No description provided for @childish.
  ///
  /// In ru, this message translates to:
  /// **'Детский '**
  String get childish;

  /// No description provided for @passengers.
  ///
  /// In ru, this message translates to:
  /// **'Пассажирский'**
  String get passengers;

  /// No description provided for @version.
  ///
  /// In ru, this message translates to:
  /// **'Версия:'**
  String get version;

  /// No description provided for @upcoming.
  ///
  /// In ru, this message translates to:
  /// **'Предстоящие'**
  String get upcoming;

  /// No description provided for @completed.
  ///
  /// In ru, this message translates to:
  /// **'Завершенные'**
  String get completed;

  /// No description provided for @archived.
  ///
  /// In ru, this message translates to:
  /// **'Архив'**
  String get archived;

  /// No description provided for @refund.
  ///
  /// In ru, this message translates to:
  /// **'Возврат'**
  String get refund;

  /// No description provided for @signInToViewHistory.
  ///
  /// In ru, this message translates to:
  /// **'Зарегистрируйтесь, чтобы посмотреть свою историю билетов'**
  String get signInToViewHistory;

  /// No description provided for @noUpcomingTrips.
  ///
  /// In ru, this message translates to:
  /// **'У вас пока нет предстоящих поездок'**
  String get noUpcomingTrips;

  /// No description provided for @pay.
  ///
  /// In ru, this message translates to:
  /// **'Оплатить'**
  String get pay;

  /// No description provided for @seat.
  ///
  /// In ru, this message translates to:
  /// **'Место'**
  String get seat;

  /// No description provided for @inTransit.
  ///
  /// In ru, this message translates to:
  /// **'В пути'**
  String get inTransit;

  /// No description provided for @awaitingPayment.
  ///
  /// In ru, this message translates to:
  /// **'Ожидает оплаты'**
  String get awaitingPayment;

  /// No description provided for @deleteOrder.
  ///
  /// In ru, this message translates to:
  /// **'Удалить заказ'**
  String get deleteOrder;

  /// No description provided for @bookingExpired.
  ///
  /// In ru, this message translates to:
  /// **'Бронь истекла'**
  String get bookingExpired;

  /// No description provided for @rebookOrder.
  ///
  /// In ru, this message translates to:
  /// **'Переоформить заказ'**
  String get rebookOrder;

  /// No description provided for @noCompletedTrips.
  ///
  /// In ru, this message translates to:
  /// **'У вас пока нет завершенных поездок'**
  String get noCompletedTrips;

  /// No description provided for @paid.
  ///
  /// In ru, this message translates to:
  /// **'Оплачено'**
  String get paid;

  /// No description provided for @downloadTicket.
  ///
  /// In ru, this message translates to:
  /// **'Скачать билет'**
  String get downloadTicket;

  /// No description provided for @more.
  ///
  /// In ru, this message translates to:
  /// **'Еще'**
  String get more;

  /// No description provided for @sendToEmail.
  ///
  /// In ru, this message translates to:
  /// **'Отправить на E-mail'**
  String get sendToEmail;

  /// No description provided for @downloadPurchaseReceipt.
  ///
  /// In ru, this message translates to:
  /// **'Скачать чек покупки'**
  String get downloadPurchaseReceipt;

  /// No description provided for @refundTicket.
  ///
  /// In ru, this message translates to:
  /// **'Вернуть билет'**
  String get refundTicket;

  /// No description provided for @downloadTicketAgain.
  ///
  /// In ru, this message translates to:
  /// **'Скачать билет еще раз'**
  String get downloadTicketAgain;

  /// No description provided for @refundProcessed.
  ///
  /// In ru, this message translates to:
  /// **'Произведен возврат'**
  String get refundProcessed;

  /// No description provided for @downloadRefundReceipt.
  ///
  /// In ru, this message translates to:
  /// **'Скачать чек возврата'**
  String get downloadRefundReceipt;

  /// No description provided for @carrierRights.
  ///
  /// In ru, this message translates to:
  /// **'Перевозчик имеет право заменить транспортное средство в случае его неисправности, аварии и других аналогичных случаях'**
  String get carrierRights;

  /// No description provided for @passenger.
  ///
  /// In ru, this message translates to:
  /// **'Пассажиры'**
  String get passenger;

  /// No description provided for @orderPayment.
  ///
  /// In ru, this message translates to:
  /// **'Оплата заказа'**
  String get orderPayment;

  /// No description provided for @tariff.
  ///
  /// In ru, this message translates to:
  /// **'Тариф'**
  String get tariff;

  /// No description provided for @commission.
  ///
  /// In ru, this message translates to:
  /// **'Комиссия'**
  String get commission;

  /// No description provided for @total.
  ///
  /// In ru, this message translates to:
  /// **'Итого'**
  String get total;

  /// No description provided for @payWithCard.
  ///
  /// In ru, this message translates to:
  /// **'Оплатить банковской картой'**
  String get payWithCard;

  /// No description provided for @provideEmail.
  ///
  /// In ru, this message translates to:
  /// **'Укажите e-mail для отправки заказа'**
  String get provideEmail;

  /// No description provided for @cancel.
  ///
  /// In ru, this message translates to:
  /// **'Отмена'**
  String get cancel;

  /// No description provided for @ok.
  ///
  /// In ru, this message translates to:
  /// **'ОК'**
  String get ok;

  /// No description provided for @confirmOrderReturn.
  ///
  /// In ru, this message translates to:
  /// **'Вы точно хотите вернуть заказ?'**
  String get confirmOrderReturn;

  /// No description provided for @orderReturnSuccess.
  ///
  /// In ru, this message translates to:
  /// **'Возврат успешно произведен'**
  String get orderReturnSuccess;

  /// No description provided for @refundedToCard.
  ///
  /// In ru, this message translates to:
  /// **'Возвращено на карту'**
  String get refundedToCard;

  /// No description provided for @confirmOrderChange.
  ///
  /// In ru, this message translates to:
  /// **'Вы точно хотите переоформить заказ?'**
  String get confirmOrderChange;

  /// No description provided for @confirmOrderDeletion.
  ///
  /// In ru, this message translates to:
  /// **'Вы действительно хотите удалить этот заказ?'**
  String get confirmOrderDeletion;

  /// No description provided for @minutes.
  ///
  /// In ru, this message translates to:
  /// **'{count, plural, =0{0 минут} =1{{count} минуту} =2{{count} минуты} few{{count} минуты} many{{count} минут} other{{count} минут}}'**
  String minutes(num count);

  /// No description provided for @bookingEndsIn.
  ///
  /// In ru, this message translates to:
  /// **'Бронь закончится через'**
  String get bookingEndsIn;

  /// No description provided for @somethingWentWrong.
  ///
  /// In ru, this message translates to:
  /// **'Что-то пошло не так'**
  String get somethingWentWrong;
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
