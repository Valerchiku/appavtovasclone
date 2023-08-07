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
  static const List<Locale> supportedLocales = <Locale>[Locale('ru')];

  /// No description provided for @accept.
  ///
  /// In ru, this message translates to:
  /// **'Подтвердить'**
  String get accept;

  /// No description provided for @adult.
  ///
  /// In ru, this message translates to:
  /// **'Взрослый'**
  String get adult;

  /// No description provided for @authorizationWarning.
  ///
  /// In ru, this message translates to:
  /// **'Вы уверены, что хотите продолжить с номером {number} ?'**
  String authorizationWarning(Object number);

  /// No description provided for @authorizationTitle.
  ///
  /// In ru, this message translates to:
  /// **'Войти в личный кабинет'**
  String get authorizationTitle;

  /// No description provided for @authorizationSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Вам будут доступны операции со всеми билетами, которые вы покапали на этот номер'**
  String get authorizationSubtitle;

  /// No description provided for @authorizationErrorMessage.
  ///
  /// In ru, this message translates to:
  /// **'Некорректное значение.\nПроверьте введённый номер телефона!'**
  String get authorizationErrorMessage;

  /// No description provided for @authorizationFirstSuggestion.
  ///
  /// In ru, this message translates to:
  /// **'Продолжая, вы соглашаетесь '**
  String get authorizationFirstSuggestion;

  /// No description provided for @authorizationLastSuggestion.
  ///
  /// In ru, this message translates to:
  /// **'со сбором и обработкой персональных данных'**
  String get authorizationLastSuggestion;

  /// No description provided for @authorizationSubtitleWithNumber.
  ///
  /// In ru, this message translates to:
  /// **'Введите код, отправленный на номер\n{number}'**
  String authorizationSubtitleWithNumber(Object number);

  /// No description provided for @authorizationWaitMessage.
  ///
  /// In ru, this message translates to:
  /// **'Ожидание {count} сек.'**
  String authorizationWaitMessage(Object count);

  /// No description provided for @authorizationSendSms.
  ///
  /// In ru, this message translates to:
  /// **'Выслать код в СМС'**
  String get authorizationSendSms;

  /// No description provided for @aboutApp.
  ///
  /// In ru, this message translates to:
  /// **'О приложении'**
  String get aboutApp;

  /// No description provided for @addPassenger.
  ///
  /// In ru, this message translates to:
  /// **'Добавить пассажира'**
  String get addPassenger;

  /// No description provided for @buyTicket.
  ///
  /// In ru, this message translates to:
  /// **'Купить билет'**
  String get buyTicket;

  /// No description provided for @buyFor.
  ///
  /// In ru, this message translates to:
  /// **'Купить за {price}'**
  String buyFor(Object price);

  /// No description provided for @carrier.
  ///
  /// In ru, this message translates to:
  /// **'Перевозчик'**
  String get carrier;

  /// No description provided for @clearSearchHistory.
  ///
  /// In ru, this message translates to:
  /// **'Очистить историю поиска'**
  String get clearSearchHistory;

  /// No description provided for @date.
  ///
  /// In ru, this message translates to:
  /// **'Дата'**
  String get date;

  /// No description provided for @document.
  ///
  /// In ru, this message translates to:
  /// **'Документ'**
  String get document;

  /// No description provided for @exit.
  ///
  /// In ru, this message translates to:
  /// **'Выйти'**
  String get exit;

  /// No description provided for @exitWarning.
  ///
  /// In ru, this message translates to:
  /// **'Вы уверены, что хотите выйти?'**
  String get exitWarning;

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

  /// No description provided for @from.
  ///
  /// In ru, this message translates to:
  /// **'Откуда'**
  String get from;

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

  /// No description provided for @gender.
  ///
  /// In ru, this message translates to:
  /// **'Пол'**
  String get gender;

  /// No description provided for @passengerAmount.
  ///
  /// In ru, this message translates to:
  /// **'Пассажир {count}'**
  String passengerAmount(Object count);

  /// No description provided for @selectPassenger.
  ///
  /// In ru, this message translates to:
  /// **'Выбрать пассажира'**
  String get selectPassenger;

  /// No description provided for @firstName.
  ///
  /// In ru, this message translates to:
  /// **'Имя'**
  String get firstName;

  /// No description provided for @lastName.
  ///
  /// In ru, this message translates to:
  /// **'Фамилия'**
  String get lastName;

  /// No description provided for @surname.
  ///
  /// In ru, this message translates to:
  /// **'Отчество'**
  String get surname;

  /// No description provided for @noSurname.
  ///
  /// In ru, this message translates to:
  /// **'Нет отчества'**
  String get noSurname;

  /// No description provided for @birthdayDate.
  ///
  /// In ru, this message translates to:
  /// **'Дата рождения'**
  String get birthdayDate;

  /// No description provided for @seriesAndNumber.
  ///
  /// In ru, this message translates to:
  /// **'Серия и номер'**
  String get seriesAndNumber;

  /// No description provided for @priceByRate.
  ///
  /// In ru, this message translates to:
  /// **'priceByRate'**
  String get priceByRate;

  /// No description provided for @total.
  ///
  /// In ru, this message translates to:
  /// **'Итого'**
  String get total;

  /// No description provided for @onWay.
  ///
  /// In ru, this message translates to:
  /// **'В пути: '**
  String get onWay;

  /// No description provided for @paymentHistory.
  ///
  /// In ru, this message translates to:
  /// **'История платежей'**
  String get paymentHistory;

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

  /// No description provided for @mainSearchTitle.
  ///
  /// In ru, this message translates to:
  /// **'Билеты на автобусы\nЧувашии'**
  String get mainSearchTitle;

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

  /// No description provided for @passengersTitle.
  ///
  /// In ru, this message translates to:
  /// **'Пассажиры'**
  String get passengersTitle;

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

  /// No description provided for @incorrectPhoneValue.
  ///
  /// In ru, this message translates to:
  /// **'Введёно некорректное значение. Введите реальный номер телефона, на который придёт СМС-сообщение с кодом подтверждения'**
  String get incorrectPhoneValue;

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

  /// No description provided for @emailSenderTitle.
  ///
  /// In ru, this message translates to:
  /// **'Укажите Ваш E-mail для отправки билета и чека'**
  String get emailSenderTitle;

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

  /// No description provided for @previouslySearched.
  ///
  /// In ru, this message translates to:
  /// **'Ранее искали'**
  String get previouslySearched;

  /// No description provided for @call.
  ///
  /// In ru, this message translates to:
  /// **'Позвонить'**
  String get call;

  /// No description provided for @citizenship.
  ///
  /// In ru, this message translates to:
  /// **'Гражданство'**
  String get citizenship;

  /// No description provided for @technicalSupportService.
  ///
  /// In ru, this message translates to:
  /// **'Служба технической поддержки'**
  String get technicalSupportService;

  /// No description provided for @to.
  ///
  /// In ru, this message translates to:
  /// **'Куда'**
  String get to;

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

  /// No description provided for @sendSMS.
  ///
  /// In ru, this message translates to:
  /// **'Выслать код в СМС'**
  String get sendSMS;

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

  /// No description provided for @male.
  ///
  /// In ru, this message translates to:
  /// **'Мужской'**
  String get male;

  /// No description provided for @female.
  ///
  /// In ru, this message translates to:
  /// **'Женский'**
  String get female;

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

  /// No description provided for @sendPushNotificationsBeforeRace.
  ///
  /// In ru, this message translates to:
  /// **'Присылать push-уведомления за час\nдо отправления рейса'**
  String get sendPushNotificationsBeforeRace;

  /// No description provided for @version.
  ///
  /// In ru, this message translates to:
  /// **'Версия:'**
  String get version;

  /// No description provided for @emptyPaymentsHistoryTitle.
  ///
  /// In ru, this message translates to:
  /// **'Здесь будет история платежей после покупки'**
  String get emptyPaymentsHistoryTitle;

  /// No description provided for @main.
  ///
  /// In ru, this message translates to:
  /// **'Главная'**
  String get main;

  /// No description provided for @paymentsHistoryTitle.
  ///
  /// In ru, this message translates to:
  /// **'История платежей'**
  String get paymentsHistoryTitle;

  /// No description provided for @rate.
  ///
  /// In ru, this message translates to:
  /// **'Тариф'**
  String get rate;

  /// No description provided for @schedule.
  ///
  /// In ru, this message translates to:
  /// **'Расписание'**
  String get schedule;

  /// No description provided for @upcoming.
  ///
  /// In ru, this message translates to:
  /// **'Предстоящие'**
  String get upcoming;

  /// No description provided for @useThat.
  ///
  /// In ru, this message translates to:
  /// **'Использовать этот: {email}'**
  String useThat(Object email);

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

  /// No description provided for @notifications.
  ///
  /// In ru, this message translates to:
  /// **'Уведомления'**
  String get notifications;

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

  /// No description provided for @passportRf.
  ///
  /// In ru, this message translates to:
  /// **'Паспорт рф'**
  String get passportRf;

  /// No description provided for @anotherPassport.
  ///
  /// In ru, this message translates to:
  /// **'Паспорт иной страны'**
  String get anotherPassport;

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

  /// No description provided for @referenceInformation.
  ///
  /// In ru, this message translates to:
  /// **'Справочная информация'**
  String get referenceInformation;

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

  /// No description provided for @termAndConditions.
  ///
  /// In ru, this message translates to:
  /// **'Положения и условия'**
  String get termAndConditions;

  /// No description provided for @commission.
  ///
  /// In ru, this message translates to:
  /// **'Комиссия'**
  String get commission;

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

  /// No description provided for @about.
  ///
  /// In ru, this message translates to:
  /// **'О приложении'**
  String get about;

  /// No description provided for @afghanistan.
  ///
  /// In ru, this message translates to:
  /// **'Афганистан'**
  String get afghanistan;

  /// No description provided for @albania.
  ///
  /// In ru, this message translates to:
  /// **'Албания'**
  String get albania;

  /// No description provided for @algeria.
  ///
  /// In ru, this message translates to:
  /// **'Алжир'**
  String get algeria;

  /// No description provided for @andorra.
  ///
  /// In ru, this message translates to:
  /// **'Андорра'**
  String get andorra;

  /// No description provided for @angola.
  ///
  /// In ru, this message translates to:
  /// **'Ангола'**
  String get angola;

  /// No description provided for @antiguaAndBarbuda.
  ///
  /// In ru, this message translates to:
  /// **'Антигуа и Барбуда'**
  String get antiguaAndBarbuda;

  /// No description provided for @argentina.
  ///
  /// In ru, this message translates to:
  /// **'Аргентина'**
  String get argentina;

  /// No description provided for @armenia.
  ///
  /// In ru, this message translates to:
  /// **'Армения'**
  String get armenia;

  /// No description provided for @australia.
  ///
  /// In ru, this message translates to:
  /// **'Австралия'**
  String get australia;

  /// No description provided for @austria.
  ///
  /// In ru, this message translates to:
  /// **'Австрия'**
  String get austria;

  /// No description provided for @azerbaijan.
  ///
  /// In ru, this message translates to:
  /// **'Азербайджан'**
  String get azerbaijan;

  /// No description provided for @bahamas.
  ///
  /// In ru, this message translates to:
  /// **'Багамы'**
  String get bahamas;

  /// No description provided for @bahrain.
  ///
  /// In ru, this message translates to:
  /// **'Бахрейн'**
  String get bahrain;

  /// No description provided for @bangladesh.
  ///
  /// In ru, this message translates to:
  /// **'Бангладеш'**
  String get bangladesh;

  /// No description provided for @barbados.
  ///
  /// In ru, this message translates to:
  /// **'Барбадос'**
  String get barbados;

  /// No description provided for @belarus.
  ///
  /// In ru, this message translates to:
  /// **'Беларусь'**
  String get belarus;

  /// No description provided for @belgium.
  ///
  /// In ru, this message translates to:
  /// **'Бельгия'**
  String get belgium;

  /// No description provided for @belize.
  ///
  /// In ru, this message translates to:
  /// **'Белиз'**
  String get belize;

  /// No description provided for @benin.
  ///
  /// In ru, this message translates to:
  /// **'Бенин'**
  String get benin;

  /// No description provided for @bhutan.
  ///
  /// In ru, this message translates to:
  /// **'Бутан'**
  String get bhutan;

  /// No description provided for @bolivia.
  ///
  /// In ru, this message translates to:
  /// **'Боливия'**
  String get bolivia;

  /// No description provided for @bosniaAndHerzegovina.
  ///
  /// In ru, this message translates to:
  /// **'Босния и Герцеговина'**
  String get bosniaAndHerzegovina;

  /// No description provided for @botswana.
  ///
  /// In ru, this message translates to:
  /// **'Ботсвана'**
  String get botswana;

  /// No description provided for @brazil.
  ///
  /// In ru, this message translates to:
  /// **'Бразилия'**
  String get brazil;

  /// No description provided for @brunei.
  ///
  /// In ru, this message translates to:
  /// **'Бруней'**
  String get brunei;

  /// No description provided for @bulgaria.
  ///
  /// In ru, this message translates to:
  /// **'Болгария'**
  String get bulgaria;

  /// No description provided for @burkinaFaso.
  ///
  /// In ru, this message translates to:
  /// **'Буркина-Фасо'**
  String get burkinaFaso;

  /// No description provided for @burundi.
  ///
  /// In ru, this message translates to:
  /// **'Бурунди'**
  String get burundi;

  /// No description provided for @cambodia.
  ///
  /// In ru, this message translates to:
  /// **'Камбоджа'**
  String get cambodia;

  /// No description provided for @cameroon.
  ///
  /// In ru, this message translates to:
  /// **'Камерун'**
  String get cameroon;

  /// No description provided for @canada.
  ///
  /// In ru, this message translates to:
  /// **'Канада'**
  String get canada;

  /// No description provided for @capeVerde.
  ///
  /// In ru, this message translates to:
  /// **'Кабо-Верде'**
  String get capeVerde;

  /// No description provided for @centralAfricanRepublic.
  ///
  /// In ru, this message translates to:
  /// **'Центральноафриканская Республика'**
  String get centralAfricanRepublic;

  /// No description provided for @chad.
  ///
  /// In ru, this message translates to:
  /// **'Чад'**
  String get chad;

  /// No description provided for @chile.
  ///
  /// In ru, this message translates to:
  /// **'Чили'**
  String get chile;

  /// No description provided for @china.
  ///
  /// In ru, this message translates to:
  /// **'Китай'**
  String get china;

  /// No description provided for @colombia.
  ///
  /// In ru, this message translates to:
  /// **'Колумбия'**
  String get colombia;

  /// No description provided for @comoros.
  ///
  /// In ru, this message translates to:
  /// **'Коморы'**
  String get comoros;

  /// No description provided for @congoDemocraticRepublic.
  ///
  /// In ru, this message translates to:
  /// **'Демократическая Республика Конго'**
  String get congoDemocraticRepublic;

  /// No description provided for @congo.
  ///
  /// In ru, this message translates to:
  /// **'Республика Конго'**
  String get congo;

  /// No description provided for @costaRica.
  ///
  /// In ru, this message translates to:
  /// **'Коста-Рика'**
  String get costaRica;

  /// No description provided for @coteDIvoire.
  ///
  /// In ru, this message translates to:
  /// **'Кот-д’Ивуар'**
  String get coteDIvoire;

  /// No description provided for @croatia.
  ///
  /// In ru, this message translates to:
  /// **'Хорватия'**
  String get croatia;

  /// No description provided for @cuba.
  ///
  /// In ru, this message translates to:
  /// **'Куба'**
  String get cuba;

  /// No description provided for @cyprus.
  ///
  /// In ru, this message translates to:
  /// **'Кипр'**
  String get cyprus;

  /// No description provided for @czechia.
  ///
  /// In ru, this message translates to:
  /// **'Чехия'**
  String get czechia;

  /// No description provided for @denmark.
  ///
  /// In ru, this message translates to:
  /// **'Дания'**
  String get denmark;

  /// No description provided for @djibouti.
  ///
  /// In ru, this message translates to:
  /// **'Джибути'**
  String get djibouti;

  /// No description provided for @dominica.
  ///
  /// In ru, this message translates to:
  /// **'Доминика'**
  String get dominica;

  /// No description provided for @dominicanRepublic.
  ///
  /// In ru, this message translates to:
  /// **'Доминиканская Республика'**
  String get dominicanRepublic;

  /// No description provided for @ecuador.
  ///
  /// In ru, this message translates to:
  /// **'Эквадор'**
  String get ecuador;

  /// No description provided for @egypt.
  ///
  /// In ru, this message translates to:
  /// **'Египет'**
  String get egypt;

  /// No description provided for @elSalvador.
  ///
  /// In ru, this message translates to:
  /// **'Сальвадор'**
  String get elSalvador;

  /// No description provided for @equatorialGuinea.
  ///
  /// In ru, this message translates to:
  /// **'Экваториальная Гвинея'**
  String get equatorialGuinea;

  /// No description provided for @eritrea.
  ///
  /// In ru, this message translates to:
  /// **'Эритрея'**
  String get eritrea;

  /// No description provided for @estonia.
  ///
  /// In ru, this message translates to:
  /// **'Эстония'**
  String get estonia;

  /// No description provided for @eswatini.
  ///
  /// In ru, this message translates to:
  /// **'Эсватини'**
  String get eswatini;

  /// No description provided for @ethiopia.
  ///
  /// In ru, this message translates to:
  /// **'Эфиопия'**
  String get ethiopia;

  /// No description provided for @fiji.
  ///
  /// In ru, this message translates to:
  /// **'Фиджи'**
  String get fiji;

  /// No description provided for @finland.
  ///
  /// In ru, this message translates to:
  /// **'Финляндия'**
  String get finland;

  /// No description provided for @france.
  ///
  /// In ru, this message translates to:
  /// **'Франция'**
  String get france;

  /// No description provided for @gabon.
  ///
  /// In ru, this message translates to:
  /// **'Габон'**
  String get gabon;

  /// No description provided for @gambia.
  ///
  /// In ru, this message translates to:
  /// **'Гамбия'**
  String get gambia;

  /// No description provided for @georgia.
  ///
  /// In ru, this message translates to:
  /// **'Грузия'**
  String get georgia;

  /// No description provided for @germany.
  ///
  /// In ru, this message translates to:
  /// **'Германия'**
  String get germany;

  /// No description provided for @ghana.
  ///
  /// In ru, this message translates to:
  /// **'Гана'**
  String get ghana;

  /// No description provided for @greece.
  ///
  /// In ru, this message translates to:
  /// **'Греция'**
  String get greece;

  /// No description provided for @grenada.
  ///
  /// In ru, this message translates to:
  /// **'Гренада'**
  String get grenada;

  /// No description provided for @guatemala.
  ///
  /// In ru, this message translates to:
  /// **'Гватемала'**
  String get guatemala;

  /// No description provided for @guinea.
  ///
  /// In ru, this message translates to:
  /// **'Гвинея'**
  String get guinea;

  /// No description provided for @guineaBissau.
  ///
  /// In ru, this message translates to:
  /// **'Гвинея-Бисау'**
  String get guineaBissau;

  /// No description provided for @guyana.
  ///
  /// In ru, this message translates to:
  /// **'Гайана'**
  String get guyana;

  /// No description provided for @haiti.
  ///
  /// In ru, this message translates to:
  /// **'Гаити'**
  String get haiti;

  /// No description provided for @honduras.
  ///
  /// In ru, this message translates to:
  /// **'Гондурас'**
  String get honduras;

  /// No description provided for @hungary.
  ///
  /// In ru, this message translates to:
  /// **'Венгрия'**
  String get hungary;

  /// No description provided for @iceland.
  ///
  /// In ru, this message translates to:
  /// **'Исландия'**
  String get iceland;

  /// No description provided for @india.
  ///
  /// In ru, this message translates to:
  /// **'Индия'**
  String get india;

  /// No description provided for @indonesia.
  ///
  /// In ru, this message translates to:
  /// **'Индонезия'**
  String get indonesia;

  /// No description provided for @iran.
  ///
  /// In ru, this message translates to:
  /// **'Иран'**
  String get iran;

  /// No description provided for @iraq.
  ///
  /// In ru, this message translates to:
  /// **'Ирак'**
  String get iraq;

  /// No description provided for @ireland.
  ///
  /// In ru, this message translates to:
  /// **'Ирландия'**
  String get ireland;

  /// No description provided for @israel.
  ///
  /// In ru, this message translates to:
  /// **'Израиль'**
  String get israel;

  /// No description provided for @italy.
  ///
  /// In ru, this message translates to:
  /// **'Италия'**
  String get italy;

  /// No description provided for @jamaica.
  ///
  /// In ru, this message translates to:
  /// **'Ямайка'**
  String get jamaica;

  /// No description provided for @japan.
  ///
  /// In ru, this message translates to:
  /// **'Япония'**
  String get japan;

  /// No description provided for @jordan.
  ///
  /// In ru, this message translates to:
  /// **'Иордания'**
  String get jordan;

  /// No description provided for @kazakhstan.
  ///
  /// In ru, this message translates to:
  /// **'Казахстан'**
  String get kazakhstan;

  /// No description provided for @kenya.
  ///
  /// In ru, this message translates to:
  /// **'Кения'**
  String get kenya;

  /// No description provided for @kiribati.
  ///
  /// In ru, this message translates to:
  /// **'Кирибати'**
  String get kiribati;

  /// No description provided for @kuwait.
  ///
  /// In ru, this message translates to:
  /// **'Кувейт'**
  String get kuwait;

  /// No description provided for @kyrgyzstan.
  ///
  /// In ru, this message translates to:
  /// **'Киргизия'**
  String get kyrgyzstan;

  /// No description provided for @laos.
  ///
  /// In ru, this message translates to:
  /// **'Лаос'**
  String get laos;

  /// No description provided for @latvia.
  ///
  /// In ru, this message translates to:
  /// **'Латвия'**
  String get latvia;

  /// No description provided for @lebanon.
  ///
  /// In ru, this message translates to:
  /// **'Ливан'**
  String get lebanon;

  /// No description provided for @lesotho.
  ///
  /// In ru, this message translates to:
  /// **'Лесото'**
  String get lesotho;

  /// No description provided for @liberia.
  ///
  /// In ru, this message translates to:
  /// **'Либерия'**
  String get liberia;

  /// No description provided for @libya.
  ///
  /// In ru, this message translates to:
  /// **'Ливия'**
  String get libya;

  /// No description provided for @liechtenstein.
  ///
  /// In ru, this message translates to:
  /// **'Лихтенштейн'**
  String get liechtenstein;

  /// No description provided for @lithuania.
  ///
  /// In ru, this message translates to:
  /// **'Литва'**
  String get lithuania;

  /// No description provided for @luxembourg.
  ///
  /// In ru, this message translates to:
  /// **'Люксембург'**
  String get luxembourg;

  /// No description provided for @madagascar.
  ///
  /// In ru, this message translates to:
  /// **'Мадагаскар'**
  String get madagascar;

  /// No description provided for @malawi.
  ///
  /// In ru, this message translates to:
  /// **'Малави'**
  String get malawi;

  /// No description provided for @malaysia.
  ///
  /// In ru, this message translates to:
  /// **'Малайзия'**
  String get malaysia;

  /// No description provided for @maldives.
  ///
  /// In ru, this message translates to:
  /// **'Мальдивы'**
  String get maldives;

  /// No description provided for @mali.
  ///
  /// In ru, this message translates to:
  /// **'Мали'**
  String get mali;

  /// No description provided for @malta.
  ///
  /// In ru, this message translates to:
  /// **'Мальта'**
  String get malta;

  /// No description provided for @marshallIslands.
  ///
  /// In ru, this message translates to:
  /// **'Маршалловы Острова'**
  String get marshallIslands;

  /// No description provided for @mauritania.
  ///
  /// In ru, this message translates to:
  /// **'Мавритания'**
  String get mauritania;

  /// No description provided for @mauritius.
  ///
  /// In ru, this message translates to:
  /// **'Маврикий'**
  String get mauritius;

  /// No description provided for @mexico.
  ///
  /// In ru, this message translates to:
  /// **'Мексика'**
  String get mexico;

  /// No description provided for @micronesia.
  ///
  /// In ru, this message translates to:
  /// **'Микронезия'**
  String get micronesia;

  /// No description provided for @moldova.
  ///
  /// In ru, this message translates to:
  /// **'Молдавия'**
  String get moldova;

  /// No description provided for @monaco.
  ///
  /// In ru, this message translates to:
  /// **'Монако'**
  String get monaco;

  /// No description provided for @mongolia.
  ///
  /// In ru, this message translates to:
  /// **'Монголия'**
  String get mongolia;

  /// No description provided for @montenegro.
  ///
  /// In ru, this message translates to:
  /// **'Черногория'**
  String get montenegro;

  /// No description provided for @morocco.
  ///
  /// In ru, this message translates to:
  /// **'Марокко'**
  String get morocco;

  /// No description provided for @mozambique.
  ///
  /// In ru, this message translates to:
  /// **'Мозамбик'**
  String get mozambique;

  /// No description provided for @myanmar.
  ///
  /// In ru, this message translates to:
  /// **'Мьянма'**
  String get myanmar;

  /// No description provided for @namibia.
  ///
  /// In ru, this message translates to:
  /// **'Намибия'**
  String get namibia;

  /// No description provided for @nauru.
  ///
  /// In ru, this message translates to:
  /// **'Науру'**
  String get nauru;

  /// No description provided for @nepal.
  ///
  /// In ru, this message translates to:
  /// **'Непал'**
  String get nepal;

  /// No description provided for @netherlands.
  ///
  /// In ru, this message translates to:
  /// **'Нидерланды'**
  String get netherlands;

  /// No description provided for @newZealand.
  ///
  /// In ru, this message translates to:
  /// **'Новая Зеландия'**
  String get newZealand;

  /// No description provided for @nicaragua.
  ///
  /// In ru, this message translates to:
  /// **'Никарагуа'**
  String get nicaragua;

  /// No description provided for @niger.
  ///
  /// In ru, this message translates to:
  /// **'Нигер'**
  String get niger;

  /// No description provided for @nigeria.
  ///
  /// In ru, this message translates to:
  /// **'Нигерия'**
  String get nigeria;

  /// No description provided for @northKorea.
  ///
  /// In ru, this message translates to:
  /// **'Северная Корея'**
  String get northKorea;

  /// No description provided for @northMacedonia.
  ///
  /// In ru, this message translates to:
  /// **'Северная Македония'**
  String get northMacedonia;

  /// No description provided for @norway.
  ///
  /// In ru, this message translates to:
  /// **'Норвегия'**
  String get norway;

  /// No description provided for @oman.
  ///
  /// In ru, this message translates to:
  /// **'Оман'**
  String get oman;

  /// No description provided for @pakistan.
  ///
  /// In ru, this message translates to:
  /// **'Пакистан'**
  String get pakistan;

  /// No description provided for @palau.
  ///
  /// In ru, this message translates to:
  /// **'Палау'**
  String get palau;

  /// No description provided for @panama.
  ///
  /// In ru, this message translates to:
  /// **'Панама'**
  String get panama;

  /// No description provided for @papuaNewGuinea.
  ///
  /// In ru, this message translates to:
  /// **'Папуа-Новая Гвинея'**
  String get papuaNewGuinea;

  /// No description provided for @paraguay.
  ///
  /// In ru, this message translates to:
  /// **'Парагвай'**
  String get paraguay;

  /// No description provided for @peru.
  ///
  /// In ru, this message translates to:
  /// **'Перу'**
  String get peru;

  /// No description provided for @philippines.
  ///
  /// In ru, this message translates to:
  /// **'Филиппины'**
  String get philippines;

  /// No description provided for @poland.
  ///
  /// In ru, this message translates to:
  /// **'Польша'**
  String get poland;

  /// No description provided for @portugal.
  ///
  /// In ru, this message translates to:
  /// **'Португалия'**
  String get portugal;

  /// No description provided for @qatar.
  ///
  /// In ru, this message translates to:
  /// **'Катар'**
  String get qatar;

  /// No description provided for @republicOfTheCongo.
  ///
  /// In ru, this message translates to:
  /// **'Республика Конго'**
  String get republicOfTheCongo;

  /// No description provided for @romania.
  ///
  /// In ru, this message translates to:
  /// **'Румыния'**
  String get romania;

  /// No description provided for @russia.
  ///
  /// In ru, this message translates to:
  /// **'Россия'**
  String get russia;

  /// No description provided for @rwanda.
  ///
  /// In ru, this message translates to:
  /// **'Руанда'**
  String get rwanda;

  /// No description provided for @saintKittsAndNevis.
  ///
  /// In ru, this message translates to:
  /// **'Сент-Китс и Невис'**
  String get saintKittsAndNevis;

  /// No description provided for @saintLucia.
  ///
  /// In ru, this message translates to:
  /// **'Сент-Люсия'**
  String get saintLucia;

  /// No description provided for @saintVincentAndTheGrenadines.
  ///
  /// In ru, this message translates to:
  /// **'Сент-Винсент и Гренадины'**
  String get saintVincentAndTheGrenadines;

  /// No description provided for @samoa.
  ///
  /// In ru, this message translates to:
  /// **'Самоа'**
  String get samoa;

  /// No description provided for @sanMarino.
  ///
  /// In ru, this message translates to:
  /// **'Сан-Марино'**
  String get sanMarino;

  /// No description provided for @saoTomeAndPrincipe.
  ///
  /// In ru, this message translates to:
  /// **'Сан-Томе и Принсипи'**
  String get saoTomeAndPrincipe;

  /// No description provided for @saudiArabia.
  ///
  /// In ru, this message translates to:
  /// **'Саудовская Аравия'**
  String get saudiArabia;

  /// No description provided for @senegal.
  ///
  /// In ru, this message translates to:
  /// **'Сенегал'**
  String get senegal;

  /// No description provided for @serbia.
  ///
  /// In ru, this message translates to:
  /// **'Сербия'**
  String get serbia;

  /// No description provided for @seychelles.
  ///
  /// In ru, this message translates to:
  /// **'Сейшельские острова'**
  String get seychelles;

  /// No description provided for @sierraLeone.
  ///
  /// In ru, this message translates to:
  /// **'Сьерра-Леоне'**
  String get sierraLeone;

  /// No description provided for @singapore.
  ///
  /// In ru, this message translates to:
  /// **'Сингапур'**
  String get singapore;

  /// No description provided for @slovakia.
  ///
  /// In ru, this message translates to:
  /// **'Словакия'**
  String get slovakia;

  /// No description provided for @slovenia.
  ///
  /// In ru, this message translates to:
  /// **'Словения'**
  String get slovenia;

  /// No description provided for @solomonIslands.
  ///
  /// In ru, this message translates to:
  /// **'Соломоновы острова'**
  String get solomonIslands;

  /// No description provided for @somalia.
  ///
  /// In ru, this message translates to:
  /// **'Сомали'**
  String get somalia;

  /// No description provided for @southAfrica.
  ///
  /// In ru, this message translates to:
  /// **'Южно-Африканская Республика'**
  String get southAfrica;

  /// No description provided for @southKorea.
  ///
  /// In ru, this message translates to:
  /// **'Южная Корея'**
  String get southKorea;

  /// No description provided for @southSudan.
  ///
  /// In ru, this message translates to:
  /// **'Южный Судан'**
  String get southSudan;

  /// No description provided for @spain.
  ///
  /// In ru, this message translates to:
  /// **'Испания'**
  String get spain;

  /// No description provided for @sriLanka.
  ///
  /// In ru, this message translates to:
  /// **'Шри-Ланка'**
  String get sriLanka;

  /// No description provided for @sudan.
  ///
  /// In ru, this message translates to:
  /// **'Судан'**
  String get sudan;

  /// No description provided for @suriname.
  ///
  /// In ru, this message translates to:
  /// **'Суринам'**
  String get suriname;

  /// No description provided for @sweden.
  ///
  /// In ru, this message translates to:
  /// **'Швеция'**
  String get sweden;

  /// No description provided for @switzerland.
  ///
  /// In ru, this message translates to:
  /// **'Швейцария'**
  String get switzerland;

  /// No description provided for @syria.
  ///
  /// In ru, this message translates to:
  /// **'Сирия'**
  String get syria;

  /// No description provided for @taiwan.
  ///
  /// In ru, this message translates to:
  /// **'Тайвань'**
  String get taiwan;

  /// No description provided for @tajikistan.
  ///
  /// In ru, this message translates to:
  /// **'Таджикистан'**
  String get tajikistan;

  /// No description provided for @tanzania.
  ///
  /// In ru, this message translates to:
  /// **'Танзания'**
  String get tanzania;

  /// No description provided for @thailand.
  ///
  /// In ru, this message translates to:
  /// **'Таиланд'**
  String get thailand;

  /// No description provided for @timorLeste.
  ///
  /// In ru, this message translates to:
  /// **'Восточный Тимор'**
  String get timorLeste;

  /// No description provided for @togo.
  ///
  /// In ru, this message translates to:
  /// **'Того'**
  String get togo;

  /// No description provided for @tonga.
  ///
  /// In ru, this message translates to:
  /// **'Тонга'**
  String get tonga;

  /// No description provided for @trinidadAndTobago.
  ///
  /// In ru, this message translates to:
  /// **'Тринидад и Тобаго'**
  String get trinidadAndTobago;

  /// No description provided for @tunisia.
  ///
  /// In ru, this message translates to:
  /// **'Тунис'**
  String get tunisia;

  /// No description provided for @turkey.
  ///
  /// In ru, this message translates to:
  /// **'Турция'**
  String get turkey;

  /// No description provided for @turkmenistan.
  ///
  /// In ru, this message translates to:
  /// **'Туркменистан'**
  String get turkmenistan;

  /// No description provided for @tuvalu.
  ///
  /// In ru, this message translates to:
  /// **'Тувалу'**
  String get tuvalu;

  /// No description provided for @uganda.
  ///
  /// In ru, this message translates to:
  /// **'Уганда'**
  String get uganda;

  /// No description provided for @ukraine.
  ///
  /// In ru, this message translates to:
  /// **'Украина'**
  String get ukraine;

  /// No description provided for @unitedArabEmirates.
  ///
  /// In ru, this message translates to:
  /// **'Объединенные Арабские Эмираты'**
  String get unitedArabEmirates;

  /// No description provided for @unitedKingdom.
  ///
  /// In ru, this message translates to:
  /// **'Великобритания'**
  String get unitedKingdom;

  /// No description provided for @unitedStates.
  ///
  /// In ru, this message translates to:
  /// **'Соединенные Штаты'**
  String get unitedStates;

  /// No description provided for @uruguay.
  ///
  /// In ru, this message translates to:
  /// **'Уругвай'**
  String get uruguay;

  /// No description provided for @uzbekistan.
  ///
  /// In ru, this message translates to:
  /// **'Узбекистан'**
  String get uzbekistan;

  /// No description provided for @vanuatu.
  ///
  /// In ru, this message translates to:
  /// **'Вануату'**
  String get vanuatu;

  /// No description provided for @vaticanCity.
  ///
  /// In ru, this message translates to:
  /// **'Ватикан'**
  String get vaticanCity;

  /// No description provided for @venezuela.
  ///
  /// In ru, this message translates to:
  /// **'Венесуэла'**
  String get venezuela;

  /// No description provided for @vietnam.
  ///
  /// In ru, this message translates to:
  /// **'Вьетнам'**
  String get vietnam;

  /// No description provided for @yemen.
  ///
  /// In ru, this message translates to:
  /// **'Йемен'**
  String get yemen;

  /// No description provided for @zambia.
  ///
  /// In ru, this message translates to:
  /// **'Замбия'**
  String get zambia;

  /// No description provided for @zimbabwe.
  ///
  /// In ru, this message translates to:
  /// **'Зимбабве'**
  String get zimbabwe;
}

class _AvtovasLocalizationDelegate
    extends LocalizationsDelegate<AvtovasLocalization> {
  const _AvtovasLocalizationDelegate();

  @override
  Future<AvtovasLocalization> load(Locale locale) {
    return SynchronousFuture<AvtovasLocalization>(
        lookupAvtovasLocalization(locale));
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
