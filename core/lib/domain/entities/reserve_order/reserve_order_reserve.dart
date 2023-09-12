import 'package:core/domain/entities/domain_object.dart';

final class ReserveOrderReserve extends DomainObject {
  final String reserveKind;
  final String reserveCost;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        reserveKind,
        reserveCost,
      ];

  const ReserveOrderReserve({
    required this.reserveKind,
    required this.reserveCost,
  });

  @override
  ReserveOrderReserve copyWith() {
    return ReserveOrderReserve(
      reserveKind: reserveKind,
      reserveCost: reserveCost,
    );
  }
}
