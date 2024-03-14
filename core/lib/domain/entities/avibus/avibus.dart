import 'package:core/domain/entities/domain_object.dart';

final class Avibus extends DomainObject {
  final String dbName;
  final String apiUrl;
  final String apiLogin;
  final String apiPassword;
  final String inn;
  final String yookassaShopName;
  final String serviceDescription;
  final String clientPhoneNumber;
  final String clientEmail;
  final String smptPassword;
  final String reserveKind;
  final bool enabled;

  const Avibus({
    required this.dbName,
    required this.apiUrl,
    required this.apiLogin,
    required this.apiPassword,
    required this.inn,
    required this.yookassaShopName,
    required this.serviceDescription,
    required this.clientPhoneNumber,
    required this.clientEmail,
    required this.smptPassword,
    required this.reserveKind,
    required this.enabled,
  });

  @override
  List<Object?> get props => [];

  @override
  DomainObject copyWith() {
    throw UnimplementedError();
  }
}
