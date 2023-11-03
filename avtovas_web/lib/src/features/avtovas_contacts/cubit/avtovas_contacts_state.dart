part of 'avtovas_contacts_cubit.dart';

final class AvtovasContactsState extends Equatable {
  final CustomRoute route;

  @override
  List<Object?> get props => [
        route,
      ];

  const AvtovasContactsState({
    required this.route,
  });

  AvtovasContactsState copyWith({
    CustomRoute? route,
  }) {
    return AvtovasContactsState(
      route: route ?? this.route,
    );
  }
}
