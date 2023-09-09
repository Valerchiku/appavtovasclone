import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/reserve_order/reserve_order_customer.dart';

final class ReserveOrderCustomerMapper
    implements BaseMapper<ReserveOrderCustomer> {
  @override
  Map<String, dynamic> toJson(ReserveOrderCustomer data) {
    return {
      _Fields.name: data.name,
      _Fields.phone: data.phone,
      _Fields.email: data.email,
      _Fields.comment: data.comment,
    };
  }

  @override
  ReserveOrderCustomer fromJson(Map<String, dynamic> json) {
    return ReserveOrderCustomer(
      name: json[_Fields.name] ?? '',
      phone: json[_Fields.phone] ?? '',
      email: json[_Fields.email] ?? '',
      comment: json[_Fields.comment] ?? '',
    );
  }
}

abstract final class _Fields {
  static const name = 'Name';
  static const phone = 'Phone';
  static const email = 'Email';
  static const comment = 'Comment';
}
