import 'package:core/domain/entities/trip/default_value_variant.dart';
import 'package:equatable/equatable.dart';

class CarrierPersonalData extends Equatable {
  final String? name;
  final String? caption;
  final String? mandatory;
  final String? personIdentifier;
  final String? type;
  final String? inputMask;
  final String? value;
  final String? valueKind;
  final DefaultValueVariant? defaultValueVariant;

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
    this.name,
    this.caption,
    this.mandatory,
    this.personIdentifier,
    this.type,
    this.inputMask,
    this.value,
    this.valueKind,
    this.defaultValueVariant,
  });
}
