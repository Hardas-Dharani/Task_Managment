import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTxtController extends GetxController {
  bool focused = false;
  bool empty = true;
  bool obscure = false;
  String value = "";
  void onTextEdit(TextEditingController? controller) {
    value = controller?.text ?? "";
    value == "" ? setEmpty() : setFilled();
  }

  setEmpty() {
    empty = true;
    update();
  }

  setFilled() {
    empty = false;
    update();
  }

  setFocused(focus) {
    focused = focus;
    update();
  }

  setObscure(obs) {
    obscure = obs;
    update();
  }
}
