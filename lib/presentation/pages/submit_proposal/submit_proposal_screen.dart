import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/components/custom_appbar_component.dart';
import 'package:task_management/components/custom_button_component.dart';
import 'package:task_management/components/custom_text_component.dart';
import 'package:task_management/routes/app_routes.dart';
import 'package:task_management/utils/styles.dart';

import '../../../components/main_scaffold_component.dart';
import '../home/widget/drawer_bar.dart';
import 'controller/submit_proposal_controller.dart';

class SubmitProposalScreen extends GetView<SubmitProposalController> {
  const SubmitProposalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      keyGlobal: controller.globalKey,
      drawarBar: const CustomDrawer(),
      appBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CustomAppBar(
          title: "Submit Proposal",
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
      body: GetBuilder<SubmitProposalController>(
        init: SubmitProposalController(),
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: SizedBox(
              height: Get.height,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTextWidget(
                      text: "Project Detail",
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: Styles.primaryColor.withOpacity(0.6))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            text: controller.taskListModelData.title ?? "",
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomTextWidget(
                            text:
                                "Posted ${controller.taskListModelData.createdAt}",
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
                                    text: controller.taskListModelData.budget ??
                                        "",
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
                            text:
                                controller.taskListModelData.description ?? "",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              child: const Row(
                                children: [
                                  CustomTextWidget(
                                    text: "View Project",
                                    fontSize: 12,
                                    color: Styles.primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  Icon(
                                    Icons.arrow_right_alt,
                                    color: Styles.primaryColor,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Styles.grey.withOpacity(0.7),
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      width: Get.width,
                      child: DropdownButton<String>(
                        hint: const SizedBox(
                            // width: Get.width,
                            child: Text("How long will this project take?")),
                        underline: Container(),
                        value: controller.selectedDuration,
                        onChanged: (String? newValue) {
                          controller.selectedDuration = newValue!;
                          controller.update();
                        },
                        items: controller.durations.map((String duration) {
                          return DropdownMenuItem<String>(
                            value: duration,
                            child: SizedBox(
                                width: Get.width / 1.5, child: Text(duration)),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      maxLines: 1,
                      controller: controller.feeChargeTextEditingController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            width: 0.5,
                            color: Styles.primaryColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            width: 0.5,
                            color: Styles.primaryColor,
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            width: 0.5,
                            color: Styles.primaryColor,
                          ),
                        ),

                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 10), // Increase height here
                        hintText: 'Enter your fee charges',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      maxLines: 7,
                      controller: controller.coverTextEditingController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            width: 0.5,
                            color: Styles.primaryColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            width: 0.5,
                            color: Styles.primaryColor,
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            width: 0.5,
                            color: Styles.primaryColor,
                          ),
                        ),

                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 10), // Increase height here
                        hintText: 'Proposal cover',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.pickFile();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 17, vertical: 9),
                        width: 125,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: Styles.primaryColor, width: 2)),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.attach_file,
                              color: Styles.black,
                              size: 15,
                            ),
                            CustomTextWidget(
                              text: "Attach Files",
                              color: Styles.primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomTextWidget(
                        text:
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: CustomButton(
                            onTap: () {
                              controller.applyTask();
                            },
                            width: Get.width,
                            title: "Send",
                            fontColor: Styles.white,
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const CustomTextWidget(
                              text: "Cancel",
                              color: Styles.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
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
