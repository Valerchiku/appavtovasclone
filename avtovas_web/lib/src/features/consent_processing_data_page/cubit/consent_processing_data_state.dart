part of 'consent_processing_data_cubit.dart';


final class ConsentProcessingDataState extends Equatable {
  final CustomRoute route;

  @override
  List<Object?> get props => [
        route,
      ];

  const ConsentProcessingDataState({
    required this.route,
  });

  ConsentProcessingDataState copyWith({
    CustomRoute? route,
  }) {
    return ConsentProcessingDataState(
      route: route ?? this.route,
    );
  }
}
