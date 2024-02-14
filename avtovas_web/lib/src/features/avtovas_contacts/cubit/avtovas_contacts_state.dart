part of 'avtovas_contacts_cubit.dart';

final class AvtovasContactsState extends Equatable {
  final String avtovasPhoneNumber;

  @override
  List<Object?> get props => [avtovasPhoneNumber];

  const AvtovasContactsState({
    required this.avtovasPhoneNumber,
  });

  AvtovasContactsState copyWith({
    String? avtovasPhoneNumber,
  }) {
    return AvtovasContactsState(
      avtovasPhoneNumber: avtovasPhoneNumber ?? this.avtovasPhoneNumber,
    );
  }
}
