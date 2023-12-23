import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:avtovas_web/src/common/navigation/app_router.dart';
import 'package:avtovas_web/src/common/navigation/configurations.dart';
import 'package:avtovas_web/src/common/shared_cubit/theme/theme_shared_cubit.dart';
import 'package:avtovas_web/src/common/utils/enums/link_types.dart';
import 'package:avtovas_web/src/common/utils/remote_links_handler.dart';
import 'package:avtovas_web/src/common/utils/theme_type.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:core/domain/interactors/app_intercator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final AppIntercator _appIntercator;
  final ThemeSharedCubit _themeCubit;

  AppCubit(
    this._appIntercator,
    this._themeCubit,
  ) : super(
          AppState(themeType: _themeCubit.state.themeType),
        ) {
    _onAppStarted();
  }

  final _router = AppRouter.appRouter;

  StreamSubscription<String>? _remoteLinksSubscription;

  StreamSubscription<bool>? _remoteConnectionSubscription;

  @override
  Future<void> close() {
    _remoteConnectionSubscription?.cancel();
    _remoteConnectionSubscription = null;

    _remoteLinksSubscription?.cancel();
    _remoteLinksSubscription = null;

    return super.close();
  }

  void _onAppStarted() {
    _fetchAuthorizedUser();
    _subscribeAll();
    _changeTheme(_themeCubit.state.themeType);
    _themeCubit.stream.listen(
      (state) {
        _changeTheme(state.themeType);
      },
    );
  }

  void _subscribeAll() {
    _remoteLinksSubscription?.cancel();
    _remoteLinksSubscription = AppLinks().allStringLinkStream.listen(
          _onNewAppLink,
        );
  }

  Future<void> _fetchAuthorizedUser() async {
    final userUuid = await _appIntercator.fetchLocalUserUuid();
    if (userUuid.isNotEmpty && userUuid != '-1' && userUuid != '0') {
      _appIntercator.fetchUser(userUuid);
      _remoteConnectionSubscription?.cancel();
      _remoteConnectionSubscription = null;
    }
  }

  void _onNewAppLink(String link) {
    final linkType = RemoteLinksHandler.linkTypeFromFullLink(link);

    if (linkType == LinkTypes.paymentRedirect) {
      final redirectParams = RemoteLinksHandler.paymentRedirectParams(link);

      final paymentId = redirectParams.$1;
      final paidTripId = redirectParams.$2;

      _router.navigateTo(
        CustomRoute(
          RouteType.navigateTo,
          myTripsConfig(statusedTripId: paidTripId, paymentId: paymentId),
        ),
      );
    }
  }

  void _changeTheme(ThemeType themeType) {
    emit(
      state.copyWith(themeType: themeType),
    );
  }
}
