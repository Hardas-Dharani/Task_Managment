// ignore_for_file: unused_field

import 'package:get/get.dart';

class SettingsController extends GetxController {
  bool enableNotification = false;

  toggleNotification() {
    enableNotification = !enableNotification;
    update();
  }
}
