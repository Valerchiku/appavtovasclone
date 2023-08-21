import 'package:avtovas_mobile/src/common/platform/connectivity_wrapper.dart';
import 'package:avtovas_mobile/src/common/platform/interfaces/i_connectivity_client.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityClient implements IConnectivityClient {
  final Stream<ConnectivityResult> _connectivityStream;
  bool? _latestResult;

  ConnectivityClient(ConnectivityWrapper connectivityWrapper)
      : _connectivityStream =
            connectivityWrapper.isConnectedStream.asBroadcastStream() {
    _connectivityStream.listen((connection) =>
        _latestResult = connectivityWrapper.checkConnection(connection));
  }

  @override
  bool get hasConnection => _latestResult ?? false;

  @override
  Stream<ConnectivityResult> get connectivityStatus => _connectivityStream;
}
