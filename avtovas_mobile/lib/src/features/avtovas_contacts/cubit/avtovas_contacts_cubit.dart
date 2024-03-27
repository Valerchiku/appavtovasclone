import 'dart:async';

import 'package:avtovas_mobile/src/common/navigation/app_router.dart';
import 'package:avtovas_mobile/src/common/navigation/configurations.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/utils/route_helper.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:core/domain/entities/avibus/avibus.dart';
import 'package:core/domain/interactors/avtovas_contacts_interactor.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'avtovas_contacts_state.dart';

class AvtovasContactsCubit extends Cubit<AvtovasContactsState> {
  final AvtovasContactsInteractor _avtovasContactsInteractor;

  AvtovasContactsCubit(this._avtovasContactsInteractor)
      : super(
          const AvtovasContactsState(
            route: CustomRoute(null, null),
            avtovasPhoneNumber: '',
          ),
        ) {
    _subscribeAll();
  }

  final _appRouter = AppRouter.appRouter;

  StreamSubscription<List<Avibus>>? _avtovasPhoneNumberSubscription;

  void onNavigationItemTap(int navigationIndex) {
    emit(
      state.copyWith(
        route: RouteHelper.clearedRoute(navigationIndex),
      ),
    );

    emit(
      state.copyWith(
        route: const CustomRoute(null, null),
      ),
    );
  }

  void onBackButtonTap() {
    emit(
      state.copyWith(
        route: RouteHelper.clearedRoute(
          2,
          shouldReplace: true,
          shouldClearStack: true,
        ),
      ),
    );
  }

  void navigateToTermsOfUse() {
    _appRouter.navigateTo(
      CustomRoute(RouteType.navigateTo, contractOfferConfig()),
    );
  }

  Future<void> sendSupportMail({
    required String userName,
    required String mailAddress,
    required String phoneNumber,
    required String message,
  }) {
    return _avtovasContactsInteractor.sendMail(
      userName: userName,
      mailAddress: mailAddress,
      phoneNumber: phoneNumber,
      message: message,
    );
  }

  @override
  Future<void> close() {
    _avtovasPhoneNumberSubscription?.cancel();
    _avtovasPhoneNumberSubscription = null;

    return super.close();
  }

  void _subscribeAll() {
    _avtovasPhoneNumberSubscription?.cancel();
    _avtovasPhoneNumberSubscription = null;

    _avtovasPhoneNumberSubscription =
        _avtovasContactsInteractor.avibusSettingsStream.listen(
      (settings) {
        emit(
          state.copyWith(avtovasPhoneNumber: settings.first.clientPhoneNumber),
        );
      },
    );
  }
}
