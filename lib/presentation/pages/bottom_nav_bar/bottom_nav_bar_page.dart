import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:task_management/presentation/pages/chat/chat_screen.dart';
import 'package:task_management/presentation/pages/chat/controller/chat_controller.dart';

import '../../../utils/styles.dart';
import '../home/controller/home_controller.dart';
import '../home/home_screen.dart';
import 'controller/bottom_nav_bar_controller.dart';

class BottomNavBarScreen extends GetView<BottomNavBarController> {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.white,
      body: GetBuilder<BottomNavBarController>(
          //     initState: (v){
          // WidgetsBinding.instance.addPostFrameCallback((_) async {
          // });
          //     },
          builder: (value) {
        return WillPopScope(
            child: _buildScreen(value.currentItem),
            onWillPop: () async {
              if (BottomNavigationItem.values.indexOf(controller.currentItem) ==
                  0) {
                SystemNavigator.pop();
              } else {
                controller.changeCurrentItem(BottomNavigationItem.values[0]);
              }
              return false;
            });
      }),
      bottomNavigationBar: GetBuilder<BottomNavBarController>(
        builder: (value) {
          return Theme(
            data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent),
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Styles.shadowColor.withOpacity(0.3),
                    blurRadius: 4,
                    spreadRadius: 0,
                    offset: const Offset(0, 2))
              ]),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Styles.white,
                enableFeedback: false,
                // elevation: 1,
                currentIndex:
                    BottomNavigationItem.values.indexOf(value.currentItem),
                onTap: (index) {
                  final item = BottomNavigationItem.values[index];
                  value.changeCurrentItem(item);
                },
                items: const [
                  BottomNavigationBarItem(
                    activeIcon: Icon(Icons.home),
                    label: '',
                    icon: Icon(Icons.home),
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Icon(Icons.task),
                    label: '',
                    icon: Icon(Icons.task),
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Icon(Icons.chat_bubble),
                    label: '',
                    icon: Icon(Icons.chat_bubble),
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Icon(Icons.person),
                    label: '',
                    icon: Icon(Icons.person),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildScreen(BottomNavigationItem item) {
    switch (item) {
      case BottomNavigationItem.home:
        Get.put(HomeController());
        return HomeScreen();
      case BottomNavigationItem.booking:
        return Container();
      case BottomNavigationItem.saved:
        Get.put(ChatController());
        return const ChatScreen();
      case BottomNavigationItem.menu:
        return Container();
      default:
        return Container();
    }
  }
}
