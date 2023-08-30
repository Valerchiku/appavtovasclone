import 'package:avtovas_mobile/src/features/main/utils/dialog_statuses.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_trips_state.dart';

class MyTripsCubit extends Cubit<MyTripsState> {
  MyTripsCubit()
      : super(
    const MyTripsState(
      route: CustomRoute(null, null),
      dialogStatus: DialogStatuses.collapsed,
    ),
  ) {
  }

  void _resetRoute() {
    emit(
      state.copyWith(
        route: const CustomRoute(null, null),
      ),
    );
  }

  void toggleDialog() {
    var status = DialogStatuses.collapsed;
    switch (state.dialogStatus) {
      case DialogStatuses.collapsed:
        status = DialogStatuses.expanded;
        break;
      case DialogStatuses.expanded:
        status = DialogStatuses.collapsed;
        break;
    }
    emit(
      state.copyWith(
        dialogStatus: status,
      ),
    );
  }
}
