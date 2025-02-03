import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/app_manager/app_colors.dart';
import '../utils/app_manager/app_styles.dart';

class NetworkConnectionController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(
      (event) {
        _updateConnectionStatus(event.first);
      },
    );
  }

  void _updateConnectionStatus(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      Get.rawSnackbar(
        snackPosition: SnackPosition.TOP,
        padding: EdgeInsets.all(10),
        backgroundColor: AppColor.pinkColor,
        isDismissible: false,
        messageText: Text(
          "تعذر الاتصال بالانترنت",
          style: Styles.regular16.copyWith(color: AppColor.whiteColor),),
        icon: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(
            Icons.wifi_off,
            color: AppColor.whiteColor,
          ),
        ),
        duration: const Duration(days: 1),
        animationDuration: const Duration(milliseconds: 300),
        reverseAnimationCurve: Curves.easeOutBack,
        snackStyle: SnackStyle.FLOATING,
      );
    } else {
      Get.rawSnackbar(
        snackPosition: SnackPosition.TOP,
        padding: EdgeInsets.all(10),
        backgroundColor: AppColor.greenColor,
        isDismissible: false,
        messageText: Text(
          "تم الاتصال بالانترنت",
          style: Styles.regular16.copyWith(color: AppColor.whiteColor),),
        icon: Icon(
          Icons.wifi,
          color: AppColor.whiteColor,
        ),
        duration: const Duration(seconds: 2),
        animationDuration: const Duration(milliseconds: 300),
        reverseAnimationCurve: Curves.easeOutBack,
        snackStyle: SnackStyle.FLOATING,
      );
      if (Get.isSnackbarOpen == true) {
        Get.closeAllSnackbars();
      }
    }
  }
}
