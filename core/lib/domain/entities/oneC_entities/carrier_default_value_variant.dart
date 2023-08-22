import 'package:core/domain/entities/domain_object.dart';

class CarrierDefaultValueVariant extends DomainObject {
  final String? name;
  final String? inputMask;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        name,
        inputMask,
      ];

  const CarrierDefaultValueVariant({
    this.name,
    this.inputMask,
  });

  @override
  CarrierDefaultValueVariant copyWith() {
    return CarrierDefaultValueVariant(
      name: name,
      inputMask: inputMask,
    );
  }
}
