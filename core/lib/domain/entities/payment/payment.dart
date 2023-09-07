import 'package:core/domain/entities/domain_object.dart';

final class Payment extends DomainObject {
  /*final String number;
  final Trip trip;
  final Departure departure;
  final String departureTime;
  final Destination destination;
  // TODO: Edit ticket model
  final Ticket tickets
  */
  @override
  List<Object?> get props => [];

  const Payment();

  @override
  Payment copyWith() {
    return const Payment();
  }
}
