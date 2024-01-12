abstract final class YookassaRequests {
  static Map<String, dynamic> webCreatePayment({
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
        'type': 'embedded',
      },
      'capture': true,
      'merchant_customer_id': customerEmail,
    };
  }

  static Map<String, dynamic> refundPayment({
    required String paymentId,
    required double refundCostAmount,
    required String paymentDescription,
    required String customerName,
    required String customerInn,
    required String customerEmail,
    required String customerPhone,
  }) {
    return {
      'amount': {
        'value': '$refundCostAmount',
        'currency': 'RUB',
      },
      'payment_id': paymentId,
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
              'value': '$refundCostAmount',
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
    };
  }

  static Map<String, dynamic> sdkCreatePayment({
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
      'test': 'false',
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
