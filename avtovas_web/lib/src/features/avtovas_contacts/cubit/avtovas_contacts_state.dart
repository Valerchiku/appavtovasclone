part of 'avtovas_contacts_cubit.dart';

final class AvtovasContactsState {
  final CustomRoute route;

  const AvtovasContactsState({
    required this.route,
  });

  AvtovasContactsState copyWith({CustomRoute? route,}) {
    return AvtovasContactsState(
      route: route ?? this.route,
    );
  }
}
