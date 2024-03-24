import 'package:common/avtovas_navigation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'return_condition_state.dart';

class ReturnConditionCubit extends Cubit<ReturnConditionState> {
  ReturnConditionCubit()
      : super(
          const ReturnConditionState(
            route: CustomRoute(null, null),
          ),
        );
}
