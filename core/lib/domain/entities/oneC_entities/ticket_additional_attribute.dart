import 'package:core/domain/entities/domain_object.dart';
import 'package:core/domain/entities/oneC_entities/carrier_default_value_variant.dart';

final class TicketAdditionalAttribute extends DomainObject {
  
final String name;
final String caption;
final String mandatory;
final String type;
final List<CarrierDefaultValueVariant> valueVariants;
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

  const TicketAdditionalAttribute({
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
  TicketAdditionalAttribute copyWith() {
    return TicketAdditionalAttribute(
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