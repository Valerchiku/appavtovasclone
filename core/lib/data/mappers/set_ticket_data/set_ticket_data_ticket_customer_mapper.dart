import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/set_ticket_data/set_ticket_data_ticket_customer.dart';

abstract final class _Fields {
  static const String name = 'Name';
  static const String phone = 'Phone';
  static const String email = 'Email';
  static const String comment = 'Comment';
}

final class SetTicketDataTicketCustomerMapper
    implements BaseMapper<SetTicketDataTicketCustomer> {
  @override
  Map<String, dynamic> toJson(SetTicketDataTicketCustomer data) {
    return {
      _Fields.name: data.name,
      _Fields.phone: data.phone,
      _Fields.email: data.email,
      _Fields.comment: data.comment,
    };
  }

  @override
  SetTicketDataTicketCustomer fromJson(Map<String, dynamic> json) {
    return SetTicketDataTicketCustomer(
      name: json[_Fields.name],
      phone: json[_Fields.phone],
      email: json[_Fields.email],
      comment: json[_Fields.comment],
    );
  }
}
