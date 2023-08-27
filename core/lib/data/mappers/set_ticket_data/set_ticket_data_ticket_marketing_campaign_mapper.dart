import 'package:core/data/mappers/base_mapper.dart';

abstract final class _Fields {
  static const String name = 'Name';
  static const String id = 'Id';
}

final class SetTicketDataTicketMarketingCampaignMapper implements BaseMapper<SetTicketDataTicketMarketingCampaign> {
  @override
  Map<String, dynamic> toJson(SetTicketDataTicketMarketingCampaign data) {
    return {
      _Fields.name: data.name,
      _Fields.id: data.id,
    };
  }

  @override
  SetTicketDataTicketMarketingCampaign fromJson(Map<String, dynamic> json) {
    return SetTicketDataTicketMarketingCampaign(
      name: json[_Fields.name],
      id: json[_Fields.id],
    );
  }
}
