import 'package:common/avtovas_navigation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'consent_processing_data_state.dart';

class ConsentProcessingDataCubit extends Cubit<ConsentProcessingDataState> {
  ConsentProcessingDataCubit()
      : super(
          const ConsentProcessingDataState(
            route: CustomRoute(null, null),
          ),
        );
}
