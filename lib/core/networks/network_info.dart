import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'network.dart';

class ConnexionCheckerImp extends ConnexionChecker {
  final InternetConnection connectivity;

  ConnexionCheckerImp({
    required this.connectivity,
  });

  @override
  Future<bool> get isConnected async => (await connectivity.hasInternetAccess);
}
