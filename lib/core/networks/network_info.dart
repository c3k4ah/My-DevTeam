import 'package:connectivity_plus/connectivity_plus.dart';

import 'network.dart';

class ConnexionCheckerImp extends ConnexionChecker {
  @override
  Future<bool> checkConnexion() async {
    final ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
}
