import 'package:connectivity_plus/connectivity_plus.dart';

abstract interface class IConnectivityClient {
    ConnectivityResult get hasConnection;

    Stream<ConnectivityResult> get connectivityStatus;
}