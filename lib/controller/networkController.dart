import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkController extends GetxController {
  final Connectivity _Connective = Connectivity();

  void onInit() {
    super.onInit();
    _Connective.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(ConnectivityResult connectivityresult) {
    if (connectivityresult == ConnectivityResult.none) {
      Get.rawSnackbar(
          messageText: Text('Please  Connect to Internet'),
          isDismissible: false,
          duration: Duration(days: 1),
          backgroundColor: Colors.red,
          snackStyle: SnackStyle.GROUNDED);
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }
}

class DependecyInjection {
  static void init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
    ;
  }
}
