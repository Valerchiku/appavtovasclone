import 'dart:async';

import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/utils/route_helper.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:core/avtovas_core.dart';
import 'package:core/domain/entities/avibus/avibus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bus_station_contacts_state.dart';

class BusStationContactsCubit extends Cubit<BusStationContactsState> {
  final AvtovasContactsInteractor _avtovasContactsInteractor;
  BusStationContactsCubit(
    this._avtovasContactsInteractor,
  ) : super(
          const BusStationContactsState(
            route: CustomRoute(null, null),
            avtovasPhoneNumber: '',
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<List<Avibus>>? _avtovasPhoneNumberSubscription;

  void onBackButtonTap() {
    emit(
      state.copyWith(
        route: const CustomRoute.pop(),
      ),
    );
  }

  void onNavigationItemTap(int navigationIndex) {
    emit(
      state.copyWith(
        route: RouteHelper.popIndexedRoute(navigationIndex),
      ),
    );

    emit(
      state.copyWith(
        route: const CustomRoute(null, null),
      ),
    );
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
