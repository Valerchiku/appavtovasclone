part of 'privacy_policy_cubit.dart';


final class PrivacyPolicyState extends Equatable {
  final CustomRoute route;

  @override
  List<Object?> get props => [
        route,
      ];

  const PrivacyPolicyState({
    required this.route,
  });

  PrivacyPolicyState copyWith({
    CustomRoute? route,
  }) {
    return PrivacyPolicyState(
      route: route ?? this.route,
    );
  }
}
