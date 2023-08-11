import 'package:intl/intl.dart' as intl;

import 'avtovas_localizations.dart';

// ignore_for_file: unnecessary_string_interpolations
// ignore_for_file: lines_longer_than_80_chars,
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

/// The translations for Russian (`ru`).
class AvtovasLocalizationRu extends AvtovasLocalization {
  AvtovasLocalizationRu([String locale = 'ru']) : super(locale);

  @override
  String get accept => 'Подтвердить';

  @override
  String get adult => 'Взрослый';

  @override
  String authorizationWarning(Object number) {
    return 'Вы уверены, что хотите продолжить с номером $number ?';
  }

  @override
  String get authorizationTitle => 'Войти в личный кабинет';

  @override
  String get authorizationSubtitle => 'Вам будут доступны операции со всеми билетами, которые вы покапали на этот номер';

  @override
  String get authorizationErrorMessage => 'Некорректное значение.\nПроверьте введённый номер телефона!';

  @override
  String get authorizationFirstSuggestion => 'Продолжая, вы соглашаетесь ';

  @override
  String get authorizationLastSuggestion => 'со сбором и обработкой персональных данных';

  @override
  String authorizationSubtitleWithNumber(Object number) {
    return 'Введите код, отправленный на номер\n$number';
  }

  @override
  String authorizationWaitMessage(Object count) {
    return 'Ожидание $count сек.';
  }

  @override
  String get authorizationSendSms => 'Выслать код в СМС';

  @override
  String get aboutApp => 'О приложении';

  @override
  String get addPassenger => 'Добавить пассажира';

  @override
  String get buyTicket => 'Купить билет';

  @override
  String buyFor(Object price) {
    return 'Купить за $price';
  }

  @override
  String get carrier => 'Перевозчик';

  @override
  String get clearSearchHistory => 'Очистить историю поиска';

  @override
  String get date => 'Дата';

  @override
  String get document => 'Документ';

  @override
  String get exit => 'Выйти';

  @override
  String get exitWarning => 'Вы уверены, что хотите выйти?';

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
  String get from => 'Откуда';

  @override
  String get help => 'Помощь';

  @override
  String get flightInformation => 'Информация о рейсе';

  @override
  String get inside => 'в';

  @override
  String get myTrips => 'Мои поездки';

  @override
  String get gender => 'Пол';

  @override
  String passengerAmount(Object count) {
    return 'Пассажир $count';
  }

  @override
  String get selectPassenger => 'Выбрать пассажира';

  @override
  String get firstName => 'Имя';

  @override
  String get lastName => 'Фамилия';

  @override
  String get surname => 'Отчество';

  @override
  String get noSurname => 'Нет отчества';

  @override
  String get birthdayDate => 'Дата рождения';

  @override
  String get seriesAndNumber => 'Серия и номер';

  @override
  String get priceByRate => 'priceByRate';

  @override
  String get total => 'Итого';

  @override
  String get onWay => 'В пути: ';

  @override
  String get paymentHistory => 'История платежей';

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
  String get mainSearchTitle => 'Билеты на автобусы\nЧувашии';

  @override
  String get secondaryDetailsMessage => 'Перевозчик имеет право заменить транспортное средство, в случае его неисправности, аварии и других аналогичных случаях';

  @override
  String get transport => 'Транспорт: ';

  @override
  String get tripDetails => 'Детали рейса';

  @override
  String get name => 'Имя';

  @override
  String get infoDeskOfTheCentralBusStation => 'Справочная Центрального автовокзала';

  @override
  String get controlRoomOfTheCentralBusStation => 'Диспетчерская Центрального автовокзала';

  @override
  String get support => 'Служба технической поддержки';

  @override
  String get roundTheClock => 'Круглосуточно';

  @override
  String get contacts => 'Контакты автовокзалов';

  @override
  String get contactsTitle => 'Контакты';

