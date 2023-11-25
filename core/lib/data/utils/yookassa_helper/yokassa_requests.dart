abstract final class YookassaRequests {
  static Map<String, dynamic> createPayment({
    required String paymentToken,
    required double cost,
    required String paymentDescription,
    required String customerName,
    required String customerInn,
    required String customerEmail,
    required String customerPhone,
  }) {
    return {
      'amount': {
        'value': '$cost',
        'currency': 'RUB',
      },
      'payment_token': paymentToken,
      'description': paymentDescription,
      'test': 'true',
      'receipt': {
        'customer': {
          'full_name': customerName,
          'inn': customerInn,
          'email': customerEmail,
          'phone': customerPhone,
        },
        'items': [
          {
            'description': paymentDescription,
            'amount': {
              'value': '$cost',
              'currency': 'RUB',
            },
            'vat_code': 2,
            'quantity': '1',
            'measure': 'piece',
            'payment_subject': 'service',
            'payment_mode': 'full_payment',
            'country_of_origin_code': 'RU',
          },
        ],
      },
      'confirmation': {
        'type': 'redirect',
        'locale': 'ru_RU',
        'return_url': 'ruavtovasapplication',
      },
      'capture': true,
      'merchant_customer_id': customerEmail,
    };
  }
}
