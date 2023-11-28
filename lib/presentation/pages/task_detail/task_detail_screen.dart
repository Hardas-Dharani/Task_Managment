import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/components/custom_appbar_component.dart';
import 'package:task_management/components/custom_button_component.dart';
import 'package:task_management/components/custom_text_component.dart';
import 'package:task_management/routes/app_routes.dart';
import 'package:task_management/utils/styles.dart';

import '../../../components/main_scaffold_component.dart';
import '../home/widget/drawer_bar.dart';
import 'controller/task_detail_controller.dart';

class TaskDetailScreen extends GetView<TaskDetailController> {
  const TaskDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      keyGlobal: controller.globalKey,
      drawarBar: const CustomDrawer(),
      appBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CustomAppBar(
          title: "Project Details",
          trailing: IconButton(
              onPressed: () {
                Get.toNamed(Routes.chats);
              },
              icon: Image.asset(
                "assets/images/icons/menu_icon.png",
                width: 20,
                height: 20,
              )),
          leading: true,
        ),
      ),
      body: GetBuilder<TaskDetailController>(
        init: TaskDetailController(),
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: SizedBox(
              height: Get.height,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextWidget(
                      text: controller.taskListModelData.title ?? "",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextWidget(
                      text: "Posted ${controller.taskListModelData.createdAt}",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextWidget(
                              text: controller.taskListModelData.budget ?? "",
                              fontSize: 16,
                              color: Styles.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            const CustomTextWidget(
                              text: "Fixed Price",
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextWidget(
                              text: "Entry Level",
                              fontSize: 16,
                              color: Styles.black,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            CustomTextWidget(
                              text: "Experience Level",
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextWidget(
                      text: controller.taskListModelData.description ?? "",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // const Divider(),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // const CustomTextWidget(
                    //   text: "Skills & Expertise",
                    //   fontSize: 16,
                    //   fontWeight: FontWeight.bold,
                    // ),
                    // Wrap(
                    //   spacing: 10,
                    //   children: controller.sortList.map((skill) {
                    //     return Chip(
                    //       backgroundColor: Styles.primaryColor.withOpacity(0.2),
                    //       label: CustomTextWidget(
                    //         text: skill,
                    //         color: Styles.black,
                    //         fontWeight: FontWeight.w400,
                    //       ),
                    //     );
                    //   }).toList(),
                    // ),

                    const Divider(),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomTextWidget(
                      text: "About the client",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/icons/verify_icon.png",
                          width: 15,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const CustomTextWidget(
                          text: "Payment Varified",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomButton(
                      onTap: () {
                        Get.toNamed(Routes.submitProposal, arguments: {
                          "taskDetail": controller.taskListModelData
                        });
                      },
                      width: Get.width,
                      title: "Apply Now",
                      fontColor: Styles.white,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
