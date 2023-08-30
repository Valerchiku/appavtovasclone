import 'package:core/domain/entities/domain_object.dart';

final class TicketMarketingCampaign extends DomainObject {
  
final String name;
final String id;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        name,
        id,
      ];

  const TicketMarketingCampaign({
      required this.name,
      required this.id,
  });

  @override
  TicketMarketingCampaign copyWith() {
    return TicketMarketingCampaign(
      name: name,
      id: id,
    );
  }
}