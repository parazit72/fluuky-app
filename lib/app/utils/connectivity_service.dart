import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

enum InternetStatus { connected, disconnected }

class InternetConnection {
  final Connectivity _connectivity = Connectivity();
  final StreamController<InternetStatus> _controller = StreamController<InternetStatus>.broadcast();

  InternetConnection() {
    _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
        _controller.add(InternetStatus.connected);
      } else {
        _controller.add(InternetStatus.disconnected);
      }
    });
  }

  Stream<InternetStatus> get onStatusChange => _controller.stream;

  Future<bool> isConnected() async {
    var connectivityResult = await _connectivity.checkConnectivity();
    return connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi;
  }

  void dispose() {
    _controller.close();
  }
}
