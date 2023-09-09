import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../styles/colors.dart';

enum ToastState { success, error, warning }

class Util {
  static Future<bool?> getDialog({
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    required String middleText,
    Color? backgroundColor = Colors.amber,
  }) =>
      Get.defaultDialog(
          barrierDismissible: false,
          backgroundColor: backgroundColor,
          buttonColor: SharedColor.primary,
          title: 'confirm'.tr,
          middleText: middleText,
          textCancel: 'cancel'.tr,
          cancelTextColor: Colors.red,
          onCancel: onCancel,
          textConfirm: 'accept'.tr,
          confirmTextColor: Colors.white,
          onConfirm: onConfirm,
          middleTextStyle: const TextStyle(
            color: Colors.red,
          ));

  static Color chooseToastColor(ToastState toastState) {
    Color color;

    switch (toastState) {
      case ToastState.success:
        color = Colors.green;
        break;
      case ToastState.error:
        color = Colors.red;
        break;
      case ToastState.warning:
        color = Colors.amber;
        break;
    }
    return color;
  }

  static void getToastSnack({
    required BuildContext context,
    required String message,
    required ToastState toastState,
  }) {
    final snackBar = SnackBar(
      backgroundColor: chooseToastColor(toastState),
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
