import 'package:equatable/equatable.dart';

class DefaultValueVariant extends Equatable {
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
}
