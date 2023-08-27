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
        name: name,
        phone: phone,
        email: email,
        comment: comment,
      ];

  const SetTicketDataTicketCustomer({
      this.name,
      this.phone,
      this.email,
      this.comment,
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
