import 'package:core/domain/entities/domain_object.dart';

final class ReturnOneCPaymentPositionPuryevorData extends DomainObject {
  final String name;
  final String taxId;
  final String phone;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        name,
        taxId,
        phone,
      ];

  const ReturnOneCPaymentPositionPuryevorData({
    required this.name,
    required this.taxId,
    required this.phone,
  });

  @override
  ReturnOneCPaymentPositionPuryevorData copyWith() {
    return ReturnOneCPaymentPositionPuryevorData(
      name: name,
      taxId: taxId,
      phone: phone,
    );
  }
}