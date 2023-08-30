import 'package:connectivity_plus/connectivity_plus.dart';

abstract interface class IConnectivityClient {
    bool get hasConnection;

    Stream<ConnectivityResult> get connectivityStatus;
}
