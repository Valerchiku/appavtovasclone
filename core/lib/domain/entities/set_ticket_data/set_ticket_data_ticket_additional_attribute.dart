import 'package:core/domain/entities/domain_object.dart';
import 'package:core/domain/entities/set_ticket_data/value_variant.dart';

final class SetTicketDataTicketAdditionalAttribute extends DomainObject {
  
final String name;
final String caption;
final String mandatory;
final String type;
final List<ValueVariant> valueVariants;
final String inputMask;
final String value;
final String costAttribute;
final String group;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        name,
        caption,
        mandatory,
        type,
        valueVariants,
        inputMask,
        value,
        costAttribute,
        group,
      ];

  const SetTicketDataTicketAdditionalAttribute({
        required this.name,
        required this.caption,
        required this.mandatory,
        required this.type,
        required this.valueVariants,
        required this.inputMask,
        required this.value,
        required this.costAttribute,
        required this.group,
  });

  @override
  SetTicketDataTicketAdditionalAttribute copyWith() {
    return SetTicketDataTicketAdditionalAttribute(
        name: name,
        caption: caption,
        mandatory: mandatory,
        type: type,
        valueVariants: valueVariants,
        inputMask: inputMask,
        value: value,
        costAttribute: costAttribute,
        group: group,
    );
  }
}
