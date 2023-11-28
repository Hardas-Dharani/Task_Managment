import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/data/repositories/task_repository.dart';

import '../../../../data/models/task_list_model.dart';
import '../../../../utils/loader.dart';
import '../../../../utils/toast_component.dart';

class TaskModel {
  final String? title;
  final String? description;
  final double? budget;
  final String? category;
  final String? clientName;
  final String? status;
  final String? dueDate; // Added time attribute

  TaskModel({
    this.title,
    this.description,
    this.budget,
    this.category,
    this.clientName,
    this.status,
    this.dueDate, // Initialize the time attribute
  });
}

class TeacherHomeController extends GetxController
    with SingleGetTickerProviderMixin {
  TextEditingController searchTextEditingController = TextEditingController();
  final forgotPasswordFormKey = GlobalKey<FormState>();
  String title = "";
  bool isFromQuote = false;
  TabController? tabController;
  int? selectedIndex = 0;
  final globalKey = GlobalKey<ScaffoldState>();
  FocusNode focusSearch = FocusNode();
  var currentIndex = 0.obs;
  String selectedSort = '';
  List<String> sortList = [
    'All Project',
    'In Progress',
    'Complete',
    'Deleted',
  ];
  final List<TaskModel> taskModels = [
    TaskModel(
      title: 'Website Development',
      description:
          'Create a responsive website for a small business using modern web technologies.',
      budget: 1500.0,
      category: 'Web Development',
      clientName: 'John Doe',
      status: 'Open',
      dueDate: "Posted 1hr ago", // Sample due date
    ),
    TaskModel(
      title: 'Mobile App Design',
      description:
          'Design a user-friendly mobile app UI/UX for an e-commerce platform.',
      budget: 800.0,
      category: 'Mobile App Design',
      clientName: 'Jane Smith',
      status: 'In Progress',
      dueDate: "Posted 2hr ago", // Sample due date
    ),
    TaskModel(
      title: 'Content Writing',
      description: 'Write engaging and SEO-friendly content for a travel blog.',
      budget: 300.0,
      category: 'Content Writing',
      clientName: 'David Johnson',
      status: 'Completed',
      dueDate: "Posted 5hr ago", // Sample due date
    ),
  ];
  TaskListModel taskModel = TaskListModel();

  String selectedList = "All Project";

  Future<void> getTaskList() async {
    try {
      LoadingDialog.show();
      final result = await TaskRepositoryIml().getTaskList();

      if (result['data'] != null) {
        taskModel = TaskListModel.fromJson(result);

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
      print("errrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
      title = Get.arguments["title"];
    }
    getTaskList();
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }
}