  @override
  String get contactsItem => 'Чебоксары - Центральный автовокзал';

  @override
  String get whatTripsAreThere => 'Какие рейсы есть - рейсы и расписание';

  @override
  String get willThereBeATrip => 'Точно ли будет рейс';

  @override
  String get howFarInAdvanceDoYouNeedToBuyATicket => 'Насколько заранее надо покупать билет';

  @override
  String get howToCalculateTravelTimeAndArrivalTime => 'Как рассчитать время в пути и время\nприбытия';

  @override
  String get referenceInfo => 'Справочная информация';

  @override
  String get whatTripsAreThereContent => 'Воспользуйтесь формой поиска на главной странице нашего сайта: укажите пункт отправления и прибытия, желаемую дату выезда и количество пассажиров и нажмите кнопку “Найти билет”.\nВы увидите список рейсов по выбранному направлению с указанием цены и рейтинга перевозчиков. Ознакомьтесь с расписанием и выберите подходящий рейс.\nЕсли на выбранную дату нет свободных мест или рейсов, сайт предложит ближайшую дату или альтернативный пункт отправления.';

  @override
  String get willThereBeATripContent => 'Воспользуйтесь формой поиска на главной странице нашего сайта: укажите пункт отправления и прибытия, желаемую дату выезда и количество пассажиров и нажмите кнопку “Найти билет”.\nВы увидите список рейсов по выбранному направлению с указанием цены и рейтинга перевозчиков. Ознакомьтесь с расписанием и выберите подходящий рейс.\nЕсли на выбранную дату нет свободных мест или рейсов, сайт предложит ближайшую дату или альтернативный пункт отправления.';

  @override
  String get howFarInAdvanceDoYouNeedToBuyATicketContent => 'Воспользуйтесь формой поиска на главной странице нашего сайта: укажите пункт отправления и прибытия, желаемую дату выезда и количество пассажиров и нажмите кнопку “Найти билет”.\nВы увидите список рейсов по выбранному направлению с указанием цены и рейтинга перевозчиков. Ознакомьтесь с расписанием и выберите подходящий рейс.\nЕсли на выбранную дату нет свободных мест или рейсов, сайт предложит ближайшую дату или альтернативный пункт отправления.';

  @override
  String get howToCalculateTravelTimeAndArrivalTimeContent => 'Воспользуйтесь формой поиска на главной странице нашего сайта: укажите пункт отправления и прибытия, желаемую дату выезда и количество пассажиров и нажмите кнопку “Найти билет”.\nВы увидите список рейсов по выбранному направлению с указанием цены и рейтинга перевозчиков. Ознакомьтесь с расписанием и выберите подходящий рейс.\nЕсли на выбранную дату нет свободных мест или рейсов, сайт предложит ближайшую дату или альтернативный пункт отправления.';

  @override
  String get passengersTitle => 'Пассажиры';

  @override
  String get waypoints => 'Промежуточные пункты';

  @override
  String get inquiry => 'Позвонить или задать вопрос';

  @override
  String get incorrectPhoneValue => 'Введёно некорректное значение. Введите реальный номер телефона, на который придёт СМС-сообщение с кодом подтверждения';

  @override
  String get directoryInfo => 'Справочная информация';

  @override
  String get busStationContacts => 'Контакты автовокзалов';

  @override
  String get enterName => 'Введите имя';

  @override
  String get emailExample => 'example@example.ru';

  @override
  String get emailSenderTitle => 'Укажите Ваш E-mail для отправки билета и чека';

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
  String get previouslySearched => 'Ранее искали';

  @override
  String get call => 'Позвонить';

  @override
  String get citizenship => 'Гражданство';

  @override
  String get technicalSupportService => 'Служба технической поддержки';

  @override
  String get to => 'Куда';

  @override
  String get centralBusStationHelpline => 'Справочная Центрального автовокзала';

  @override
  String get ourQualifiedExpertsWillHelp => 'Наши квалифицированные специалисты обязательно вам помогут.';

