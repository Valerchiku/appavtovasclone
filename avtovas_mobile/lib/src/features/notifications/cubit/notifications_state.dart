part of 'notifications_cubit.dart';

final class NotificationsState extends Equatable {
  final bool val;

  @override
  List<Object?> get props =>
      [
        val,
      ];

  const NotificationsState({
    required this.val,
  });

  NotificationsState copyWith({required bool? val}) {
    return NotificationsState(
      val: val ?? this.val,
    );
  }
}
