import 'package:core/domain/entities/domain_object.dart';

final class ReturnPaymentPositionPuryevorData extends DomainObject {
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

  const ReturnPaymentPositionPuryevorData({
    required this.name,
    required this.taxId,
    required this.phone,
  });

  @override
  ReturnPaymentPositionPuryevorData copyWith() {
    return ReturnPaymentPositionPuryevorData(
      name: name,
      taxId: taxId,
      phone: phone,
    );
  }
}