  @override
  String get twentyFourHours => 'круглосуточно';

  @override
  String get dailyFromFiveToTwenty => 'с 05:00 до 20:00 ежедневно';

  @override
  String get sendSMS => 'Выслать код в СМС';

  @override
  String get sortByTime => 'Сортировка по времени';

  @override
  String get sortByPrice => 'Сортировка по цене';

  @override
  String get passport => 'Паспорт';

  @override
  String get male => 'Мужской';

  @override
  String get female => 'Женский';

  @override
  String get internationalPassport => 'Заграничный паспорт';

  @override
  String get birthCertificate => 'Свидетельство о рождении';

  @override
  String get childish => 'Детский ';

  @override
  String get passengers => 'Пассажирский';

  @override
  String get main => 'Главная';

  @override
  String get termsSubtitle => 'Покупая биилет на сервисе АвтоВАС вы выражаете согласие с правилами сервиса и обязуетесь соблюдать текущее законодательство в сфере пассажирских перевозок';

  @override
  String get privacyPolicy => 'Политика конфиденциальности';

  @override
  String get consentToTheProcessingOfPersonalData => 'Согласие на обработку персональных данных';

  @override
  String get contractOffer => 'Договор оферты';

  @override
  String get termsTitle => 'Положения и условия';

  @override
  String get sendPushNotificationsBeforeRace => 'Присылать push-уведомления за час\nдо отправления рейса';

  @override
  String get version => 'Версия:';

  @override
  String get emptyPaymentsHistoryTitle => 'Здесь будет история платежей после покупки';

  @override
  String get workTime => 'с 05:00 до 20:00 ежедневно';

  @override
  String get paymentsHistoryTitle => 'История платежей';

  @override
  String get rate => 'Тариф';

  @override
  String get schedule => 'Расписание';

  @override
  String get upcoming => 'Предстоящие';

  @override
  String useThat(Object email) {
    return 'Использовать этот: $email';
  }

  @override
  String get completed => 'Завершенные';

  @override
  String get archived => 'Архив';

  @override
  String get refund => 'Возврат';

  @override
  String get signInToViewHistory => 'Зарегистрируйтесь, чтобы посмотреть свою историю билетов';

  @override
  String get noUpcomingTrips => 'У вас пока нет предстоящих поездок';

  @override
  String get pay => 'Оплатить';

  @override
  String get seat => 'Место';

  @override
  String get inTransit => 'В пути';

  @override
  String get awaitingPayment => 'Ожидает оплаты';

  @override
  String get deleteOrder => 'Удалить заказ';

  @override
  String get bookingExpired => 'Бронь истекла';

  @override
  String get rebookOrder => 'Переоформить заказ';

  @override
  String get notifications => 'Уведомления';

  @override
  String get noCompletedTrips => 'У вас пока нет завершенных поездок';

  @override
  String get paid => 'Оплачено';

  @override
  String get passportRf => 'Паспорт рф';

  @override
  String get anotherPassport => 'Паспорт иной страны';

  @override
  String get downloadTicket => 'Скачать билет';

  @override
  String get more => 'Еще';

  @override
  String get sendToEmail => 'Отправить на E-mail';

  @override
  String get downloadPurchaseReceipt => 'Скачать чек покупки';

  @override
  String get refundTicket => 'Вернуть билет';

  @override
  String get downloadTicketAgain => 'Скачать билет еще раз';

  @override
  String get referenceInformation => 'Справочная информация';

  @override
  String get refundProcessed => 'Произведен возврат';

  @override
  String get downloadRefundReceipt => 'Скачать чек возврата';

  @override
  String get carrierRights => 'Перевозчик имеет право заменить транспортное средство в случае его неисправности, аварии и других аналогичных случаях';

  @override
  String get passenger => 'Пассажиры';

  @override
  String get orderPayment => 'Оплата заказа';

