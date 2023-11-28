import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationController extends GetxController {
  TextEditingController otpFieldController = TextEditingController();
  final otpFormKey = GlobalKey<FormState>();

  FocusNode focusOtp = FocusNode();

  @override
  void onClose() {
    focusOtp.removeListener(() {});
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onInit() {
    focusOtp.addListener(() {
      update();
    });
    //
    //TODO: implement onInit
    super.onInit();
  }
}
