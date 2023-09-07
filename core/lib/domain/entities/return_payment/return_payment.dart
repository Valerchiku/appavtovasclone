import 'package:core/domain/entities/domain_object.dart';

final class ReturnPayment extends DomainObject {
  @override
  List<Object?> get props => [];

  const ReturnPayment();

  @override
  ReturnPayment copyWith() {
    return const ReturnPayment();
  }
}
