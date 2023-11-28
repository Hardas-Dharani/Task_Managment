import 'package:get/get.dart';

import '../controller/teacher_home_controller.dart';

class TeacherHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TeacherHomeController());
  }
}
