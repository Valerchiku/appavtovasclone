abstract final class EmailTemplates {
  static String bookingConfirmation({
    required String fullName,
    required String departureDate,
    required String departureStation,
    required String arrivalStation,
    required List<String> seats,
  }) {
    return '''
    <!DOCTYPE html>
      <html lang="en">
        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <title>Подтверждение бронирования автобусного рейса</title>
        <style>
          body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
          }
          .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
          }
          h1 {
            color: #333;
          }
          p {
            color: #555;
          }
          .booking-details {
            margin-top: 20px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
          }
        </style>
        </head>
        <body>
          <div class="container">
            <h1>Подтверждение бронирования автобусного рейса</h1>
              <p>Уважаемый/ая $fullName,</p>
              <p>Ваше бронирование автобусного рейса было успешно подтверждено. Ниже приведены детали вашей поездки:</p>
          <div class="booking-details">
            <p><strong>Дата отправления:</strong> $departureDate</p>
            <p><strong>Место отправления:</strong> $departureStation</p>
            <p><strong>Место назначения:</strong> $arrivalStation</p>
            <p><strong>Место:</strong> $seats</p>
          </div>
        <p>Пожалуйста, приходите на остановку за 30 минут до времени отправления автобуса. Убедитесь, что у вас есть все необходимые документы и билеты.</p>
        <p>Спасибо за выбор нашей компании. Приятной поездки!</p>
          </div>
      </body>
    </html>
  ''';
  }

  static String askQuestion({
    required String fullName,
    required String userEmail,
    required String userPhoneNumber,
    required String userQuestion,
  }) {
    return '''
    <!DOCTYPE html>
      <html lang="en">
        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <title>Вопрос от пользователя {$userEmail}</title>
        <style>
          body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
          }
          .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
          }
          h1 {
            color: #333;
          }
          p {
            color: #555;
          }
          .booking-details {
            margin-top: 20px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
          }
        </style>
        </head>
        <body>
          <div class="container">
            <h1>Вопрос от пользователя</h1>
          <div class="booking-details">
            <p><strong>Имя пользователя:</strong> $fullName</p>
            <p><strong>Почта пользователя:</strong> $userEmail</p>
            <p><strong>Номер тел. пользователя:</strong> $userPhoneNumber</p>
            <p><strong>Вопрос пользователя:</strong> $userQuestion</p>
      </body>
    </html>
  ''';
  }
}
