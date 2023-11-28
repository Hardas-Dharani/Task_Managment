import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/app/services/local_storage.dart';
import 'package:task_management/components/richtext_component.dart';

import '../../../components/custom_appbar_component.dart';
import '../../../components/custom_text_component.dart';
import '../../../components/main_scaffold_component.dart';
import '../../../utils/styles.dart';
import 'controller/teacher_profile_controller.dart';

class TeacherProfileScreen extends GetView<TeacherProfileController> {
  const TeacherProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      appBar: CustomAppBar(
        bgColor: Colors.transparent,
        centerTitle: true,
        backButtonColor: Styles.black,
        title: "Profile",
        leading: true,
        onLeadingPress: () {
          Get.back();
        },
      ),
      body: GetBuilder<TeacherProfileController>(
        init: TeacherProfileController(),
        initState: (v) {
          // WidgetsBinding.instance.addPostFrameCallback((_) {});
        },
        builder: (_) {
          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Container(
              color: Colors.transparent,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 38),
                      Row(
                        children: [
                          badges.Badge(
                            onTap: () {
                              showDialog<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Select an Image'),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.photo,
                                              size: 20,
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                controller.galleryPick();
                                              },
                                              child: const Text(
                                                'Gallery',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.camera_alt,
                                              size: 20,
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                controller.camPick();
                                              },
                                              child: const Text(
                                                'Camera',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    // actions: [
                                    //
                                    // ],
                                  );
                                },
                              );
                            },
                            position: badges.BadgePosition.topStart(
                                start: -8, top: 0),
                            badgeContent: const Icon(
                              Icons.edit,
                              color: Styles.primaryColor,
                              size: 10,
                            ),
                            badgeStyle: badges.BadgeStyle(
                              shape: badges.BadgeShape.square,
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  color: Styles.primaryColor, width: 0.5),
                              badgeColor: Colors.transparent,
                              padding: const EdgeInsets.all(8),
                            ),
                            child: Container(
                              width: 85,
                              height: 85,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(Get.find<
                                                  LocalStorageService>()
                                              .loginModel!
                                              .user!
                                              .imageUrl ??
                                          "https://upload.wikimedia.org/wikipedia/commons/b/bc/Unknown_person.jpg"))),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextWidget(
                                text: Get.find<LocalStorageService>()
                                        .loginModel!
                                        .user!
                                        .name ??
                                    "",
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                              ),
                              CustomTextWidget(
                                text: Get.find<LocalStorageService>()
                                        .loginModel!
                                        .user!
                                        .email ??
                                    "",
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Get.find<LocalStorageService>()
                                            .loginModel!
                                            .user!
                                            .role ==
                                        null
                                    ? const SizedBox()
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomTextWidget(
                                            text:
                                                Get.find<LocalStorageService>()
                                                        .loginModel!
                                                        .user!
                                                        .role!
                                                        .title ??
                                                    "",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const CustomTextWidget(
                                            text: "Specializes in",
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ],
                                      ),
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: Styles.primaryColor)),
                                  child: const Icon(
                                    Icons.edit,
                                    size: 16,
                                    color: Styles.primaryColor,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CustomTextWidget(
                                  text: "\$10.00/hr",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: Styles.primaryColor)),
                                  child: const Icon(
                                    Icons.edit,
                                    size: 16,
                                    color: Styles.primaryColor,
                                  ),
                                )
                              ],
                            ),
                            Get.find<LocalStorageService>()
                                        .loginModel!
                                        .user!
                                        .aboutMe ==
                                    null
                                ? const SizedBox()
                                : const SizedBox(
                                    height: 20,
                                  ),
                            Get.find<LocalStorageService>()
                                        .loginModel!
                                        .user!
                                        .aboutMe ==
                                    null
                                ? const SizedBox()
                                : Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: CustomTextWidget(
                                          text: Get.find<LocalStorageService>()
                                                  .loginModel!
                                                  .user!
                                                  .aboutMe ??
                                              "",
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Styles.primaryColor)),
                                        child: const Icon(
                                          Icons.edit,
                                          size: 16,
                                          color: Styles.primaryColor,
                                        ),
                                      )
                                    ],
                                  ),
                            // const SizedBox(
                            //   height: 20,
                            // ),
                            // Row(
                            //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     const CustomTextWidget(
                            //       text: "Skills",
                            //       fontSize: 16,
                            //       fontWeight: FontWeight.w600,
                            //     ),
                            //     const SizedBox(
                            //       width: 20,
                            //     ),
                            //     Container(
                            //       padding: const EdgeInsets.all(3),
                            //       decoration: BoxDecoration(
                            //           borderRadius: BorderRadius.circular(5),
                            //           border: Border.all(
                            //               color: Styles.primaryColor)),
                            //       child: const Icon(
                            //         Icons.edit,
                            //         size: 16,
                            //         color: Styles.primaryColor,
                            //       ),
                            //     )
                            //   ],
                            // ),

                            // const SizedBox(
                            //   height: 20,
                            // ),
                            // Wrap(
                            //   spacing: 10,
                            //   runSpacing: 10,
                            //   children: [
                            //     for (var label in controller.labels)
                            //       Container(
                            //         padding: const EdgeInsets.symmetric(
                            //             horizontal: 8, vertical: 4),
                            //         decoration: BoxDecoration(
                            //           borderRadius: BorderRadius.circular(20),
                            //           color: const Color(0xffCCDDFF),
                            //         ),
                            //         child: CustomTextWidget(
                            //           text: label,
                            //           color: Styles.black,
                            //         ),
                            //       ),
                            //   ],
                            // ),

                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CustomTextWidget(
                                  text: "Language",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: Styles.primaryColor)),
                                  child: const Icon(
                                    Icons.add,
                                    size: 16,
                                    color: Styles.primaryColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: Styles.primaryColor)),
                                  child: const Icon(
                                    Icons.edit,
                                    size: 16,
                                    color: Styles.primaryColor,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            RichTextWidget(
                              text: "English: ",
                              onTapText: "Fluent",
                              onTapColor: Styles.black.withOpacity(.4),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            RichTextWidget(
                              text: "German: ",
                              onTapText: "Fluent",
                              onTapColor: Styles.black.withOpacity(.4),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CustomTextWidget(
                                  text: "Education",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: Styles.primaryColor)),
                                  child: const Icon(
                                    Icons.add,
                                    size: 16,
                                    color: Styles.primaryColor,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CustomTextWidget(
                                  text: "Institute of Higher Education",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: Styles.primaryColor)),
                                  child: const Icon(
                                    Icons.edit,
                                    size: 14,
                                    color: Styles.primaryColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: Styles.primaryColor)),
                                  child: const Icon(
                                    Icons.delete,
                                    size: 14,
                                    color: Styles.primaryColor,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            const CustomTextWidget(text: "Content Marketing"),
                            const SizedBox(
                              height: 3,
                            ),
                            const CustomTextWidget(text: "2016 - 2020"),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CustomTextWidget(
                                  text: "Employment History",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: Styles.primaryColor)),
                                  child: const Icon(
                                    Icons.add,
                                    size: 16,
                                    color: Styles.primaryColor,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CustomTextWidget(
                                  text: "Senior Content Writer",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: Styles.primaryColor)),
                                  child: const Icon(
                                    Icons.edit,
                                    size: 14,
                                    color: Styles.primaryColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: Styles.primaryColor)),
                                  child: const Icon(
                                    Icons.delete,
                                    size: 14,
                                    color: Styles.primaryColor,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            const CustomTextWidget(
                                text: "December 2021 - Present"),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
