import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/task_list_model.dart';
import '../../../../data/repositories/task_repository.dart';
import '../../../../utils/loader.dart';
import '../../../../utils/toast_component.dart';

class SubmitProposalController extends GetxController {
  TextEditingController searchTextEditingController = TextEditingController();
  TextEditingController feeChargeTextEditingController =
      TextEditingController();
  TextEditingController coverTextEditingController = TextEditingController();
  final forgotPasswordFormKey = GlobalKey<FormState>();
  String title = "";
  bool isFromQuote = false;
  final globalKey = GlobalKey<ScaffoldState>();
  FocusNode focusSearch = FocusNode();
  var currentIndex = 0.obs;

  String selectedSort = '';
  List<String> sortList = [
    'Article',
    'Writing',
    'Content Book',
    'Ebook',
  ];
  String? selectedDuration; // Initial selection

  List<String> durations = [
    '1 week',
    '2 weeks',
    '1 month',
    '2 months',
    '3 months',
  ];
  String selectedList = "All Project";
  File? file;
  TaskListModelData taskListModelData = TaskListModelData();
  // applyProposal
  Future<void> applyTask() async {
    try {
      LoadingDialog.show();
      final result = await TaskRepositoryIml().applyProposal({
        "duration": selectedDuration,
        "amount": "\$${feeChargeTextEditingController.text}",
        "cover": coverTextEditingController.text,
        "proposal_images": file,
      }, "2");

      if (result['0'] == 200) {
        ToastComponent().showToast(result['message']);
        Get.back();
        // taskModel = TaskListModel.fromJson(result);

        LoadingDialog.hide();
      } else {
        ToastComponent().showToast(result['message']);
        LoadingDialog.hide();
      }
    } catch (e) {
      print(e.toString());
      ToastComponent().showToast("Sign in getting server error");
      LoadingDialog.hide();
    }
    update();
  }

  @override
  void onInit() {
    if (Get.arguments != null) {
      taskListModelData = Get.arguments["taskDetail"];
    }
    selectedDuration = null;
    super.onInit();
  }

  pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      file = File(result.files.single.path!);
    } else {
      // User canceled the picker
    }
  }
}
