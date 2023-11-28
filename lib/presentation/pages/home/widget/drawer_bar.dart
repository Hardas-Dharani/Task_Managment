import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/app/services/local_storage.dart';
import 'package:task_management/components/custom_text_component.dart';
import 'package:task_management/routes/app_routes.dart';
import 'package:task_management/utils/styles.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
      child: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: CustomTextWidget(
                  text:
                      Get.find<LocalStorageService>().loginModel!.user!.name ??
                          ""),
              accountEmail: CustomTextWidget(
                  text:
                      Get.find<LocalStorageService>().loginModel!.user!.email ??
                          ""),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(Get.find<LocalStorageService>()
                        .loginModel!
                        .user!
                        .imageUrl ??
                    "https://upload.wikimedia.org/wikipedia/commons/b/bc/Unknown_person.jpg"),
                // Replace with your image
                radius: 30.0,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.person_2,
                color: Styles.primaryColor,
              ),
              title: const CustomTextWidget(
                text: "Profile",
                color: Styles.black,
              ),
              onTap: () {
                Get.back();
                Get.toNamed(Routes.createProfile);
                // Handle item 1 tap
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.message_rounded,
                color: Styles.primaryColor,
              ),
              title: const CustomTextWidget(text: "Message"),
              onTap: () {
                Get.back();
                Get.toNamed(Routes.chats);
                // Handle item 1 tap
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Styles.primaryColor,
              ),
              title: const CustomTextWidget(text: "Settings"),
              onTap: () {
                // Handle item 1 tap
              },
            ),
            // Add more ListTile items as needed
          ],
        ),
      ),
    );
  }
}
