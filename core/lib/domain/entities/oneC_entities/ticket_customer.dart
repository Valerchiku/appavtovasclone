import 'package:core/domain/entities/domain_object.dart';

final class TicketCustomer extends DomainObject {
  final String name;
  final String phone;
  final String email;
  final String comment;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        name,
        phone,
        email,
        comment,
      ];

  const TicketCustomer({
      required this.name,
      required this.phone,
      required this.email,
      required this.comment,
  });

  @override
  TicketCustomer copyWith() {
    return TicketCustomer(
      name: name,
      phone: phone,
      email: email,
      comment: comment,
    );
  }
}