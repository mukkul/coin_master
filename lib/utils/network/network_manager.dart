import 'package:coin_master/utils/ui/common_ui_elements.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class NetworkManager {
  static void initNetworkMonitor() {
    InternetConnection().onStatusChange.listen((event) {
      switch (event) {
        case InternetStatus.connected:
          break;
        case InternetStatus.disconnected:
          CommonUIElements.showNetworkSnackBar();
          break;
      }
    });
  }
}
