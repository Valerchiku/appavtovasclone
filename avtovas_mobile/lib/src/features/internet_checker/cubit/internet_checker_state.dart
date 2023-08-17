part of 'internet_checker_cubit.dart';

class InternetCheckerState {
  final bool status;

  InternetCheckerState({
    required this.status,
  });

  InternetCheckerState copyWith({bool? status}) {
    return InternetCheckerState(
      status: status ?? this.status,
    );
  }
}
