import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';


@lazySingleton
class ConnectionClient {
  final Connectivity connectivity;

  ConnectionClient(this.connectivity);
  Stream<ConnectivityResult> getCurrentConnectionStatus() async* {
    yield* connectivity.onConnectivityChanged;
  }
}
