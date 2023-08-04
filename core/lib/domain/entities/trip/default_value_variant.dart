import 'package:core/domain/entities/domain_object.dart';

class DefaultValueVariant extends DomainObject {
  final String? name;
  final String? inputMask;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        name,
        inputMask,
      ];

  const DefaultValueVariant({
    this.name,
    this.inputMask,
  });

  @override
  DefaultValueVariant copyWith() {
    return DefaultValueVariant(
      name: name,
      inputMask: inputMask,
    );
  }
}
