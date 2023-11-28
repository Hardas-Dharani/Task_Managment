import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/components/custom_appbar_component.dart';
import 'package:task_management/components/custom_text_component.dart';
import 'package:task_management/routes/app_routes.dart';
import 'package:task_management/utils/styles.dart';

import '../../../app/services/local_storage.dart';
import '../../../components/main_scaffold_component.dart';
import 'controller/teacher_home_controller.dart';
import 'widget/custom_task.dart';
import 'widget/drawer_bar.dart';

class TeacherHomeScreen extends GetView<TeacherHomeController> {
  const TeacherHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: MainScaffold(
        keyGlobal: controller.globalKey,
        drawarBar: const CustomDrawerTeacher(),
        appBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomAppBar(
            title: "Projects",
            trailing: IconButton(
                onPressed: () {
                  Get.toNamed(Routes.chats);
                },
                icon: Image.asset(
                  "assets/images/icons/menu_icon.png",
                  width: 20,
                  height: 20,
                )),
            leadingWidget: GestureDetector(
              onTap: () {
                controller.globalKey.currentState!.openDrawer();
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(Get.find<LocalStorageService>()
                          .loginModel!
                          .user!
                          .imageUrl ??
                      "https://upload.wikimedia.org/wikipedia/commons/b/bc/Unknown_person.jpg"),
                ),
              ),
            ),
          ),
        ),
        body: GetBuilder<TeacherHomeController>(
          init: TeacherHomeController(),
          builder: (_) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: Get.height,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 40,
                      child: TabBar(
                        onTap: (value) {
                          controller.selectedIndex = value;
                          controller.update();
                        },
                        physics: const NeverScrollableScrollPhysics(),
                        labelColor: Styles.primaryColor,
                        controller: controller.tabController,
                        // Add TabBar for tab navigation
                        tabs: [
                          CustomTextWidget(
                            text: 'Best Matches',
                            fontWeight: controller.selectedIndex == 0
                                ? FontWeight.w700
                                : FontWeight.w400,
                            fontSize: 16,
                            color: controller.selectedIndex == 0
                                ? Styles.primaryColor
                                : Styles.black,
                          ),
                          CustomTextWidget(
                            text: 'Most Recent',
                            fontWeight: controller.selectedIndex == 1
                                ? FontWeight.w700
                                : FontWeight.w400,
                            fontSize: 16,
                            color: controller.selectedIndex == 1
                                ? Styles.primaryColor
                                : Styles.black,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: controller.tabController,
                        // Add TabBarView for the tab content
                        children: [
                          // Content for Tab 1
                          controller.taskModel.data == null
                              ? const SizedBox()
                              : ListView.separated(
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Get.toNamed(Routes.taskDetail,
                                            arguments: {
                                              "taskDetail": controller
                                                  .taskModel.data![index]
                                            });
                                      },
                                      child: CustomTaskWidget(
                                        taskModel:
                                            controller.taskModel.data![index],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    height: 20,
                                  ),
                                  itemCount: controller.taskModel.data!.length,
                                ),

                          // Content for Tab 2
                          controller.taskModel.data == null
                              ? const SizedBox()
                              : ListView.separated(
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Get.toNamed(Routes.taskDetail,
                                            arguments: {
                                              "taskDetail": controller
                                                  .taskModel.data![index]
                                            });
                                      },
                                      child: CustomTaskWidget(
                                        taskModel:
                                            controller.taskModel.data![index],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    height: 20,
                                  ),
                                  itemCount: controller.taskModel.data!.length,
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
