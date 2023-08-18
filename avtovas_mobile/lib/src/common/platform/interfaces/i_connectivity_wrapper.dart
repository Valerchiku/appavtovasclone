import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

abstract interface class IConnectivityWrapper {
  void _init();

  Stream<ConnectivityResult> get isConnectedStream;

  Future<bool> _isHostReachable();

  Future<void> _maybeEmitStatusUpdate();
}
