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
  /// **'Вам будут доступны операции со всеми билетами, которые вы покупали на этот номер'**
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
  /// **'Введите последние 4 цифры номера телофона, с которого поступит звонок.'**
  String get authorizationSubtitleWithNumber;

  /// No description provided for @authorizationWaitMessage.
  ///
  /// In ru, this message translates to:
  /// **'Ожидание {count} сек.'**
  String authorizationWaitMessage(Object count);

  /// No description provided for @authorizationSendSms.
  ///
  /// In ru, this message translates to:
  /// **'Отправить звонок с кодом'**
  String get authorizationSendSms;

  /// No description provided for @errorCode.
  ///
  /// In ru, this message translates to:
  /// **'Введённый код неверен!\n'**
  String get errorCode;

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

  /// No description provided for @number.
  ///
  /// In ru, this message translates to:
  /// **'Номер'**
  String get number;

  /// No description provided for @priceByRate.
  ///
  /// In ru, this message translates to:
  /// **'Цена по тарифу'**
  String get priceByRate;

  /// No description provided for @total.
  ///
  /// In ru, this message translates to:
  /// **'Итого:'**
  String get total;

  /// No description provided for @tripNumber.
  ///
  /// In ru, this message translates to:
  /// **'Рейс №{value}'**
  String tripNumber(Object value);

  /// No description provided for @price.
  ///
  /// In ru, this message translates to:
  /// **'{value},00 руб.'**
  String price(Object value);

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

  /// No description provided for @infoDeskOfTheCentralBusStation.
  ///
  /// In ru, this message translates to:
  /// **'Справочная Центрального автовокзала'**
  String get infoDeskOfTheCentralBusStation;

  /// No description provided for @controlRoomOfTheCentralBusStation.
  ///
  /// In ru, this message translates to:
  /// **'Диспетчерская Центрального автовокзала'**
  String get controlRoomOfTheCentralBusStation;

  /// No description provided for @support.
  ///
  /// In ru, this message translates to:
  /// **'Служба технической поддержки'**
  String get support;

  /// No description provided for @roundTheClock.
  ///
  /// In ru, this message translates to:
  /// **'Круглосуточно'**
  String get roundTheClock;

  /// No description provided for @contacts.
  ///
  /// In ru, this message translates to:
  /// **'Контакты автовокзалов'**
  String get contacts;

  /// No description provided for @contactsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Контакты'**
  String get contactsTitle;

  /// No description provided for @contactsItem.
  ///
  /// In ru, this message translates to:
  /// **'Чебоксары - Центральный автовокзал'**
  String get contactsItem;

  /// No description provided for @whatTripsAreThere.
  ///
  /// In ru, this message translates to:
  /// **'Какие рейсы есть - рейсы и расписание'**
  String get whatTripsAreThere;

  /// No description provided for @willThereBeATrip.
  ///
  /// In ru, this message translates to:
  /// **'Точно ли будет рейс'**
  String get willThereBeATrip;

  /// No description provided for @howFarInAdvanceDoYouNeedToBuyATicket.
  ///
  /// In ru, this message translates to:
  /// **'Насколько заранее надо покупать билет'**
  String get howFarInAdvanceDoYouNeedToBuyATicket;

  /// No description provided for @howToCalculateTravelTimeAndArrivalTime.
  ///
  /// In ru, this message translates to:
  /// **'Как рассчитать время в пути и время\nприбытия'**
  String get howToCalculateTravelTimeAndArrivalTime;

  /// No description provided for @referenceInfo.
  ///
  /// In ru, this message translates to:
  /// **'Справочная информация'**
  String get referenceInfo;

  /// No description provided for @whatTripsAreThereContent.
  ///
  /// In ru, this message translates to:
  /// **'Воспользуйтесь формой поиска на главной странице нашего сайта: укажите пункт отправления и прибытия, желаемую дату выезда и количество пассажиров и нажмите кнопку “Найти билет”.\nВы увидите список рейсов по выбранному направлению с указанием цены и рейтинга перевозчиков. Ознакомьтесь с расписанием и выберите подходящий рейс.\nЕсли на выбранную дату нет свободных мест или рейсов, сайт предложит ближайшую дату или альтернативный пункт отправления.'**
  String get whatTripsAreThereContent;

  /// No description provided for @willThereBeATripContent.
  ///
  /// In ru, this message translates to:
  /// **'Воспользуйтесь формой поиска на главной странице нашего сайта: укажите пункт отправления и прибытия, желаемую дату выезда и количество пассажиров и нажмите кнопку “Найти билет”.\nВы увидите список рейсов по выбранному направлению с указанием цены и рейтинга перевозчиков. Ознакомьтесь с расписанием и выберите подходящий рейс.\nЕсли на выбранную дату нет свободных мест или рейсов, сайт предложит ближайшую дату или альтернативный пункт отправления.'**
  String get willThereBeATripContent;

  /// No description provided for @howFarInAdvanceDoYouNeedToBuyATicketContent.
  ///
  /// In ru, this message translates to:
  /// **'Воспользуйтесь формой поиска на главной странице нашего сайта: укажите пункт отправления и прибытия, желаемую дату выезда и количество пассажиров и нажмите кнопку “Найти билет”.\nВы увидите список рейсов по выбранному направлению с указанием цены и рейтинга перевозчиков. Ознакомьтесь с расписанием и выберите подходящий рейс.\nЕсли на выбранную дату нет свободных мест или рейсов, сайт предложит ближайшую дату или альтернативный пункт отправления.'**
  String get howFarInAdvanceDoYouNeedToBuyATicketContent;

  /// No description provided for @howToCalculateTravelTimeAndArrivalTimeContent.
  ///
  /// In ru, this message translates to:
  /// **'Воспользуйтесь формой поиска на главной странице нашего сайта: укажите пункт отправления и прибытия, желаемую дату выезда и количество пассажиров и нажмите кнопку “Найти билет”.\nВы увидите список рейсов по выбранному направлению с указанием цены и рейтинга перевозчиков. Ознакомьтесь с расписанием и выберите подходящий рейс.\nЕсли на выбранную дату нет свободных мест или рейсов, сайт предложит ближайшую дату или альтернативный пункт отправления.'**
  String get howToCalculateTravelTimeAndArrivalTimeContent;

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

  /// No description provided for @workTime.
  ///
  /// In ru, this message translates to:
  /// **'с 05:00 до 20:00 ежедневно'**
  String get workTime;

  /// No description provided for @termsSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Покупая биилет на сервисе АвтоВАС вы выражаете согласие с правилами сервиса и обязуетесь соблюдать текущее законодательство в сфере пассажирских перевозок'**
  String get termsSubtitle;

  /// No description provided for @privacyPolicy.
  ///
  /// In ru, this message translates to:
  /// **'Политика конфиденциальности'**
  String get privacyPolicy;

  /// No description provided for @privacyPolicyText.
  ///
  /// In ru, this message translates to:
  /// **'ПОЛИТИКА В ОТНОШЕНИИ ОБРАБОТКИ ПЕРСОНАЛЬНЫХ ДАННЫХ В  АО \'Автовас\'\nНастоящая политика конфиденциальности действует в отношении всей информации, которую Общество с ограниченной ответственностью «Автовас» ИНН 2126000549 (далее — «Общество») может получить о Пользователе во время использования им данного сайта  (далее — «Сайт»).\nСайт — представляет собой совокупность связанных между собой текстов, графических элементов, фото и видео материалов, программ для ЭВМ, программных модулей, баз данных, веб-страниц и иных элементов, предназначенных для доведения информации до всеобщего сведения, получения информации, обмена и осуществления иного функционала в сети Интернет.\nПользователь путем проставления «галочки» на странице Сайта  выражает свое безоговорочное согласие со всеми условиями настоящей Политики и обязуется соблюдать ее условия или прекратить использование Сайта .\nВ рамках настоящей Политики под «персональными данными Пользователя» понимается:\n— любая персональная информация, которую Пользователь предоставляет о себе самостоятельно либо о третьих лицах по их поручению при регистрации на Сайте и/или в процессе оформления бронирования, покупки и/или прочих услуг на Сайте, включая, следующую информацию: фамилия, имя, отчество, дата рождения, пол, гражданство, тип, серия и номер документа удостоверяющего личность, мобильный телефон, адрес электронной почты. При этом Общество вправе, но не обязано осуществлять проверку достоверности персональной информации, предоставляемой Пользователями от своего имени или по поручению третьих лиц, и не осуществляет контроль за их дееспособностью. За предоставление недостоверной информации Пользователь несёт ответственность самостоятельно. Обязательная для оказания услуг информация помечена специальным образом.\nСогласием с настоящей Политикой Пользователь, а также лица, в интересах которых Пользователь соглашается с настоящей Политикой, выражают свое согласие на обработку Обществом и (или) поставщиками услуг, оказываемых с помощью Сайта, персональных данных в следующих целях:\n— исполнение настоящей Политики (оказание услуг по оформлению билетов и прочее);\nОбработка персональных данных Пользователя включает в себя любое действие (операция) или совокупность действий (операций), совершаемых с использованием средств автоматизации или без использования таких средств с персональными данными, включая сбор, запись, систематизацию, накопление, хранение, уточнение (обновление, изменение), передачу (распространение, предоставление, доступ), обезличивание, блокирование, удаление, уничтожение персональных данных.\nНастоящее согласие действует до достижения целей обработки персональных данных, с момента получения согласия (акцепта) от Пользователя с условиями настоящей Политики.  Действие согласия прекращается на основании письменного заявления, которое подписывается Пользователем и вручается, либо направляется заказным письмом с уведомлением о вручении Обществу по адресу его местонахождения.\nВ случае отзыва согласия на обработку персональных данных вся полученная от пользователя информация, в том числе логин и пароль, удаляется в течение тридцати дней с даты поступления указанного отзыва, после чего Пользователь не будет иметь доступ к Сайту с их помощью.\nВ отношении персональных данных Пользователей сохраняется их конфиденциальность. Общество вправе передать персональные данные пользователя третьим лицам в следующих случаях:\n— пользователь выразил своё согласие на такие действия;\n— передача необходима в рамках использования пользователем Сайта либо для оказания предусмотренных ими услуг;\n— передача предусмотрена законодательством Российской Федерации в рамках установленной законодательством процедуры;\n— в целях обеспечения возможности защиты прав и законных интересов Общества или третьих лиц в случаях, когда Пользователь нарушает условия настоящей Политики.\nВ случае недееспособности Пользователя согласие на обработку его персональных данных дает в письменной форме его законный представитель.\nДля защиты персональных данных Пользователей от неправомерного или случайного доступа, уничтожения, изменения, блокирования, копирования, распространения, а также иных неправомерных действий с ними третьих лиц применяются необходимые и достаточные организационные и технические меры. Пользователь информирован о том, что его IP-адрес во время использования Сайта не регистрируется.\nС целью ускорения исполнения услуг, а также в иных целях, предусмотренных настоящим Политикой, программным обеспечением устройства с которого осуществляется доступ к Сайту компании, могут быть использованы учетные строки (cookies), идентифицирующие каждого пользователя с максимальной быстротой, для повышения скорости работы программ  и упрощения ввода данных Пользователя. Эти данные не хранятся в информационной системе Сайта, а только на устройстве пользователя.\nОбщество не контролирует и не несет ответственность за сайты третьих лиц, на которые Пользователь может перейти по ссылкам, доступным на Сайте.\nНастоящая Политика может быть изменена без предварительного уведомления или согласия Пользователя. Новая редакция Политики вступает в силу с момента её размещения, если иное не предусмотрено новой редакцией Политики.\nК настоящей Политике и отношениям между Пользователями и Обществом, возникающим при ее использовании, подлежит применению право Российской Федерации.'**
  String get privacyPolicyText;

  /// No description provided for @consentToTheProcessingOfPersonalData.
  ///
  /// In ru, this message translates to:
  /// **'Согласие на обработку персональных данных'**
  String get consentToTheProcessingOfPersonalData;

  /// No description provided for @consentToTheProcessingOfChildPersonalData.
  ///
  /// In ru, this message translates to:
  /// **'Согласие на обработку персональных данных\nребенка'**
  String get consentToTheProcessingOfChildPersonalData;

  /// No description provided for @contractOffer.
  ///
  /// In ru, this message translates to:
  /// **'Договор оферты'**
  String get contractOffer;

  /// No description provided for @termsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Положения и условия'**
  String get termsTitle;

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

  /// No description provided for @avtovas.
  ///
  /// In ru, this message translates to:
  /// **'ООО «АВТОВАС»'**
  String get avtovas;

  /// No description provided for @additionalPrecautions.
  ///
  /// In ru, this message translates to:
  /// **'АВТОВАС понимает важность дополнительных мер предосторожности для обеспечения конфиденциальности и безопасности детей при использовании ими услуг, предоставляемых АВТОВАС.\nОбращаем внимание, что в случае оформлении билета на ребенка младше 18 лет, согласие на обработку его персональных данных дает его законный представитель (родитель/опекун) - если Вам меньше 18 лет, не вводите на нашем сайте свои персональные данные без одобрения родителей/опекунов и не пользуйтесь услугами нашего сайта.\nБАСФОР сознательно не собирает персональные данные о детях до 18 лет. Если Вы (Пользователь) считаете, что мы непреднамеренно собрали подобную информацию, свяжитесь с нами по электронному адресу help@busfor.ru, чтобы мы получили согласие законного представителя либо удалили эти данные.'**
  String get additionalPrecautions;

  /// No description provided for @methodsAndTermsOfPersonalDataProcessing.
  ///
  /// In ru, this message translates to:
  /// **'Способы и сроки обработки персональных\nданных'**
  String get methodsAndTermsOfPersonalDataProcessing;

  /// No description provided for @personalDataProcessingDesc.
  ///
  /// In ru, this message translates to:
  /// **'Обработка персональных данных Пользователя включает в себя любое действие (операция) или совокупность действий (операций), совершаемых с использованием средств автоматизации или без использования таких средств с персональными данными, включая сбор, запись, систематизацию, накопление, хранение, уточнение (обновление, изменение), извлечение, использование, передачу (распространение, предоставление, доступ), в том числе трансграничную передачу, обезличивание, блокирование, удаление, уничтожение персональных данных.'**
  String get personalDataProcessingDesc;

  /// No description provided for @agreement.
  ///
  /// In ru, this message translates to:
  /// **'Соглашение между пользователем сайта АВТОВАС и компанией ООО «АВТОВАС»'**
  String get agreement;

  /// No description provided for @agreementSectionOneTitle.
  ///
  /// In ru, this message translates to:
  /// **'1. Предмет пользовательского соглашения'**
  String get agreementSectionOneTitle;

  /// No description provided for @agreementSectionOneDescription.
  ///
  /// In ru, this message translates to:
  /// **'1.1. Предметом настоящего Пользовательского соглашения (далее \'ПС\') являются отношения между АО \'Автовас\' (далее \'Разработчик\'),  являющегося правообладателем Интернет-сервиса (далее \'Сервис\'), расположенного в сети Интернет по адресу https://vokzal21.ru/ (далее Сайт), и Вами (пользователем сети Интернет, далее \'Пользователь\'), по поводу использования Сервиса. Используя Сервис, Пользователь соглашается соблюдать условия, описанные в настоящем ПС.ПС может быть изменено без какого-либо специального уведомления Пользователей.'**
  String get agreementSectionOneDescription;

  /// No description provided for @agreementSectionTwoTitle.
  ///
  /// In ru, this message translates to:
  /// **'2. Описание Сервиса'**
  String get agreementSectionTwoTitle;

  /// No description provided for @agreementSectionTwoDescription.
  ///
  /// In ru, this message translates to:
  /// **'2.1. На Сайте предоставляется сервис по продаже проездных автобусных билетов на пригородные, междугородние, межсубъектные и международные рейсы с автовокзала.\n2.2. Пользователь осознает и соглашается, что Сайт может содержать рекламу, и что наличие данной рекламы является необходимым условием использования Сайта. Пользователь также понимает и соглашается, что Сервис может содержать сообщения от Разработчика, такие как служебные сообщения, автоматические уведомления и новостные рассылки Разработчика, в том числе в виде SMS.\n2.3. Сервис предоставляется \'как есть\'. Сервис не принимает на себя никакой ответственности за задержку, удаление, недоставку или невозможность сохранить любые данные Пользователя, в том числе настройки Пользователя, а также не несет ответственности за соответствие сервиса целям Пользователя. Все вопросы предоставления прав доступа к сети Интернет, покупки и наладки для этого соответствующего оборудования и программных продуктов решаются Пользователем самостоятельно и не подпадают под действие настоящего Пользовательского соглашения.'**
  String get agreementSectionTwoDescription;

  /// No description provided for @agreementSectionThreeTitle.
  ///
  /// In ru, this message translates to:
  /// **'3. Возврат и обмен проездных билетов'**
  String get agreementSectionThreeTitle;

  /// No description provided for @agreementSectionThreeDescription.
  ///
  /// In ru, this message translates to:
  /// **'3.1. Согласно статье 23 Устава автомобильного транспорта от 8 ноября 2007 г. при срыве рейса по техническим причинам или задержке рейса более чем на час, возврат стоимости проезда производится в полном объеме. Возврату не подлежит агентский сбор за услугу Интернет-продажи, комиссионный сбор автовокзала за предварительную продажу (когда таковая имеется), а также возможные комиссионные сборы платежных систем, с помощью которых пользователь осуществил оплату.\n3.2. Если возврат билета инициирует пассажир, то производятся следующие удержания из возвращаемой стоимости проезда: Возврат билета более чем за 2 часа до отправления - 5%; Возврат билета в течение 2 часов до отправления - 15%; Возврат билета в течение 3 часов после отправления - 25%; Через 3 часа после отправления автобуса возврат денег за билет не производится.\n3.3. Возврат билетов осуществляется в кассах автовокзала с предъявлением распечатанного электронного билета и документа удостоверяющего личность (паспорта), на который оформлен электронный билет.\n3.4. В случае необходимости обмена билета на другой, Пользователь сначала производит возврат билета, а затем приобретает новый.'**
  String get agreementSectionThreeDescription;

  /// No description provided for @agreementSectionFourTitle.
  ///
  /// In ru, this message translates to:
  /// **'4. Технические условия работы Сервиса'**
  String get agreementSectionFourTitle;

  /// No description provided for @agreementSectionFourDescription.
  ///
  /// In ru, this message translates to:
  /// **'Пользователь понимает и соглашается с тем, что:\n4.1. Разработчик не гарантирует, что Сервис будет соответствовать требованиям Пользователя; будет предоставляться непрерывно, быстро, надежно и без ошибок; результаты, которые могут быть получены Пользователем, будут точными и надежными; качество какого-либо продукта, услуги, информации и прочего, полученного с использованием Сервиса, будут соответствовать ожиданиям Пользователя и что все ошибки в программах будут исправлены;\n4.2. Разработчик не несет ответственности за любые прямые либо косвенные убытки, произошедшие из-за использования либо невозможности использования Сервиса; из-за несанкционированного доступа к коммуникациям Пользователя; из-за мошеннической деятельности третьих лиц.\n4.3. Разработчки имеет право производить профилактические работы на Сайте с временным приостановлением работы Сервиса.\n4.4. В случае наступления форс-мажорных обстоятельств, а также аварий или сбоев в программно-аппаратных комплексах третьих лиц, сотрудничающих с Сервисом, или действий третьих лиц, направленных на приостановку или прекращение функционирования Сервиса, возможна приостановка работы Сервиса без предварительного уведомления Пользователей'**
  String get agreementSectionFourDescription;

  /// No description provided for @agreementSectionFiveTitle.
  ///
  /// In ru, this message translates to:
  /// **'5. Обратная связь и порядок рассмотрения претензий'**
  String get agreementSectionFiveTitle;

  /// No description provided for @agreementSectionFiveDescription.
  ///
  /// In ru, this message translates to:
  /// **'5.1. Пользователь, считающий, что его права и интересы нарушены из-за работы Сервиса, может направить претензию. Рассмотрением претензий занимается служба поддержки Пользователей Сервиса в соответствии с общим порядком рассмотрения поступающих запросов. Адрес электронной почты службы поддержки Пользователей указывается в разделе Сайта \'Контакты\'\n5.2. Пользователь и Разработчик соглашаются с тем, что все возможные споры по поводу Пользовательского соглашения будут разрешаться путем переговоров, а в случае безрезультатных переговоров - с арбитражном суде города Томск в соответствии с нормами действующего законодательства Российской Федерации.'**
  String get agreementSectionFiveDescription;

  /// No description provided for @agreementSectionSixTitle.
  ///
  /// In ru, this message translates to:
  /// **'6. Предоставление информации Клиентом'**
  String get agreementSectionSixTitle;

  /// No description provided for @agreementSectionSixDescription.
  ///
  /// In ru, this message translates to:
  /// **'При регистрации на Сайте Клиент предоставляет следующую информацию: фамилия, имя, отчество, контактный телефон, тип документа, удостоверяющего личность, номер и серия документа, адрес электронной почты, пароль для доступа к Сайту. \nПри оформлении заказа Клиент должен предоставлять следующую информацию: фамилия, имя, отчество, номер и серия паспорта. \nПредоставляя свои персональные данные при авторизации/регистрации на сайте, Клиент соглашается на их обработку в течение неопределенного срока компанией АО \'Автовас\' (далее \'Продавец\') в целях исполнения Продавцом своих обязательств перед клиентом, продажи им товаров и предоставления услуг, предоставления им справочной информации, а также в целях продвижения товаров, работ и услуг. При обработке персональных данных Клиента компания АО \'Автовас\' руководствуется Федеральным законом \'О персональных данных\' и локальными нормативными документами.\nКлиент вправе получить информацию, касающуюся обработки его персональных данных (в т.ч. о способах и целях обработки, о лицах, которые имеют доступ к его персональным данным или которым могут быть раскрыты персональные данные на основании договора с ООО «Капитал» или на основании федерального закона, о сроках обработки).\n6.1. Использование информации предоставленной Клиентом\nПродавец использует предоставленные Клиентом данные в течение всего срока регистрации Клиента на Сайте в целях:\n- для регистрации/авторизации Клиента на Сайте;\n- для обработки заказов Клиента и выполнения своих обязательств перед Клиентом;\n- для осуществления деятельности по продвижению товаров и услуг; анализа покупательских особенностей Клиента и предоставления персональных рекомендаций.\n6.2. Предоставление и передача информации, полученной Продавцом\nПродавец обязуется не передавать полученную от Клиента информацию третьим лицам. Не считается нарушением предоставление Продавцом информации агентам и третьим лицам, действующим на основании договора с Продавцом, для исполнения обязательств перед Клиентом и только в рамках договоров.\nНе считается нарушением обязательств передача информации в соответствии с обоснованными и применимыми требованиями законодательства Российской Федерации.\nПродавец вправе использовать технологию \'cookies\'. \'Cookies\' не содержат конфиденциальную информацию и не передаются третьим лицам.\nПродавец получает информацию об ip-адресе посетителя Сайта и сведения о том, по ссылке с какого интернет-сайта посетитель пришел. Данная информация не используется для установления личности посетителя.\nПродавец не несет ответственности за сведения, предоставленные Клиентом на Сайте в общедоступной форме.\nПродавец при обработке персональных данных принимает необходимые и достаточные организационные и технические меры для защиты персональных данных от неправомерного доступа к ним, а также от иных неправомерных действий в отношении персональных данных.\nИспользование любой части Сервиса означает безусловное согласие Пользователя с положениями настоящего Пользовательского Соглашения.'**
  String get agreementSectionSixDescription;

  /// No description provided for @generalProvisionsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Общие положения'**
  String get generalProvisionsTitle;

  /// No description provided for @generalProvisions.
  ///
  /// In ru, this message translates to:
  /// **'1.1. ООО «АВТОВАС» (далее по тексту – «АВТОВАС») предлагает Пользователям использовать сервис для поиска и покупки билетов на автобусы, размещенный на интернет-портале www.avtobas.ru(далее - avtobas.ru) на условиях, изложенных в настоящем Пользовательском соглашении (далее – Соглашение). Соглашение может быть изменено АВТОВАС без какого-либо специального уведомления, новая редакция Соглашения вступает в силу с момента ее размещения на www.busfor.ru, если иное не предусмотрено новой редакцией Соглашения.\n\n1.2. Воспользовавшись любой функциональной возможностью avtobas.ru, Пользователь выражает свое безоговорочное согласие со всеми условиями настоящего Соглашения и обязуется их соблюдать или прекратить использование busfor.ru\n\n1.3. Для того, чтобы воспользоваться сервисом для поиска и бронирования билетов на автобусы, размещенном на avtobas.ru, Пользователю необходимо иметь компьютер и доступ в Интернет. Все вопросы приобретения прав доступа в Интернет, покупки и наладки соответствующего оборудования и программных продуктов решаются Пользователем самостоятельно и не подпадают под действие настоящего Соглашения.'**
  String get generalProvisions;

  /// No description provided for @processingPersonalDataTitle.
  ///
  /// In ru, this message translates to:
  /// **'СОГЛАСИЕ НА ОБРАБОТКУ ПЕРСОНАЛЬНЫХ ДАННЫХ'**
  String get processingPersonalDataTitle;

  /// No description provided for @processingPersonalDataDescription.
  ///
  /// In ru, this message translates to:
  /// **'Настоящая Политика конфиденциальности действует в отношении всей информации, которую Общество с ограниченной ответственностью «БАСФОР» (ОГРН 1117746469433, адрес местонахождения/почтовый адрес: 123112, Россия, г. Москва, Пресненская наб., д. 8, стр. 1, этаж 16, телефон 8 (800) 600-06-54) (далее — «БАСФОР») может получить о Пользователе во время использования им сайта www.busfor.ru (далее — «Сайт») и устанавливает обязательства Автовас по неразглашению и обеспечению режима защиты конфиденциальности персональных данных, которые Пользователь предоставляет при регистрации или при оформлении электронного билета на сайте busfor.ru.\nИспользование сайта busfor.ru Пользователем (активация «v» напротив ссылки на Политику конфиденциальности и Пользовательское соглашение (оферту) на стадии оформления электронных билетов), означает согласие со всеми условиями настоящей Политики конфиденциальности (далее – Политики) и условиями обработки персональных данных. В случае несогласия с условиями Политики Пользователю будет доступен ограниченный функционал сайта busfor.ru.'**
  String get processingPersonalDataDescription;

  /// No description provided for @useOfPersonalInfoTitle.
  ///
  /// In ru, this message translates to:
  /// **'СБОР И ИСПОЛЬЗОВАНИЕ ЛИЧНОЙ ИНФОРМАЦИИ'**
  String get useOfPersonalInfoTitle;

  /// No description provided for @useOfPersonalInfoDescription.
  ///
  /// In ru, this message translates to:
  /// **'В рамках настоящей Политики под «Персональными данными Пользователя» понимается любая персональная информация, по которой можно идентифицировать Пользователя. Пользователь самостоятельно предоставляет данные о себе либо о третьих лицах, представителями которых является на законных основаниях, по их поручению при регистрации на Сайте и/или в процессе оформления бронирования, покупки электронных билетов и/или прочих услуг на Сайте, включая, но не ограничиваясь, следующей информацией:\nфамилия, имя, отчество, дата рождения, пол, гражданство, серия и номер паспорта (свидетельства о рождении), мобильный телефон, адрес электронной почты и т.д.\nПри этом Автовас вправе, но не обязано осуществлять проверку достоверности персональной информации, предоставляемой Пользователями и не осуществляет контроль за их дееспособностью. За предоставление недостоверной информации Пользователь несёт ответственность самостоятельно.\nО платежных реквизитах: Мы не получаем и не храним платежные реквизиты Пользователей – это компетенция соответствующих платформ и операторов по приему платежей (PayTure, PayPal, интернет-эквайринг и др.). Если Пользователь оплачивает оформленный электронный билет, то оператор платежей оповещает Автовас о проведенной транзакции, а мы со своей стороны следим, чтобы Пользователь получил на электронную почту электронный бланк билета и электронный чек. Автовас не получает никаких платежных реквизитов, а только хранит информацию о времени транзакции, валюте платежа, сумме и оплаченной услуге.'**
  String get useOfPersonalInfoDescription;

  /// No description provided for @autoCollectedInfoTitle.
  ///
  /// In ru, this message translates to:
  /// **'ИНФОРМАЦИЯ СОБИРАЕМАЯ АВТОМАТИЧЕСКИ'**
  String get autoCollectedInfoTitle;

  /// No description provided for @autoCollectedInfoDescription.
  ///
  /// In ru, this message translates to:
  /// **'Кроме личной информации (персональных данных), Автовас осуществляет сбор данных, которые не относятся непосредственно к конкретному человеку. Автовас может собирать, использовать, передавать и раскрывать эти сведения с любой целью.\nНеличной информацией являются данные, которые автоматически передаются Сайту в процессе его использования с помощью установленного на устройстве пользователя программного обеспечения, в том числе IP-адрес, ID-номер, информация из cookies, информация о браузере пользователя (или иной программы, с помощью которой осуществляется доступ к Сайту), время доступа и иная информация о Пользователе и третьих лицах, сбор и/или предоставление которой определено в документах, регламентирующих порядок оказания услуг с помощью Сайта.\nДополнительные сервисы, которые использует Автовас, для обработки персональных данных'**
  String get autoCollectedInfoDescription;

  /// No description provided for @purposesOfCollectingPersonalDataTitle.
  ///
  /// In ru, this message translates to:
  /// **'ЦЕЛИ СБОРА ПЕРСОНАЛЬНЫХ ДАННЫХ'**
  String get purposesOfCollectingPersonalDataTitle;

  /// No description provided for @purposesOfCollectingPersonalDataDescription.
  ///
  /// In ru, this message translates to:
  /// **'Согласием с настоящей Политикой Пользователь, а также лица, в интересах которых Пользователь соглашается с настоящей Политикой, выражают свое согласие на обработку Автовас и (или) поставщиками услуг, оказываемых с помощью Сайта, персональных данных в следующих целях:\nидентификация Пользователя при оформлении электронного билета и его дальнейшей клиентской и технической поддержки при возникновении трудностей связанных с оказанием услуг, предоставляемых БАСФОР;\nсвязь с Пользователем (в том числе экстренная) путём направления уведомлений, запросов и информации, касающихся использования Сайта, оказания предусмотренных Сайтом услуг, а также обработка запросов и заявок от Пользователей, отправка сообщений по электронной почте, а также посредством смс-сообщений с целью подтверждения (отмены) бронирования, уведомления об изменении в расписании рейсов, об изменении места отправления, отмене рейса, изменениях любых иных параметров рейса, а также о любых иных событиях, связанных с оказанием услуг в рамках использования Сайта;\nнаправление Пользователю электронного билета и электронного чека, подтверждающего прохождение оплаты\nулучшение качества работы Сайта, удобства его использования, разработка новых услуг;\nполучение по каналам связи (в том числе в смс-сообщениях) информации об услугах, статусе их оказания, а также об акциях, скидках, новостях БАСФОР и его партнёров;\nпередача данных контрагентам (внутренняя и трансграничная), осуществляющим перевозку пассажиров по оформленным через БАСФОР электронным билетам, филиалам и дочерним предприятиям БАСФОР, третьим сторонам с целью отправки Пользователю информации о БАСФОР и его предприятиях, а также отправки рекламных материалов от его партнеров;\nпроведение статистических и иных исследований, на основе обезличенных данных.'**
  String get purposesOfCollectingPersonalDataDescription;

  /// No description provided for @processingChildPersonalDataTitle.
  ///
  /// In ru, this message translates to:
  /// **'СОГЛАСИЕ НА ОБРАБОТКУ ПЕРСОНАЛЬНЫХ ДАННЫХ РЕБЕНКА'**
  String get processingChildPersonalDataTitle;

  /// No description provided for @processingChildPersonalDataDescription.
  ///
  /// In ru, this message translates to:
  /// **'БАСФОР понимает важность дополнительных мер предосторожности для обеспечения конфиденциальности и безопасности детей при использовании ими услуг, предоставляемых БАСФОР.\nОбращаем внимание, что в случае оформлении билета на ребенка младше 18 лет, согласие на обработку его персональных данных дает его законный представитель (родитель/опекун) - если Вам меньше 18 лет, не вводите на нашем сайте свои персональные данные без одобрения родителей/опекунов и не пользуйтесь услугами нашего сайта.\nБАСФОР сознательно не собирает персональные данные о детях до 18 лет. Если Вы (Пользователь) считаете, что мы непреднамеренно собрали подобную информацию, свяжитесь с нами по электронному адресу help@busfor.ru, чтобы мы получили согласие законного представителя либо удалили эти данные.'**
  String get processingChildPersonalDataDescription;

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

  /// No description provided for @passportRF.
  ///
  /// In ru, this message translates to:
  /// **'Паспорт гражданина РФ'**
  String get passportRF;

  /// No description provided for @sailorPassport.
  ///
  /// In ru, this message translates to:
  /// **'Паспорт моряка'**
  String get sailorPassport;

  /// No description provided for @intlPassportRF.
  ///
  /// In ru, this message translates to:
  /// **'Загранпаспорт гражданина РФ'**
  String get intlPassportRF;

  /// No description provided for @foreignPassport.
  ///
  /// In ru, this message translates to:
  /// **'Паспорт иностранного гражданина'**
  String get foreignPassport;

  /// No description provided for @birthCertificate.
  ///
  /// In ru, this message translates to:
  /// **'Свидетельство о рождении'**
  String get birthCertificate;

  /// No description provided for @militaryId.
  ///
  /// In ru, this message translates to:
  /// **'Удостоверение личности военнослужащего РФ'**
  String get militaryId;

  /// No description provided for @statelessId.
  ///
  /// In ru, this message translates to:
  /// **'Удостоверение личности лица без гражданства'**
  String get statelessId;

  /// No description provided for @tempId.
  ///
  /// In ru, this message translates to:
  /// **'Временное удостоверение личности'**
  String get tempId;

  /// No description provided for @militaryTicket.
  ///
  /// In ru, this message translates to:
  /// **'Военный билет'**
  String get militaryTicket;

  /// No description provided for @residencePermit.
  ///
  /// In ru, this message translates to:
  /// **'Вид на жительство'**
  String get residencePermit;

  /// No description provided for @releaseCertificate.
  ///
  /// In ru, this message translates to:
  /// **'Справка об освобождении из мест лишения свободы'**
  String get releaseCertificate;

  /// No description provided for @ussrPassport.
  ///
  /// In ru, this message translates to:
  /// **'Паспорт гражданина СССР'**
  String get ussrPassport;

  /// No description provided for @diplomatRfPassport.
  ///
  /// In ru, this message translates to:
  /// **'Дипломатический паспорт гражданина РФ'**
  String get diplomatRfPassport;

  /// No description provided for @intlUssrPassport.
  ///
  /// In ru, this message translates to:
  /// **'Загранпаспорт гражданина СССР'**
  String get intlUssrPassport;

  /// No description provided for @minflotPassport.
  ///
  /// In ru, this message translates to:
  /// **'Паспорт Минморфлота'**
  String get minflotPassport;

  /// No description provided for @reserveOfficerTicket.
  ///
  /// In ru, this message translates to:
  /// **'Военный билет офицера запаса'**
  String get reserveOfficerTicket;

  /// No description provided for @servicePassport.
  ///
  /// In ru, this message translates to:
  /// **'Служебный паспорт'**
  String get servicePassport;

  /// No description provided for @returnFromCisCertificate.
  ///
  /// In ru, this message translates to:
  /// **'Свидетельство о возвращении из стран СНГ'**
  String get returnFromCisCertificate;

  /// No description provided for @lostPassportCertificate.
  ///
  /// In ru, this message translates to:
  /// **'Справка об утере паспорта'**
  String get lostPassportCertificate;

  /// No description provided for @asylumCertificate.
  ///
  /// In ru, this message translates to:
  /// **'Свидетельство о предоставлении временного убежища'**
  String get asylumCertificate;

  /// No description provided for @routesNotFound.
  ///
  /// In ru, this message translates to:
  /// **'Маршруты не найдены'**
  String get routesNotFound;

  /// No description provided for @route.
  ///
  /// In ru, this message translates to:
  /// **'Маршрут'**
  String get route;

  /// No description provided for @checkOtherDatesAndStations.
  ///
  /// In ru, this message translates to:
  /// **'Посмотрите другие даты и вокзалы'**
  String get checkOtherDatesAndStations;

  /// No description provided for @copyright.
  ///
  /// In ru, this message translates to:
  /// **'© 2023, OOO «Автовас». Все права защищены. «АВТОВАС» — Онлайн сервис продажи билетов'**
  String get copyright;

  /// No description provided for @cookies.
  ///
  /// In ru, this message translates to:
  /// **'Мы используем cookie-файлы для наилучшего представления нашего сайта. Продолжая использовать этот сайт, вы соглашаетесь с использованием cookie-файлов.'**
  String get cookies;

  /// No description provided for @orderNum.
  ///
  /// In ru, this message translates to:
  /// **'Заказ №'**
  String get orderNum;
}

class _AvtovasLocalizationDelegate extends LocalizationsDelegate<AvtovasLocalization> {
  const _AvtovasLocalizationDelegate();

  @override
  Future<AvtovasLocalization> load(Locale locale) {
    return SynchronousFuture<AvtovasLocalization>(lookupAvtovasLocalization(locale),);
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
