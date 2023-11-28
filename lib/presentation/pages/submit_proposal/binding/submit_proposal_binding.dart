import 'package:get/get.dart';

import '../controller/submit_proposal_controller.dart';

class SubmitProposalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SubmitProposalController());
  }
}
