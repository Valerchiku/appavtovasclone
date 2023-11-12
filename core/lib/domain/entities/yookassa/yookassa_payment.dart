import 'package:core/domain/entities/domain_object.dart';

final class YookassaPayment extends DomainObject {
  final String id;
  final String status;
  final YookassaAmount amount;
  final String description;
  final YookassaRecipient recipient;
  final YookassaPaymentMethod paymentMethod;
  final DateTime createdAt;
  final YookassaConfirmation confirmation;
  final bool paid;
  final bool refundable;

  const YookassaPayment({
    required this.id,
    required this.status,
    required this.amount,
    required this.description,
    required this.recipient,
    required this.paymentMethod,
    required this.createdAt,
    required this.confirmation,
    required this.paid,
    required this.refundable,
  });

  factory YookassaPayment.error() => YookassaPayment(
        id: 'error',
        status: '',
        amount: const YookassaAmount(value: '', currency: ''),
        description: '',
        recipient: const YookassaRecipient(accountId: '', gatewayId: ''),
        paymentMethod: const YookassaPaymentMethod(
          type: '',
          id: '',
          saved: false,
          title: 'title',
          card: YookassaCard(
            first6: '',
            last4: '',
            expiryYear: '',
            expiryMonth: '',
            cardType: '',
            issuerCountry: '',
          ),
        ),
        createdAt: DateTime.now(),
        confirmation: const YookassaConfirmation(type: '', confirmationUrl: ''),
        paid: false,
        refundable: false,
      );

  @override
  DomainObject copyWith() {
    throw UnimplementedError();
  }

  @override
  List<Object?> get props => [
        id,
        status,
        amount,
        description,
        recipient,
        paymentMethod,
        createdAt,
        confirmation,
        paid,
        refundable,
      ];
}

final class YookassaAmount extends DomainObject {
  final String value;
  final String currency;

  const YookassaAmount({
    required this.value,
    required this.currency,
  });

  @override
  DomainObject copyWith() {
    throw UnimplementedError();
  }

  @override
  List<Object?> get props => [value, currency];
}

final class YookassaRecipient extends DomainObject {
  final String accountId;
  final String gatewayId;

  const YookassaRecipient({
    required this.accountId,
    required this.gatewayId,
  });

  @override
  DomainObject copyWith() {
    throw UnimplementedError();
  }

  @override
  List<Object?> get props => [accountId, gatewayId];
}

final class YookassaPaymentMethod extends DomainObject {
  final String type;
  final String id;
  final bool saved;
  final String title;
  final YookassaCard card;

  const YookassaPaymentMethod({
    required this.type,
    required this.id,
    required this.saved,
    required this.title,
    required this.card,
  });

  @override
  DomainObject copyWith() {
    throw UnimplementedError();
  }

  @override
  List<Object?> get props => [
        type,
        id,
        saved,
        title,
        card,
      ];
}

final class YookassaCard extends DomainObject {
  final String first6;
  final String last4;
  final String expiryYear;
  final String expiryMonth;
  final String cardType;
  final String issuerCountry;

  const YookassaCard({
    required this.first6,
    required this.last4,
    required this.expiryYear,
    required this.expiryMonth,
    required this.cardType,
    required this.issuerCountry,
  });

  @override
  DomainObject copyWith() {
    throw UnimplementedError();
  }

  @override
  List<Object?> get props => [
        first6,
        last4,
        expiryYear,
        expiryMonth,
        cardType,
        issuerCountry,
      ];
}

final class YookassaConfirmation extends DomainObject {
  final String type;
  final String confirmationUrl;

  const YookassaConfirmation({
    required this.type,
    required this.confirmationUrl,
  });

  @override
  DomainObject copyWith() {
    throw UnimplementedError();
  }

  @override
  List<Object?> get props => [type, confirmationUrl];
}
