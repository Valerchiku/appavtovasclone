import 'package:core/domain/entities/domain_object.dart';
import 'package:core/domain/entities/oneC_entities/carrier_default_value_variant.dart';

class CarrierPersonalData extends DomainObject {
  final String name;
  final String caption;
  final String mandatory;
  final String personIdentifier;
  final String type;
  final String inputMask;
  final String value;
  final String valueKind;
  final CarrierDefaultValueVariant defaultValueVariant;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        name,
        caption,
        mandatory,
        personIdentifier,
        type,
        inputMask,
        value,
        valueKind,
        defaultValueVariant,
      ];

  const CarrierPersonalData({
    required this.name,
    required this.caption,
    required this.mandatory,
    required this.personIdentifier,
    required this.type,
    required this.inputMask,
    required this.value,
    required this.valueKind,
    required this.defaultValueVariant,
  });

  @override
  CarrierPersonalData copyWith() {
    return CarrierPersonalData(
      name: name,
      caption: caption,
      mandatory: mandatory,
      personIdentifier: personIdentifier,
      type: type,
      inputMask: inputMask,
      value: value,
      valueKind: valueKind,
      defaultValueVariant: defaultValueVariant,
    );
  }
}
