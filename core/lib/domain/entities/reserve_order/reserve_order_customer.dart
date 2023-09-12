import 'package:core/domain/entities/domain_object.dart';

final class ReserveOrderCustomer extends DomainObject {
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

  const ReserveOrderCustomer({
    required this.name,
    required this.phone,
    required this.email,
    required this.comment,
  });

  @override
  ReserveOrderCustomer copyWith() {
    return ReserveOrderCustomer(
      name: name,
      phone: phone,
      email: email,
      comment: comment,
    );
  }
}
