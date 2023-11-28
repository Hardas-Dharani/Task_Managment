import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/custom_button_component.dart';
import '../../../components/custom_text_component.dart';
import '../../../components/custom_textfield_component.dart';
import '../../../components/main_scaffold_component.dart';
import '../../../components/svg_icons_components.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/styles.dart';
import 'controller/reset_password_controller.dart';

class ResetPasswordScreen extends GetView<ResetPasswordController> {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: GetBuilder<ResetPasswordController>(
        init: ResetPasswordController(),
        initState: (v) {
          // WidgetsBinding.instance.addPostFrameCallback((_) {});
        },
        builder: (_) {
          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Container(
              color: Colors.transparent,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: Get.width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: Styles.screenPadding, vertical: 20),
                      decoration: BoxDecoration(
                        gradient: Styles.linearMetal,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const SvgIconComponent(
                                  icon: "appbar_back_2x.svg",
                                  height: 20,
                                  width: 21.25)),
                          const SizedBox(height: 15),
                          const CustomTextWidget(
                            text: "Reset \nPassword",
                            fontSize: 32,
                            color: Styles.white,
                            fontWeight: FontWeight.w700,
                            lineHeight: 1.25,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Styles.screenPadding),
                      child: Form(
                        key: controller.resetFormKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 32),
                            CustomTextField(
                              textFieldColor: controller.focusPassword.hasFocus
                                  ? Styles.black
                                  : Styles.black,
                              obscure: controller.obsecurePass,
                              onTapPass: () {
                                controller.setObsecure();
                              },
                              maxLines: 1,
                              fillColor: controller.focusPassword.hasFocus
                                  ? Styles.white
                                  : Styles.greyLight.withOpacity(0.10),
                              focusColor: controller.focusPassword.hasFocus
                                  ? Styles.orangeBorder
                                  : Styles.white,
                              hint: "New Password",
                              hintColor: Styles.solidGrey,
                              textInputType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              node: controller.focusPassword,
                              txtController:
                                  controller.passwordTextEditingController,
                              prefixIcon: SvgIconComponent(
                                  icon: "grey_lock_2x.svg",
                                  color: controller.focusPassword.hasFocus
                                      ? Styles.metal
                                      : null),
                              validatorFtn: (value) {
                                if (value == "") {
                                  return "Password cannot be empty";
                                } else if (value.length < 6) {
                                  return "Password must be greater than 6 characters";
                                }
                                return null;
                              },
                              isPass: controller.getPasswordVisiblity(),
                              borderRadius: 9,
                            ),
                            const SizedBox(height: 20),
                            CustomTextField(
                              textFieldColor: controller.focusCpassword.hasFocus
                                  ? Styles.black
                                  : Styles.black,
                              obscure: controller.obsecureConfirmPass,
                              onTapPass: () {
                                controller.setConfirmObsecure();
                              },
                              maxLines: 1,
                              fillColor: controller.focusCpassword.hasFocus
                                  ? Styles.white
                                  : Styles.greyLight.withOpacity(0.10),
                              focusColor: controller.focusCpassword.hasFocus
                                  ? Styles.orangeBorder
                                  : Styles.white,
                              hint: "Confirm Password",
                              hintColor: Styles.solidGrey,
                              textInputType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              node: controller.focusCpassword,
                              txtController:
                                  controller.cPasswordTextEditingController,
                              prefixIcon: SvgIconComponent(
                                  icon: "grey_lock_2x.svg",
                                  color: controller.focusCpassword.hasFocus
                                      ? Styles.metal
                                      : null),
                              validatorFtn: (value) {
                                if (value == "") {
                                  return "Confirm Password cannot be empty";
                                } else if (value !=
                                    controller
                                        .passwordTextEditingController.text) {
                                  return "Password mismatched";
                                }
                                return null;
                              },
                              isPass: controller.getPasswordVisiblity(),
                              borderRadius: 9,
                            ),
                            const SizedBox(height: 27),
                            CustomButton(
                              gradient: Styles.linearOrange,
                              title: "Reset Password",
                              fontColor: Colors.white,
                              width: Get.width,
                              height: 49,
                              radius: 8,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              onTap: () {
                                if (controller.resetFormKey.currentState!
                                    .validate()) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  Get.offAllNamed(Routes.signin);
                                }

                                // Get.toNamed(Routes.bottomBarpScreen);
                              },
                            ),
                            const SizedBox(height: 29.25),
                            const CustomTextWidget(
                              text: "Set a new and strong password",
                              fontSize: 16,
                              color: Styles.greyLight2,
                              fontWeight: FontWeight.w500,
                            )
                          ],
                        ),
                      ),
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
