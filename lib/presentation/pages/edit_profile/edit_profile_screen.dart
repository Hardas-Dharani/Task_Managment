import 'dart:io';

import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../components/custom_appbar_component.dart';
import '../../../components/custom_button_component.dart';
import '../../../components/custom_text_component.dart';
import '../../../components/custom_textfield_component.dart';
import '../../../components/main_scaffold_component.dart';
import '../../../components/svg_icons_components.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/styles.dart';
import '../../../utils/validator.dart';
import 'controller/edit_profile_controller.dart';

class EditProfileScreen extends GetView<EditProfileController> {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      appBar: CustomAppBar(
        bgColor: Colors.transparent,
        centerTitle: false,
        backButtonColor: Styles.black,
        title: "Edit Profile",
        leading: true,
        onLeadingPress: () {
          Get.back();
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: Styles.screenPadding, vertical: 20),
        height: 90,
        decoration: BoxDecoration(
          color: Styles.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0x00898989).withOpacity(1),
              offset: const Offset(0, -8),
              blurRadius: 20,
              spreadRadius: -15,
            )
          ],
        ),
        child: Column(
          children: [
            CustomButton(
              gradient: Styles.linearOrange,
              title: "Save Changes",
              fontColor: Colors.white,
              width: Get.width,
              height: 49,
              radius: 8,
              fontSize: 14,
              fontWeight: FontWeight.w800,
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
                // if (!kDebugMode) {
                if (controller.editProfileFormKey.currentState!.validate()) {
                  Get.back();
                }
                // } else {
                //   Get.back();
                // }
              },
            ),

            // const SizedBox(height: 23),
          ],
        ),
      ),
      body: GetBuilder<EditProfileController>(
        init: EditProfileController(),
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
                    const SizedBox(height: 38),
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
                      position: badges.BadgePosition.bottomEnd(
                        end: -12,
                      ),
                      badgeContent: const Icon(
                        Icons.edit,
                        color: Styles.white,
                        size: 19,
                      ),
                      badgeStyle: const badges.BadgeStyle(
                        shape: badges.BadgeShape.circle,
                        borderSide: BorderSide(color: Styles.white, width: 1.5),
                        badgeColor: Styles.solidOrange,
                        padding: EdgeInsets.all(8),
                      ),
                      child: Container(
                        width: 85,
                        height: 85,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFF6FAFC),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 0.50, color: Color(0x3FA7B9BF)),
                            borderRadius: BorderRadius.circular(14.50),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x0F000000),
                              blurRadius: 22,
                              offset: Offset(8, 9),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(11),
                          child: controller.selectedFile == null
                              ? Image.asset(
                                  Styles.getCommonImage("user_img.png"),
                                  width: 85,
                                  height: 85,
                                  fit: BoxFit.cover)
                              : Image.file(File(controller.selectedFile!),
                                  width: 85, height: 85, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Styles.screenPadding),
                      child: Form(
                        key: controller.editProfileFormKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 25),
                            const CustomTextWidget(text: "Name"),
                            const SizedBox(height: 6),
                            CustomTextField(
                              textFieldColor: controller.focusName.hasFocus
                                  ? Styles.black
                                  : Styles.black,
                              maxLines: 1,
                              fillColor: controller.focusName.hasFocus
                                  ? Styles.white
                                  : Styles.greyLight.withOpacity(0.10),
                              focusColor: controller.focusName.hasFocus
                                  ? Styles.orangeBorder
                                  : Styles.white,
                              hint: "Name",
                              hintColor: Styles.solidGrey,
                              textInputType: TextInputType.name,
                              txtController:
                                  controller.nameTextEditingController,
                              validatorFtn: Validators.fullNameValidator,
                              textInputAction: TextInputAction.next,
                              node: controller.focusName,
                              onTap: () {},
                              borderRadius: 9,
                            ),
                            const SizedBox(height: 20),
                            const CustomTextWidget(text: "Email Address"),
                            const SizedBox(height: 6),
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
                              borderRadius: 9,
                            ),
                            const SizedBox(height: 20),
                            const CustomTextWidget(text: "Phone Number"),
                            const SizedBox(height: 6),
                            CustomTextField(
                              textFieldColor: controller.focusNumber.hasFocus
                                  ? Styles.black
                                  : Styles.black,
                              maxLines: 1,
                              fillColor: controller.focusNumber.hasFocus
                                  ? Styles.white
                                  : Styles.greyLight.withOpacity(0.10),
                              focusColor: controller.focusNumber.hasFocus
                                  ? Styles.orangeBorder
                                  : Styles.white,
                              hint: "Phone Number",
                              hintColor: Styles.solidGrey,
                              textInputType: TextInputType.number,
                              txtController:
                                  controller.numberTextEditingController,
                              validatorFtn: Validators.phoneValidator,
                              textInputAction: TextInputAction.next,
                              node: controller.focusNumber,
                              inputFormat: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9-+]')),
                                LengthLimitingTextInputFormatter(15),
                              ],
                              onTap: () {},
                              borderRadius: 9,
                            ),
                            const SizedBox(height: 20),
                            const CustomTextWidget(text: "Country"),
                            const SizedBox(height: 6),
                            CustomTextField(
                              readOnly: true,
                              textFieldColor: controller.focusCountry.hasFocus
                                  ? Styles.black
                                  : Styles.black,
                              maxLines: 1,
                              fillColor: controller.focusCountry.hasFocus
                                  ? Styles.white
                                  : Styles.greyLight.withOpacity(0.10),
                              focusColor: controller.focusCountry.hasFocus
                                  ? Styles.orangeBorder
                                  : Styles.white,
                              hint: "Country",
                              hintColor: Styles.solidGrey,
                              textInputType: TextInputType.name,
                              txtController:
                                  controller.countryTextEditingController,
                              validatorFtn: Validators.required,
                              textInputAction: TextInputAction.next,
                              node: controller.focusCountry,
                              onTap: () {
                                Get.toNamed(Routes.countries, arguments: {
                                  "route": "editProfile",
                                });
                              },
                              borderRadius: 9,
                              suffixWidget: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 18.0, horizontal: 0),
                                child: SizedBox(
                                    width: 12,
                                    height: 7,
                                    child: SvgIconComponent(
                                        icon: "grey_arrow_forward.svg")),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const CustomTextWidget(text: "Language"),
                            const SizedBox(height: 8),
                            controller.selectedLanguage.isNotEmpty
                                ? const SizedBox()
                                : CustomTextField(
                                    readOnly: true,
                                    textFieldColor:
                                        controller.focusLanguage.hasFocus
                                            ? Styles.black
                                            : Styles.black,
                                    maxLines: 1,
                                    fillColor: controller.focusLanguage.hasFocus
                                        ? Styles.white
                                        : Styles.greyLight.withOpacity(0.10),
                                    focusColor:
                                        controller.focusLanguage.hasFocus
                                            ? Styles.orangeBorder
                                            : Styles.white,
                                    hint: "Language",
                                    hintColor: Styles.solidGrey,
                                    textInputType: TextInputType.name,
                                    txtController: controller
                                        .languageTextEditingController,
                                    validatorFtn: Validators.required,
                                    textInputAction: TextInputAction.next,
                                    autoValidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    node: controller.focusLanguage,
                                    onTap: () {
                                      Get.toNamed(Routes.language, arguments: {
                                        'language': controller.selectedLanguage,
                                        'route': Routes.editProfile
                                      });
                                    },
                                    borderRadius: 9,
                                    suffixWidget: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 18.0, horizontal: 0),
                                      child: SizedBox(
                                          width: 12,
                                          height: 7,
                                          child: SvgIconComponent(
                                              icon: "grey_arrow_forward.svg")),
                                    ),
                                  ),
                            controller.selectedLanguage.isEmpty
                                ? const SizedBox()
                                : GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.language, arguments: {
                                        'language': controller.selectedLanguage,
                                        'route': Routes.editProfile
                                      });
                                    },
                                    child: Container(
                                      width: Get.width,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 14),
                                      decoration: BoxDecoration(
                                        color:
                                            Styles.greyLight.withOpacity(0.10),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Wrap(
                                        runSpacing: 10,
                                        spacing: 10,
                                        children: controller.selectedLanguage
                                            .asMap()
                                            .entries
                                            .map(
                                              (e) => Container(
                                                padding: const EdgeInsets.only(
                                                    left: 15,
                                                    right: 6,
                                                    top: 8,
                                                    bottom: 8),
                                                decoration: BoxDecoration(
                                                    color: Styles.metal,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24)),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    CustomTextWidget(
                                                      text: e.value,
                                                      color: Styles.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Styles
                                                              .lightSilver
                                                              .withOpacity(
                                                                  0.5)),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4),
                                                      child: SvgIconComponent(
                                                        icon: 'cross_white.svg',
                                                        height: 10,
                                                        width: 10,
                                                        onTap: () {
                                                          controller
                                                              .selectedLanguage
                                                              .removeAt(e.key);
                                                          controller.update();
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    ),
                                  ),
                            const SizedBox(height: 38),
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
