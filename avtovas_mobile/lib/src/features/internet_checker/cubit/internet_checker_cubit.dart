import 'package:avtovas_mobile/src/common/shared_cubit/theme/theme_shared_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'internet_checker_state.dart';

class InternetCheckerCubit extends Cubit<InternetCheckerState> {
  final status = false;

  InternetCheckerCubit()
      : super(
    InternetCheckerState(status: false),
  );

  void changeStatus(bool status) {
    print('status: $status');
    emit(
      state.copyWith(status: status),
    );
  }
}
