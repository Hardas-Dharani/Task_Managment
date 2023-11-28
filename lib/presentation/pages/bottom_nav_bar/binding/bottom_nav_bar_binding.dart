import 'package:get/get.dart';

import '../../home/controller/home_controller.dart';
import '../controller/bottom_nav_bar_controller.dart';

class BottomNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavBarController());
    Get.lazyPut(() => HomeController());
  }
}
