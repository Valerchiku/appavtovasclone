enum UserTripStatus { upcoming, finished, archive, declined, unimplemented }

abstract final class UserTripStatusHelper {
  static UserTripStatus statusFromString(String status) => switch (status) {
        'upcoming' => UserTripStatus.upcoming,
        'finished' => UserTripStatus.finished,
        'archive' => UserTripStatus.archive,
        'declined' => UserTripStatus.declined,
        _ => UserTripStatus.unimplemented,
      };
}
