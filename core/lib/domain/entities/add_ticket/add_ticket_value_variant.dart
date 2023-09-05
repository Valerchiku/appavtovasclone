import 'package:core/domain/entities/domain_object.dart';

final class AddTicketValueVariants extends DomainObject {
  final String name;
  final String? inputMask;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        name,
        inputMask,
      ];

  const AddTicketValueVariants({
    required this.name,
    this.inputMask,
  });

  @override
  AddTicketValueVariants copyWith() {
    return AddTicketValueVariants(
      name: name,
      inputMask: inputMask,
    );
  }
}
