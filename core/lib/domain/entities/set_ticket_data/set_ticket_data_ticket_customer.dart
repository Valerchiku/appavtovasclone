import 'package:core/domain/entities/domain_object.dart';

final class SetTicketDataTicketCustomer extends DomainObject {
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

  const SetTicketDataTicketCustomer({
      required this.name,
      required this.phone,
      required this.email,
      required this.comment,
  });

  @override
  SetTicketDataTicketCustomer copyWith() {
    return SetTicketDataTicketCustomer(
      name: name,
      phone: phone,
      email: email,
      comment: comment,
    );
  }
}
