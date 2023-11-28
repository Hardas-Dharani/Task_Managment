import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  final forgotPasswordFormKey = GlobalKey<FormState>();

  FocusNode focusEmail = FocusNode();

  @override
  void onClose() {
    focusEmail.removeListener(() {});
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onInit() {
    focusEmail.addListener(() {
      update();
    });
    //
    //TODO: implement onInit
    super.onInit();
  }
}
