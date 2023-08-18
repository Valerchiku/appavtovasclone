import 'package:avtovas_mobile/src/common/platform/interfaces/i_connectivity_client.dart';
import 'package:avtovas_mobile/src/common/platform/interfaces/i_connectivity_wrapper.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityClient implements IConnectivityClient {
  final Stream<ConnectivityResult> _connectivityStream;
  ConnectivityResult _latestResult = ConnectivityResult.none;

  ConnectivityClient(IConnectivityWrapper connectivityWrapper)
      : _connectivityStream =
            connectivityWrapper.isConnectedStream.asBroadcastStream() {
    _connectivityStream.listen((connection) => _latestResult = connection);
  }

  @override
  ConnectivityResult get hasConnection => _latestResult;

  @override
  Stream<ConnectivityResult> get connectivityStatus => _connectivityStream;
}
