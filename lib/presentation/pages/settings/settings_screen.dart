import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

import '../../../components/custom_appbar_component.dart';
import '../../../components/custom_button_component.dart';
import '../../../components/custom_text_component.dart';
import '../../../components/main_scaffold_component.dart';
import '../../../components/svg_icons_components.dart';
import '../../../global.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/styles.dart';
import 'controller/settings_controller.dart';

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    lightStatusBar();
    return WillPopScope(
      onWillPop: () async {
        isStatusBarDark = true;
        onBackScreen();
        Get.back();
        return true;
      },
      child: MainScaffold(
        appBar: CustomAppBar(
          title: 'Settings',
          leading: true,
          bgColor: Styles.white,
          backButtonColor: Styles.black,
          centerTitle: false,
          onLeadingPress: () {
            isStatusBarDark = true;
            onBackScreen();
            Get.back();
          },
        ),
        body: GetBuilder<SettingsController>(builder: (context) {
          return Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              tileWidget(
                  title: 'Notification', onTap: () {}, isNotification: true),
              const SizedBox(
                height: 40,
              ),
              tileWidget(
                  title: 'Change Password',
                  onTap: () {
                    Get.toNamed(Routes.changePass);
                  }),
              const SizedBox(
                height: 40,
              ),
              tileWidget(
                  title: 'Privacy Policy',
                  onTap: () {
                    Get.toNamed(Routes.privacyPolicy);
                  }),
              const SizedBox(
                height: 40,
              ),
              tileWidget(
                  title: 'Terms of policy',
                  onTap: () {
                    Get.toNamed(Routes.terms);
                  }),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Styles.screenPadding),
                child: CustomButton(
                  onTap: () {
                    Get.bottomSheet(
                      Container(
                        // height: 180,
                        padding: const EdgeInsets.symmetric(
                            horizontal: Styles.screenPadding),
                        decoration: const BoxDecoration(
                          color: Styles.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 25),
                            const CustomTextWidget(
                              text:
                                  'Are you sure you want to delete this account?',
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              lineHeight: 1.56,
                            ),
                            const SizedBox(height: 22),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomButton(
                                    title: "Cancel",
                                    onTap: () {
                                      Get.back();
                                    },
                                    fontColor: Styles.solidGrey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                    bgColor: Styles.white,
                                    radius: 9,
                                    borderColor: Styles.greyLight,
                                    height: 48,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: CustomButton(
                                    title: "Delete",
                                    onTap: () {
                                      Get.offAllNamed(Routes.signin);
                                    },
                                    fontColor: Styles.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                    bgColor: Styles.red,
                                    radius: 9,
                                    height: 48,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 28),
                          ],
                        ),
                      ),
                      isScrollControlled: true,
                    );
                  },
                  title: 'Delete Account',
                  radius: 8,
                  bgColor: Styles.mainScaffoldColor,
                  height: 49,
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                  fontColor: Styles.greyLight,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          );
        }),
      ),
    );
  }

  tileWidget(
      {required String title,
      required Function() onTap,
      bool isNotification = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: Styles.screenPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextWidget(
                text: title,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Styles.black),
            const Spacer(),
            isNotification
                ? FlutterSwitch(
                    activeColor: Styles.solidOrange,
                    width: 40,
                    height: 25,
                    padding: 0.5,
                    valueFontSize: 12.0,
                    toggleSize: 23.0,
                    value: controller.enableNotification,
                    onToggle: (val) {
                      controller.toggleNotification();
                    },
                  )
                : const SvgIconComponent(
                    icon: 'forward_arrow_highlight.svg',
                    width: 14,
                    height: 14,
                  ),
          ],
        ),
      ),
    );
  }
}
