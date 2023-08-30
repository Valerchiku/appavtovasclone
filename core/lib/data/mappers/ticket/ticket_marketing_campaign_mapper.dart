import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/oneC_entities/ticket_marketing_campaign.dart';

abstract final class _Fields {
  static const String name = 'Name';
  static const String id = 'Id';
}

final class TicketMarketingCampaignMapper implements BaseMapper<TicketMarketingCampaign> {
  @override
  Map<String, dynamic> toJson(TicketMarketingCampaign data) {
    return {
      _Fields.name: data.name,
      _Fields.id: data.id,
    };
  }

  @override
  TicketMarketingCampaign fromJson(Map<String, dynamic> json) {
    return TicketMarketingCampaign(
      name: json[_Fields.name],
      id: json[_Fields.id],
    );
  }
}
