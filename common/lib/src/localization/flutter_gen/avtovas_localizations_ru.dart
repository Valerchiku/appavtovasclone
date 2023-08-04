import 'package:intl/intl.dart' as intl;

import 'avtovas_localizations.dart';

/// The translations for Russian (`ru`).
class AvtovasLocalizationRu extends AvtovasLocalization {
  AvtovasLocalizationRu([String locale = 'ru']) : super(locale);

  @override
  String get accept => 'Подтвердить';

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
  String get buyTicket => 'Купить билет';

  @override
  String get carrier => 'Перевозчик';

  @override
  String get clearSearchHistory => 'Очистить историю поиска';

  @override
  String get date => 'Дата';

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
  String get workTime => 'с 05:00 до 20:00 ежедневно';

  @override
  String get emptyPaymentsHistoryTitle => 'Здесь будет история платежей после покупки';

  @override
  String get paymentsHistoryTitle => 'История платежей';
  
  @override
  String get schedule => 'Расписание';

  @override
  String get upcoming => 'Предстоящие';

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
  String get total => 'Итого';

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
}
