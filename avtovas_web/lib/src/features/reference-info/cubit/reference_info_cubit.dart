import 'package:common/avtovas_navigation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reference_info_state.dart';

class ReferenseInfoCubit extends Cubit<ReferenceInfoState> {
  ReferenseInfoCubit()
      : super(
          const ReferenceInfoState(
            route: CustomRoute(
              null,
              null,
            ),
          ),
        );
}
