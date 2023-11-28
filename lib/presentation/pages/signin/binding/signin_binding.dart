import 'package:get/get.dart';
import '../controller/signin_controller.dart';

class SiginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SigninController());
  }
}
