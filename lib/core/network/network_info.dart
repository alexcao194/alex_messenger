import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl extends NetworkInfo {
  NetworkInfoImpl({required this.internetChecker});

  final InternetConnectionCheckerPlus internetChecker;
  @override
  Future<bool> get isConnected => internetChecker.hasConnection;
}