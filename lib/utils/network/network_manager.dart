import 'package:coin_master/utils/ui/common_ui_elements.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkManager {
  static void initNetworkMonitor() {
    InternetConnectionChecker().onStatusChange.listen((event) {
      switch (event) {
        case InternetConnectionStatus.connected:
          break;
        case InternetConnectionStatus.disconnected:
          CommonUIElements.showNetworkSnackbar();
          break;
      }
    });
  }
}
