import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController searchTextEditingController = TextEditingController();
  final forgotPasswordFormKey = GlobalKey<FormState>();
  String title = "";
  bool isFromQuote = false;
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
  String selectedList = "All Project";
  @override
  void onInit() {
    if (Get.arguments != null) {
      print("errrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
      title = Get.arguments["title"];
    }
    super.onInit();
  }
}
