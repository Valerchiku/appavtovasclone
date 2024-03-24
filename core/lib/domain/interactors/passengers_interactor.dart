import 'package:core/avtovas_core.dart';

final class PassengersInteractor {
  final IUserRepository _userRepository;

  PassengersInteractor(this._userRepository);

  Stream<User> get userStream => _userRepository.entityStream;

  User get user => _userRepository.entity;

  Future<void> addPassenger(Passenger passenger) {
    final currentUser = _userRepository.entity;

    final userWithNewPassenger = _userRepository.entity.copyWith(
      passengers: currentUser.passengers == null
          ? [passenger]
          : [
              ...currentUser.passengers!,
              passenger,
            ],
    );

    return _userRepository.updateUser(userWithNewPassenger);
  }

  Future<void> updatePassenger(Passenger passenger) {
    final currentPassengers = _userRepository.entity.passengers!;

    final existentPassengerIndex =
        _userRepository.entity.passengers!.indexWhere(
      (pass) => pass.uuid == passenger.uuid,
    );

    final newPassengers = currentPassengers
      ..removeAt(existentPassengerIndex)
      ..insert(
        existentPassengerIndex,
        passenger,
      );

    final userWithNewPassenger = _userRepository.entity.copyWith(
      passengers: newPassengers,
    );

    return _userRepository.updateUser(userWithNewPassenger);
  }

  Future<void> removePassenger(String passengerUuid) {
    final currentPassengers = _userRepository.entity.passengers!;

    final newPassengers = currentPassengers
      ..removeWhere(
        (passenger) => passenger.uuid == passengerUuid,
      );

    final userWithNewPassenger = _userRepository.entity.copyWith(
      passengers: newPassengers.isEmpty ? null : newPassengers,
      shouldClearPassengers: true,
    );

    return _userRepository.updateUser(userWithNewPassenger);
  }
}
