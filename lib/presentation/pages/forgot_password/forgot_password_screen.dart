import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/custom_button_component.dart';
import '../../../components/custom_text_component.dart';
import '../../../components/custom_textfield_component.dart';
import '../../../components/main_scaffold_component.dart';
import '../../../components/svg_icons_components.dart';
import '../../../global.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/styles.dart';
import '../../../utils/validator.dart';
import 'controller/forgot_password_controller.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    darkStatusBar();
    return WillPopScope(
      onWillPop: () async {
        onBackScreen();
        Get.back();
        return true;
      },
      child: MainScaffold(
        body: GetBuilder<ForgotPasswordController>(
          init: ForgotPasswordController(),
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
                        decoration: BoxDecoration(gradient: Styles.linearMetal),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  onBackScreen();
                                  Get.back();
                                },
                                child: const SvgIconComponent(
                                    icon: "appbar_back_2x.svg",
                                    height: 20,
                                    width: 21.25)),
                            const CustomTextWidget(
                              text: "Forgot\nPassword?",
                              fontSize: 32,
                              color: Styles.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Styles.screenPadding),
                        child: Form(
                          key: controller.forgotPasswordFormKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 38),
                              CustomTextField(
                                textFieldColor: controller.focusEmail.hasFocus
                                    ? Styles.black
                                    : Styles.black,
                                maxLines: 1,
                                fillColor: controller.focusEmail.hasFocus
                                    ? Styles.white
                                    : Styles.greyLight.withOpacity(0.10),
                                focusColor: controller.focusEmail.hasFocus
                                    ? Styles.orangeBorder
                                    : Styles.white,
                                hint: "Email",
                                hintColor: Styles.solidGrey,
                                textInputType: TextInputType.emailAddress,
                                txtController:
                                    controller.emailTextEditingController,
                                validatorFtn: Validators.emailValidator,
                                textInputAction: TextInputAction.next,
                                node: controller.focusEmail,
                                onTap: () {},
                                prefixIcon: SvgIconComponent(
                                    icon: controller.focusEmail.hasFocus
                                        ? "email_dark_2x.svg"
                                        : "grey_email_2x.svg"),
                                borderRadius: 9,
                              ),
                              const SizedBox(height: 33),
                              CustomButton(
                                gradient: Styles.linearOrange,
                                title: "Submit",
                                fontColor: Colors.white,
                                width: Get.width,
                                height: 49,
                                radius: 8,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                onTap: () {
                                  if (controller
                                      .forgotPasswordFormKey.currentState!
                                      .validate()) {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    // Get.offAndToNamed(Routes.verification);
                                    Get.toNamed(Routes.verification);
                                  }
                                },
                              ),
                              const SizedBox(height: 19),
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
      ),
    );
  }
}
