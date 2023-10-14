import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/yookassa/yookassa_payment.dart';

final class YookassaPaymentMapper implements BaseMapper<YookassaPayment> {
  @override
  Map<String, dynamic> toJson(YookassaPayment data) {
    throw UnimplementedError();
  }

  @override
  YookassaPayment fromJson(Map<String, dynamic> json) {
    return YookassaPayment(
      id: json[_PaymentFields.id],
      status: json[_PaymentFields.status],
      amount: _AmountMapper().fromJson(
        json[_PaymentFields.amount],
      ),
      description: json[_PaymentFields.description],
      recipient: _RecipientMapper().fromJson(
        json[_PaymentFields.recipient],
      ),
      paymentMethod: _PaymentMethodMapper().fromJson(
        json[_PaymentFields.paymentMethod],
      ),
      createdAt: DateTime.parse(json[_PaymentFields.createdAt]),
      confirmation: _ConfirmationMapper().fromJson(
        json[_PaymentFields.confirmation],
      ),
      paid: json[_PaymentFields.paid],
      refundable: json[_PaymentFields.refundable],
    );
  }
}

abstract final class _PaymentFields {
  static const String id = 'id';
  static const String status = 'status';
  static const String amount = 'amount';
  static const String description = 'description';
  static const String recipient = 'recipient';
  static const String paymentMethod = 'payment_method';
  static const String createdAt = 'created_at';
  static const String confirmation = 'confirmation';
  static const String paid = 'paid';
  static const String refundable = 'refundable';
}

final class _AmountMapper implements BaseMapper<YookassaAmount> {
  @override
  Map<String, dynamic> toJson(YookassaAmount data) {
    throw UnimplementedError();
  }

  @override
  YookassaAmount fromJson(Map<String, dynamic> json) {
    return YookassaAmount(
      value: json[_AmountFields.value],
      currency: json[_AmountFields.currency],
    );
  }
}

abstract final class _AmountFields {
  static const String value = 'value';
  static const String currency = 'currency';
}

final class _RecipientMapper implements BaseMapper<YookassaRecipient> {
  @override
  Map<String, dynamic> toJson(YookassaRecipient data) {
    throw UnimplementedError();
  }

  @override
  YookassaRecipient fromJson(Map<String, dynamic> json) {
    return YookassaRecipient(
      accountId: json[_RecipientFields.accountId],
      gatewayId: json[_RecipientFields.gatewayId],
    );
  }
}

abstract final class _RecipientFields {
  static const String accountId = 'account_id';
  static const String gatewayId = 'gateway_id';
}

final class _PaymentMethodMapper implements BaseMapper<YookassaPaymentMethod> {
  @override
  Map<String, dynamic> toJson(YookassaPaymentMethod data) {
    throw UnimplementedError();
  }

  @override
  YookassaPaymentMethod fromJson(Map<String, dynamic> json) {
    return YookassaPaymentMethod(
      type: json[_PaymentMethodFields.type],
      id: json[_PaymentMethodFields.id],
      saved: json[_PaymentMethodFields.saved],
      title: json[_PaymentMethodFields.title],
      card: _CardMapper().fromJson(
        json[_PaymentMethodFields.card],
      ),
    );
  }
}

abstract final class _PaymentMethodFields {
  static const String type = 'type';
  static const String id = 'id';
  static const String saved = 'saved';
  static const String title = 'title';
  static const String card = 'card';
}

final class _CardMapper implements BaseMapper<YookassaCard> {
  @override
  Map<String, dynamic> toJson(YookassaCard data) {
    throw UnimplementedError();
  }

  @override
  YookassaCard fromJson(Map<String, dynamic> json) {
    return YookassaCard(
      first6: json[_CardFields.first6],
      last4: json[_CardFields.last4],
      expiryYear: json[_CardFields.expiryYear],
      expiryMonth: json[_CardFields.expiryMonth],
      cardType: json[_CardFields.cardType],
      issuerCountry: json[_CardFields.issuerCountry],
    );
  }
}

abstract final class _CardFields {
  static const String first6 = 'first6';
  static const String last4 = 'last4';
  static const String expiryYear = 'expiry_year';
  static const String expiryMonth = 'expiry_month';
  static const String cardType = 'card_type';
  static const String issuerCountry = 'issuer_country';
}

final class _ConfirmationMapper implements BaseMapper<YookassaConfirmation> {
  @override
  Map<String, dynamic> toJson(YookassaConfirmation data) {
    throw UnimplementedError();
  }

  @override
  YookassaConfirmation fromJson(Map<String, dynamic> json) {
    return YookassaConfirmation(
      type: json[_ConfirmationFields.type],
      confirmationUrl: json[_ConfirmationFields.confirmationUrl],
    );
  }
}

final class _ConfirmationFields {
  static const String type = 'type';
  static const String confirmationUrl = 'confirmation_url';
}