  @override
  String get tariff => 'Тариф';

  @override
  String get termAndConditions => 'Положения и условия';

  @override
  String get commission => 'Комиссия';

  @override
  String get payWithCard => 'Оплатить банковской картой';

  @override
  String get provideEmail => 'Укажите e-mail для отправки заказа';

  @override
  String get cancel => 'Отмена';

  @override
  String get ok => 'ОК';

  @override
  String get confirmOrderReturn => 'Вы точно хотите вернуть заказ?';

  @override
  String get orderReturnSuccess => 'Возврат успешно произведен';

  @override
  String get refundedToCard => 'Возвращено на карту';

  @override
  String get confirmOrderChange => 'Вы точно хотите переоформить заказ?';

  @override
  String get confirmOrderDeletion => 'Вы действительно хотите удалить этот заказ?';

  @override
  String minutes(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count минут',
      many: '$count минут',
      few: '$count минуты',
      two: '$count минуты',
      one: '$count минуту',
      zero: '0 минут',
    );
    return '$_temp0';
  }

  @override
  String get bookingEndsIn => 'Бронь закончится через';

  @override
  String get somethingWentWrong => 'Что-то пошло не так';

  @override
  String get about => 'О приложении';

  @override
  String get afghanistan => 'Афганистан';

  @override
  String get albania => 'Албания';

  @override
  String get algeria => 'Алжир';

  @override
  String get andorra => 'Андорра';

  @override
  String get angola => 'Ангола';

  @override
  String get antiguaAndBarbuda => 'Антигуа и Барбуда';

  @override
  String get argentina => 'Аргентина';

  @override
  String get armenia => 'Армения';

  @override
  String get australia => 'Австралия';

  @override
  String get austria => 'Австрия';

  @override
  String get azerbaijan => 'Азербайджан';

  @override
  String get bahamas => 'Багамы';

  @override
  String get bahrain => 'Бахрейн';

  @override
  String get bangladesh => 'Бангладеш';

  @override
  String get barbados => 'Барбадос';

  @override
  String get belarus => 'Беларусь';

  @override
  String get belgium => 'Бельгия';

  @override
  String get belize => 'Белиз';

  @override
  String get benin => 'Бенин';

  @override
  String get bhutan => 'Бутан';

  @override
  String get bolivia => 'Боливия';

  @override
  String get bosniaAndHerzegovina => 'Босния и Герцеговина';

  @override
  String get botswana => 'Ботсвана';

  @override
  String get brazil => 'Бразилия';

  @override
  String get brunei => 'Бруней';

  @override
  String get bulgaria => 'Болгария';

  @override
  String get burkinaFaso => 'Буркина-Фасо';

  @override
  String get burundi => 'Бурунди';

  @override
  String get cambodia => 'Камбоджа';

  @override
  String get cameroon => 'Камерун';

  @override
  String get canada => 'Канада';

  @override
  String get capeVerde => 'Кабо-Верде';

  @override
  String get centralAfricanRepublic => 'Центральноафриканская Республика';

  @override
  String get chad => 'Чад';

  @override
  String get chile => 'Чили';

  @override
  String get china => 'Китай';

  @override
  String get colombia => 'Колумбия';

  @override
  String get comoros => 'Коморы';

  @override
  String get congoDemocraticRepublic => 'Демократическая Республика Конго';

  @override
  String get congo => 'Республика Конго';

  @override
  String get costaRica => 'Коста-Рика';

  @override
  String get coteDIvoire => 'Кот-д’Ивуар';

  @override
  String get croatia => 'Хорватия';

  @override
  String get cuba => 'Куба';

  @override
  String get cyprus => 'Кипр';

  @override
  String get czechia => 'Чехия';

  @override
  String get denmark => 'Дания';

  @override
  String get djibouti => 'Джибути';

  @override
  String get dominica => 'Доминика';

  @override
  String get dominicanRepublic => 'Доминиканская Республика';

  @override
  String get ecuador => 'Эквадор';

  @override
  String get egypt => 'Египет';

  @override
  String get elSalvador => 'Сальвадор';

  @override
  String get equatorialGuinea => 'Экваториальная Гвинея';

  @override
  String get eritrea => 'Эритрея';

  @override
  String get estonia => 'Эстония';

  @override
  String get eswatini => 'Эсватини';

  @override
  String get ethiopia => 'Эфиопия';

  @override
  String get fiji => 'Фиджи';

  @override
  String get finland => 'Финляндия';

  @override
  String get france => 'Франция';

  @override
  String get gabon => 'Габон';

  @override
  String get gambia => 'Гамбия';

  @override
  String get georgia => 'Грузия';

  @override
  String get germany => 'Германия';

  @override
  String get ghana => 'Гана';

  @override
  String get greece => 'Греция';

  @override
  String get grenada => 'Гренада';

  @override
  String get guatemala => 'Гватемала';

  @override
  String get guinea => 'Гвинея';

  @override
  String get guineaBissau => 'Гвинея-Бисау';

  @override
  String get guyana => 'Гайана';

  @override
  String get haiti => 'Гаити';

  @override
  String get honduras => 'Гондурас';

  @override
  String get hungary => 'Венгрия';

  @override
  String get iceland => 'Исландия';

  @override
  String get india => 'Индия';

  @override
  String get indonesia => 'Индонезия';

  @override
  String get iran => 'Иран';

  @override
  String get iraq => 'Ирак';

  @override
  String get ireland => 'Ирландия';

  @override
  String get israel => 'Израиль';

  @override
  String get italy => 'Италия';

  @override
  String get jamaica => 'Ямайка';

  @override
  String get japan => 'Япония';

  @override
  String get jordan => 'Иордания';

  @override
  String get kazakhstan => 'Казахстан';

  @override
  String get kenya => 'Кения';

  @override
  String get kiribati => 'Кирибати';

  @override
  String get kuwait => 'Кувейт';

  @override
  String get kyrgyzstan => 'Киргизия';

  @override
  String get laos => 'Лаос';

  @override
  String get latvia => 'Латвия';

  @override
  String get lebanon => 'Ливан';

  @override
  String get lesotho => 'Лесото';

  @override
  String get liberia => 'Либерия';

  @override
  String get libya => 'Ливия';

  @override
  String get liechtenstein => 'Лихтенштейн';

  @override
  String get lithuania => 'Литва';

  @override
  String get luxembourg => 'Люксембург';

  @override
  String get madagascar => 'Мадагаскар';

  @override
  String get malawi => 'Малави';

  @override
  String get malaysia => 'Малайзия';

  @override
  String get maldives => 'Мальдивы';

  @override
  String get mali => 'Мали';

  @override
  String get malta => 'Мальта';

  @override
  String get marshallIslands => 'Маршалловы Острова';

  @override
  String get mauritania => 'Мавритания';

  @override
  String get mauritius => 'Маврикий';

  @override
  String get mexico => 'Мексика';

  @override
  String get micronesia => 'Микронезия';

  @override
  String get moldova => 'Молдавия';

  @override
  String get monaco => 'Монако';

  @override
  String get mongolia => 'Монголия';

  @override
  String get montenegro => 'Черногория';

  @override
  String get morocco => 'Марокко';

  @override
  String get mozambique => 'Мозамбик';

  @override
  String get myanmar => 'Мьянма';

  @override
  String get namibia => 'Намибия';

  @override
  String get nauru => 'Науру';

  @override
  String get nepal => 'Непал';

  @override
  String get netherlands => 'Нидерланды';

  @override
  String get newZealand => 'Новая Зеландия';

  @override
  String get nicaragua => 'Никарагуа';

  @override
  String get niger => 'Нигер';

  @override
  String get nigeria => 'Нигерия';

  @override
  String get northKorea => 'Северная Корея';

  @override
  String get northMacedonia => 'Северная Македония';

  @override
  String get norway => 'Норвегия';

  @override
  String get oman => 'Оман';

  @override
  String get pakistan => 'Пакистан';

  @override
  String get palau => 'Палау';

  @override
  String get panama => 'Панама';

  @override
  String get papuaNewGuinea => 'Папуа-Новая Гвинея';

  @override
  String get paraguay => 'Парагвай';

  @override
  String get peru => 'Перу';

  @override
  String get philippines => 'Филиппины';

  @override
  String get poland => 'Польша';

  @override
  String get portugal => 'Португалия';

  @override
  String get qatar => 'Катар';

  @override
  String get republicOfTheCongo => 'Республика Конго';

  @override
  String get romania => 'Румыния';

  @override
  String get russia => 'Россия';

  @override
  String get rwanda => 'Руанда';

  @override
  String get saintKittsAndNevis => 'Сент-Китс и Невис';

  @override
  String get saintLucia => 'Сент-Люсия';

  @override
  String get saintVincentAndTheGrenadines => 'Сент-Винсент и Гренадины';

  @override
  String get samoa => 'Самоа';

  @override
  String get sanMarino => 'Сан-Марино';

  @override
  String get saoTomeAndPrincipe => 'Сан-Томе и Принсипи';

  @override
  String get saudiArabia => 'Саудовская Аравия';

  @override
  String get senegal => 'Сенегал';

  @override
  String get serbia => 'Сербия';

  @override
  String get seychelles => 'Сейшельские острова';

  @override
  String get sierraLeone => 'Сьерра-Леоне';

  @override
  String get singapore => 'Сингапур';

  @override
  String get slovakia => 'Словакия';

  @override
  String get slovenia => 'Словения';

  @override
  String get solomonIslands => 'Соломоновы острова';

  @override
  String get somalia => 'Сомали';

  @override
  String get southAfrica => 'Южно-Африканская Республика';

  @override
  String get southKorea => 'Южная Корея';

  @override
  String get southSudan => 'Южный Судан';

  @override
  String get spain => 'Испания';

  @override
  String get sriLanka => 'Шри-Ланка';

  @override
  String get sudan => 'Судан';

  @override
  String get suriname => 'Суринам';

  @override
  String get sweden => 'Швеция';

  @override
  String get switzerland => 'Швейцария';

  @override
  String get syria => 'Сирия';

  @override
  String get taiwan => 'Тайвань';

  @override
  String get tajikistan => 'Таджикистан';

  @override
  String get tanzania => 'Танзания';

  @override
  String get thailand => 'Таиланд';

  @override
  String get timorLeste => 'Восточный Тимор';

  @override
  String get togo => 'Того';

  @override
  String get tonga => 'Тонга';

  @override
  String get trinidadAndTobago => 'Тринидад и Тобаго';

  @override
  String get tunisia => 'Тунис';

  @override
  String get turkey => 'Турция';

  @override
  String get turkmenistan => 'Туркменистан';

  @override
  String get tuvalu => 'Тувалу';

  @override
  String get uganda => 'Уганда';

  @override
  String get ukraine => 'Украина';

  @override
  String get unitedArabEmirates => 'Объединенные Арабские Эмираты';

  @override
  String get unitedKingdom => 'Великобритания';

  @override
  String get unitedStates => 'Соединенные Штаты';

  @override
  String get uruguay => 'Уругвай';

  @override
  String get uzbekistan => 'Узбекистан';

  @override
  String get vanuatu => 'Вануату';

  @override
  String get vaticanCity => 'Ватикан';

  @override
  String get venezuela => 'Венесуэла';

  @override
  String get vietnam => 'Вьетнам';

  @override
  String get yemen => 'Йемен';

  @override
  String get zambia => 'Замбия';

  @override
  String get zimbabwe => 'Зимбабве';
}
