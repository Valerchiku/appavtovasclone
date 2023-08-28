import 'package:equatable/equatable.dart';

final class WebMockContact extends Equatable {
  final String title;
  final String address;
  final String phone;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        title,
        address,
        phone,
      ];

  const WebMockContact({
    required this.title,
    required this.address,
    required this.phone,
  });
}
