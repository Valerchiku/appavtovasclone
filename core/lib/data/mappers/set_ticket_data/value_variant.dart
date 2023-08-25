import 'package:core/domain/entities/domain_object.dart';

final class ValueVariant extends DomainObject {
  
final String name;
final String inputMask;
final String value1;
final String value2;
final String value3;
final String value4;
final String value5;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        name,
        inputMask,
        value1,
        value2,
        value3,
        value4,
        value5,
      ];

  const ValueVariant({
        required this.name,
        this.inputMask,
        this.value1,
        this.value2,
        this.value3,
        this.value4,
        this.value5,
  });

  @override
  ValueVariant copyWith() {
    return ValueVariant(
        name: name,
        inputMask: inputMask,
        value1: value1,
        value2: value2,
        value3: value3,
        value4: value4,
        value5: value5,
    );
  }
}
