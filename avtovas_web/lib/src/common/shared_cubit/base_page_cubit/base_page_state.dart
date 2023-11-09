part of 'base_page_cubit.dart';

final class BasePageState extends Equatable {
  final bool isUserAuthorized;

  const BasePageState({
    required this.isUserAuthorized,
  });

  @override
  List<Object?> get props => [
        isUserAuthorized,
      ];

  BasePageState copyWith({
    bool? isUserAuthorized,
  }) {
    return BasePageState(
      isUserAuthorized: isUserAuthorized ?? this.isUserAuthorized,
    );
  }
}
