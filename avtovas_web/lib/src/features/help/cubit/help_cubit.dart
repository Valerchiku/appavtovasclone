import 'dart:html';

import 'package:common/avtovas_navigation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'help_state.dart';

class HelpCubit extends Cubit<HelpState> {
  HelpCubit()
      : super(
          const HelpState(
            route: CustomRoute(
              null,
              null,
            ),
          ),
        );

  void onCallOrAskQuestionButtonTap() {
    emit(
      state.copyWith(
        route: CustomRoute(
          RouteType.navigateTo,
          null,
        ),
      ),
    );
    _resetRoute();
  }

  void onReferenceInfoButtonTap() {
    emit(
      state.copyWith(
        route: CustomRoute(
          RouteType.navigateTo,
          null,
        ),
      ),
    );
    _resetRoute();
  }

  void onContactsButtonTap() {
    emit(
      state.copyWith(
        route: CustomRoute(
          RouteType.navigateTo,
          null,
        ),
      ),
    );
    _resetRoute();
  }

  void _resetRoute() {
    emit(
      state.copyWith(
        route: const CustomRoute(null, null),
      ),
    );
  }
}
