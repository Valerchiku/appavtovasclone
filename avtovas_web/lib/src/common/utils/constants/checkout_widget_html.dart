import 'package:avtovas_web/src/common/utils/enums/link_types.dart';

abstract final class CheckoutWidgetHtml {
  static String checkoutWidgetHtml({
    required String confirmationToken,
    required String encodedPaymentParams,
  }) {
    return '''
    <!DOCTYPE html>
      <html lang="en">
        <head>
         <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <title>YooMoney Checkout Widget</title>
          <script src="https://yookassa.ru/checkout-widget/v1/checkout-widget.js"></script>
          <style>
            body {
              display: flex;
              justify-content: center;
              align-items: center;
              height: 100vh;
              margin: 0;
            }     
            #payment-form {
              width: 800px; 
            }
          </style>
        </head>
      <body>
        <div id="payment-form"></div>
        <script>
          const checkout = new window.YooMoneyCheckoutWidget({
          confirmation_token: "$confirmationToken",
          return_url: 'https://avtovas.ru/my-trips/${LinkTypes.paymentRedirect.name}/$encodedPaymentParams',
          error_callback: function(error) { }
         });
          checkout.render('payment-form').then(() => {});
       </script>
      </body>
    </html>
''';
  }
}
