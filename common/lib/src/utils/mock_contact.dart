import 'package:equatable/equatable.dart';

final class MockContact extends Equatable {
  final String title;
  final String phone;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        title,
        phone,
      ];

  const MockContact({
    required this.title,
    required this.phone,
  });
}
