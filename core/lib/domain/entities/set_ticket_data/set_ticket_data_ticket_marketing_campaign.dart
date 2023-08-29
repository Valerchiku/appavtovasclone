import 'package:core/domain/entities/domain_object.dart';

final class SetTicketDataTicketMarketingCampaign extends DomainObject {
  
final String name;
final String id;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        name,
        id,
      ];

  const SetTicketDataTicketMarketingCampaign({
      required this.name,
      required this.id,
  });

  @override
  SetTicketDataTicketMarketingCampaign copyWith() {
    return SetTicketDataTicketMarketingCampaign(
      name: name,
      id: id,
    );
  }
}
