import 'package:common/avtovas_navigation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'terms_of_use_state.dart';

class TermsOfUseCubit extends Cubit<TermsOfUseState> {
  TermsOfUseCubit()
      : super(
          const TermsOfUseState(
            route: CustomRoute(null, null),
          ),
        );
}
