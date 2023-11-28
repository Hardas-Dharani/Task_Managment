import 'package:get/get.dart';
import '../controller/signup_controller.dart';

class SigupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupController());
  }
}
