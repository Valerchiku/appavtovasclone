import 'package:core/domain/entities/domain_object.dart';

final class AddTicketReturn extends DomainObject {
  @override
  List<Object?> get props => [];

  const AddTicketReturn();

  @override
  AddTicketReturn copyWith() {
    return const AddTicketReturn();
  }
}
