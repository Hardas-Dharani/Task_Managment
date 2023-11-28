import 'dart:io';

import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  BottomNavigationItem _currentItem = BottomNavigationItem.home;

  bool isLoaded = false;
  final adUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/6300978111'
      : 'ca-app-pub-3940256099942544/2934735716';

  BottomNavigationItem get currentItem => _currentItem;

  void changeCurrentItem(BottomNavigationItem item) {
    _currentItem = item;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}

enum BottomNavigationItem {
  home,
  booking,
  saved,
  menu,
}
