part of 'avtovas_contacts_cubit.dart';

final class AvtovasContactsState extends Equatable {
  final CustomRoute route;
  final String avtovasPhoneNumber;

  @override
  List<Object?> get props => [route, avtovasPhoneNumber];

  const AvtovasContactsState({
    required this.route,
    required this.avtovasPhoneNumber,
  });

  AvtovasContactsState copyWith({
    CustomRoute? route,
    String? avtovasPhoneNumber,
  }) {
    return AvtovasContactsState(
      route: route ?? this.route,
      avtovasPhoneNumber: avtovasPhoneNumber ?? this.avtovasPhoneNumber,
    );
  }
}
