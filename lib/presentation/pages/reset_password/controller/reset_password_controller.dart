// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController cPasswordTextEditingController = TextEditingController();
  final resetFormKey = GlobalKey<FormState>();

  FocusNode focusPassword = FocusNode();
  FocusNode focusCpassword = FocusNode();
  bool obsecurePass = true;
  final bool _passwordVisible = true;
  bool obsecureConfirmPass = true;
  bool _confirmPasswordVisible = true;
  bool getPasswordVisiblity() {
    return _passwordVisible;
  }

  final String _password = '';
  String get password => _password;

  setConfirmObsecure() {
    obsecureConfirmPass = !obsecureConfirmPass;
    update();
  }

  setConfirmPasswordVisiblity(bool visible) {
    _confirmPasswordVisible = visible;
    update();
  }

  @override
  void onClose() {
    focusPassword.removeListener(() {});
    focusCpassword.removeListener(() {});
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onInit() {
    focusPassword.addListener(() {
      update();
    });
    focusCpassword.addListener(() {
      update();
    });
    //
    //TODO: implement onInit
    super.onInit();
  }

  setObsecure() {
    obsecurePass = !obsecurePass;
    update();
  }
}
