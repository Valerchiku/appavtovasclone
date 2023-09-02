import 'package:core/domain/entities/add_ticket/add_ticket_value_variant.dart';
import 'package:core/domain/entities/domain_object.dart';

final class AddTicketPersonalData extends DomainObject {
  final String name;
  final String caption;
  final String mandatory;
  final String personIdentifier;
  final String type;
  final List<AddTicketValueVariants> valueVariants;
  final String inputMask;
  final String value;
  final String valueKind;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        name,
        caption,
        mandatory,
        personIdentifier,
        type,
        valueVariants,
        inputMask,
        value,
        valueKind,
      ];

  const AddTicketPersonalData({
    required this.name,
    required this.caption,
    required this.mandatory,
    required this.personIdentifier,
    required this.type,
    required this.valueVariants,
    required this.inputMask,
    required this.value,
    required this.valueKind,
  });

  @override
  AddTicketPersonalData copyWith() {
    return AddTicketPersonalData(
      name: name,
      caption: caption,
      mandatory: mandatory,
      personIdentifier: personIdentifier,
      type: type,
      valueVariants: valueVariants,
      inputMask: inputMask,
      value: value,
      valueKind: valueKind,
    );
  }
}
