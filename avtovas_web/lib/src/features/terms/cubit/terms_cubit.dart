import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:common/avtovas_navigation.dart';

part 'terms_state.dart';

class TermsCubit extends Cubit<TermsState> {
  TermsCubit()
      : super(
    const TermsState(
      route: CustomRoute(null, null,),
    ),
  );
}
