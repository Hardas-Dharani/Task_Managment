// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  FocusNode focusPassword = FocusNode();
  bool obsPass = true;
  TextEditingController passwordTextEditingController=TextEditingController();
  setObs() {
    obsPass = !obsPass;
    update();
  }

  FocusNode focusNewPassword = FocusNode();
  bool obsNewPass = true;
  TextEditingController passwordNewTextEditingController=TextEditingController();
  setNewObs() {
    obsNewPass = !obsNewPass;
    update();
  }

  FocusNode focusConfirmPassword = FocusNode();
  bool obsConfirmPass = true;
  TextEditingController passwordConfirmTextEditingController=TextEditingController();
  setConfirmObs() {
    obsConfirmPass = !obsConfirmPass;
    update();
  }

  @override
  void onInit() {
    focusPassword.addListener(() {
      update();
    });
    focusNewPassword.addListener(() {
      update();
    });
    focusConfirmPassword.addListener(() {
      update();
    });
    // TODO: implement onInit
    super.onInit();
  }

}
