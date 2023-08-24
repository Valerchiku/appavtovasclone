part of 'contacts_cubit.dart';

final class ContactsState {
  final CustomRoute route;

  const ContactsState({
    required this.route,
  });

  ContactsState copyWith({CustomRoute? route,}) {
    return ContactsState(
      route: route ?? this.route,
    );
  }
}
