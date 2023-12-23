part of 'contract_offer_cubit.dart';


final class ContractOfferState extends Equatable {
  final CustomRoute route;

  @override
  List<Object?> get props => [
        route,
      ];

  const ContractOfferState({
    required this.route,
  });

  ContractOfferState copyWith({
    CustomRoute? route,
  }) {
    return ContractOfferState(
      route: route ?? this.route,
    );
  }
}
