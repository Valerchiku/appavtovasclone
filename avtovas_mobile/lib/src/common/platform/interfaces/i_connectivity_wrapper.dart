import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

abstract interface class IConnectivityWrapper {
  void init();

  Stream<ConnectivityResult> get isConnectedStream;
}
