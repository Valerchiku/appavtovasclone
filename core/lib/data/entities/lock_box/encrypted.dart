import 'package:core/data/entities/api_object.dart';

final class Encrypted extends ApiObject {
  final String rsaKey;
  final String aesMode;
  final String ivKey;

  const Encrypted({
    required this.rsaKey,
    required this.aesMode,
    required this.ivKey,
  });

  @override
  List<Object?> get props => [
    rsaKey,
    aesMode,
    ivKey,
  ];

  @override
  ApiObject copyWith() {
    throw UnimplementedError();
  }
}
