import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../components/custom_appbar_component.dart';
import '../../../components/custom_button_component.dart';
import '../../../components/custom_text_component.dart';
import '../../../components/custom_textfield_component.dart';
import '../../../components/main_scaffold_component.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/styles.dart';
import '../../../utils/validator.dart';
import 'controller/change_pass_controller.dart';

class ChangePasswordScreen extends GetView<ChangePasswordController> {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MainScaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: CustomButton(
            gradient: Styles.linearOrange,
            title: "Save Password",
            fontColor: Colors.white,
            width: Get.width,
            height: 49,
            radius: 8,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
              Get.back();
            },
          ),
        ),
        appBar: CustomAppBar(
          title: 'Change Password',
          leading: true,
          bgColor: Styles.white,
          backButtonColor: Styles.black,
          centerTitle: false,
        ),
        body: GetBuilder<ChangePasswordController>(
          builder: (context) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Styles.screenPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomTextWidget(
                      text: 'Current Password',
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      textFieldColor: controller.focusPassword.hasFocus
                          ? Styles.black
                          : Styles.black,
                      obscure: controller.obsPass,
                      onTapPass: () {
                        controller.setObs();
                      },
                      maxLines: 1,
                      fillColor: controller.focusPassword.hasFocus
                          ? Styles.white
                          : Styles.greyLight.withOpacity(0.10),
                      focusColor: controller.focusPassword.hasFocus
                          ? Styles.orangeBorder
                          : Styles.white,
                      hint: "Password",
                      hintColor: Styles.solidGrey,
                      textInputType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      node: controller.focusPassword,
                      txtController: controller.passwordTextEditingController,
                      inputFormat: [
                        LengthLimitingTextInputFormatter(20),
                      ],
                      validatorFtn: Validators.passwordValidator,
                      isPass: true,
                      borderRadius: 9,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const CustomTextWidget(
                      text: 'New Password',
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      textFieldColor: controller.focusNewPassword.hasFocus
                          ? Styles.black
                          : Styles.black,
                      obscure: controller.obsNewPass,
                      onTapPass: () {
                        controller.setNewObs();
                      },
                      maxLines: 1,
                      fillColor: controller.focusNewPassword.hasFocus
                          ? Styles.white
                          : Styles.greyLight.withOpacity(0.10),
                      focusColor: controller.focusNewPassword.hasFocus
                          ? Styles.orangeBorder
                          : Styles.white,
                      hint: "New Password",
                      hintColor: Styles.solidGrey,
                      textInputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      node: controller.focusNewPassword,
                      txtController:
                          controller.passwordNewTextEditingController,
                      validatorFtn: Validators.passwordValidator,
                      inputFormat: [LengthLimitingTextInputFormatter(20)],
                      isPass: true,
                      borderRadius: 9,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const CustomTextWidget(
                      text: 'Confirm Password',
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      textFieldColor: controller.focusConfirmPassword.hasFocus
                          ? Styles.black
                          : Styles.black,
                      obscure: controller.obsConfirmPass,
                      onTapPass: () {
                        controller.setConfirmObs();
                      },
                      maxLines: 1,
                      fillColor: controller.focusConfirmPassword.hasFocus
                          ? Styles.white
                          : Styles.greyLight.withOpacity(0.10),
                      focusColor: controller.focusConfirmPassword.hasFocus
                          ? Styles.orangeBorder
                          : Styles.white,
                      hint: "Confirm Password",
                      hintColor: Styles.solidGrey,
                      textInputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      node: controller.focusConfirmPassword,
                      txtController:
                          controller.passwordConfirmTextEditingController,
                      validatorFtn: Validators.passwordValidator,
                      inputFormat: [
                        LengthLimitingTextInputFormatter(20),
                      ],
                      isPass: true,
                      borderRadius: 9,
                    ),
                    const SizedBox(height: 27),
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.forgotPassword);
                        },
                        child: const CustomTextWidget(
                          text: "Forgot Password?",
                          color: Styles.metal,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          lineHeight: 1.42,
                        ),
                      ),
                    )
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
