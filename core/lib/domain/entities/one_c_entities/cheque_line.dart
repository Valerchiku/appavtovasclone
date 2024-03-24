import 'package:core/domain/entities/domain_object.dart';

final class ChequeLine extends DomainObject {
  final String? chequeLine;
  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        chequeLine,
      ];

  const ChequeLine({
    required this.chequeLine,
  });

  @override
  ChequeLine copyWith() {
    return ChequeLine(
      chequeLine: chequeLine,
    );
  }
}
