import 'dart:async';

import 'package:avtovas_mobile/src/common/platform/interfaces/i_connectivity_wrapper.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityWrapper implements IConnectivityWrapper {
  late bool? _latestResult;
  final Connectivity _connectivity = Connectivity();

  ConnectivityWrapper() {
    _init();
  }

  @override
  void _init() {
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      _maybeEmitStatusUpdate();
    });
  }

  @override
  Future<bool> _isHostReachable() async {
    return _connectivity.checkConnectivity().then((value) {
      return checkConnection(value);
    });
  }

  @override
  Future<void> _maybeEmitStatusUpdate() async {
    final currentStatus = await _isHostReachable();
    _latestResult = currentStatus;
  }

  @override
  Stream<ConnectivityResult> get isConnectedStream =>
      _connectivity.onConnectivityChanged;

  checkConnection(ConnectivityResult result) {
    var isHaveInternet = false;
    switch (result) {
      case ConnectivityResult.wifi || ConnectivityResult.mobile:
        isHaveInternet = true;
    }
    return isHaveInternet;
  }
}
