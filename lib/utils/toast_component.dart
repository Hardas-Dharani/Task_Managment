import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'styles.dart';

class ToastComponent {
  late FToast fToast;

  showSuccessToast(String text, {bool makeToastPositionTop = false}) {
    Get.rawSnackbar(
      message: text,
      duration: const Duration(seconds: 2),
      backgroundColor: const Color(0xFFAAAFBB).withOpacity(0.4),
      borderRadius: 8.0,
      margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      snackPosition: SnackPosition.TOP,
      // colorText: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      shouldIconPulse: false,
      animationDuration: const Duration(milliseconds: 200),
      forwardAnimationCurve: Curves.easeOut,
      reverseAnimationCurve: Curves.easeIn,
    );
  }

  showToast(text,
      {bool makeToastPositionTop = false,
      Color? color,
      ToastGravity? gravity = ToastGravity.CENTER}) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: gravity,
        timeInSecForIosWeb: 1,
        backgroundColor: Styles.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
