import 'package:get/get.dart';
import '../controller/teacher_profile_controller.dart';

class TeacherProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TeacherProfileController());
  }
}
