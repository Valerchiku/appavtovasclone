import 'dart:async';

import 'package:avtovas_mobile/src/common/platform/interfaces/i_connectivity_wrapper.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityWrapper implements IConnectivityWrapper {
  // ignore: unused_field
  late bool _latestResult;
  final Connectivity _connectivity = Connectivity();

  ConnectivityWrapper() {
    init();
  }

  @override
  void init() {
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      _maybeEmitStatusUpdate();
    });
  }

  Future<bool> _isHostReachable() async {
    return _connectivity.checkConnectivity().then(checkConnection);
  }

  Future<void> _maybeEmitStatusUpdate() async {
    final currentStatus = await _isHostReachable();
    _latestResult = currentStatus;
  }

  @override
  Stream<ConnectivityResult> get isConnectedStream =>
      _connectivity.onConnectivityChanged;

  bool checkConnection(ConnectivityResult result) {
    var isHaveInternet = false;
    switch (result) {
      case ConnectivityResult.wifi:
        isHaveInternet = true;
      case ConnectivityResult.mobile:
        isHaveInternet = true;
      case ConnectivityResult.ethernet:
        isHaveInternet = true;
      case ConnectivityResult.other:
        isHaveInternet = true;
      case ConnectivityResult.vpn:
        isHaveInternet = true;
      case ConnectivityResult.bluetooth:
        isHaveInternet = false;
      case ConnectivityResult.none:
        isHaveInternet = false;
    }
    return isHaveInternet;
  }
}
