import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkCheck with ChangeNotifier {
  late bool _hasInternet = true;

  bool get hasInternet => _hasInternet;

  set hasInternet(bool internetCheckResult) {
    _hasInternet = internetCheckResult;
    notifyListeners();
  }

  checkIfDeviceHasConnection() async {
    hasInternet = await InternetConnectionChecker().hasConnection;
  }
}
