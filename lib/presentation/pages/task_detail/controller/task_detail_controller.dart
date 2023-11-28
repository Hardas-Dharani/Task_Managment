import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/data/models/task_list_model.dart';

class TaskDetailController extends GetxController {
  TextEditingController searchTextEditingController = TextEditingController();
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
  TaskListModelData taskListModelData = TaskListModelData();
  String selectedList = "All Project";
  @override
  void onInit() {
    if (Get.arguments != null) {
      taskListModelData = Get.arguments["taskDetail"];
    }
    super.onInit();
  }
}
