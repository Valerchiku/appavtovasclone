part of 'contacts_cubit.dart';

final class ContactsState extends Equatable {
  final CustomRoute route;

  @override
  List<Object?> get props => [
        route,
      ];

  const ContactsState({
    required this.route,
  });

  ContactsState copyWith({
    CustomRoute? route,
  }) {
    return ContactsState(
      route: route ?? this.route,
    );
  }
}
