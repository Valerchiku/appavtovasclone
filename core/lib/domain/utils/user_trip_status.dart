enum UserTripStatus { upcoming, finished, archive, declined, unimplemented }

enum UserTripCostStatus {
  reserved,
  expiredReverse,
  paid,
  returned,
  declined,
  unimplemented,
}

abstract final class UserTripStatusHelper {
  static UserTripStatus tripStatusFromString(String status) => switch (status) {
        'upcoming' => UserTripStatus.upcoming,
        'finished' => UserTripStatus.finished,
        'archive' => UserTripStatus.archive,
        'declined' => UserTripStatus.declined,
        _ => UserTripStatus.unimplemented,
      };

  static UserTripCostStatus tripCostStatusFromString(String status) =>
      switch (status) {
        'reserved' => UserTripCostStatus.reserved,
        'expiredReverse' => UserTripCostStatus.expiredReverse,
        'paid' => UserTripCostStatus.paid,
        'returned' => UserTripCostStatus.returned,
        'declined' => UserTripCostStatus.declined,
        _ => UserTripCostStatus.unimplemented,
      };
}
