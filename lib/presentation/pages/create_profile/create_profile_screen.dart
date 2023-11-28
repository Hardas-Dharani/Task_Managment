import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/custom_appbar_component.dart';
import '../../../components/custom_button_component.dart';
import '../../../components/custom_textfield_component.dart';
import '../../../components/main_scaffold_component.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/styles.dart';
import '../../../utils/validator.dart';
import 'controller/create_profile_controller.dart';

class CreateProfileScreen extends GetView<CreateProfileController> {
  const CreateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateProfileController>(
      init: CreateProfileController(),
      initState: (v) {
        // controller.selectedCountryCode = Get.arguments["selectedCountryCode"];
      },
      builder: (_) {
        // final selectedCountryInfo = controller.selectedCountryInfo;
        return MainScaffold(
          appBar: CustomAppBar(
            backButtonColor: Colors.white,
            title: "Fill Your Profile",
            leading: true,
          ),
          body: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Container(
              color: Colors.transparent,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Styles.screenPadding),
                      child: Form(
                        key: controller.signupFormKey,
                        child: Column(
                          // mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,

                          children: [
                            const SizedBox(height: 20),
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                const CircleAvatar(
                                  radius: 50,
                                  backgroundImage: NetworkImage(
                                      "https://upload.wikimedia.org/wikipedia/commons/b/bc/Unknown_person.jpg"),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Styles.primaryColor),
                                  height: 20,
                                  width: 20,
                                  alignment: Alignment.center,
                                  child: const Icon(
                                    Icons.edit,
                                    size: 10,
                                    color: Styles.white,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                            const SizedBox(height: 33),
                            Column(
                              children: [
                                CustomTextField(
                                  textFieldColor: controller.focusEmail.hasFocus
                                      ? Styles.black
                                      : Styles.black,
                                  maxLines: 1,
                                  fillColor: controller.focusEmail.hasFocus
                                      ? Styles.white
                                      : Styles.greyLight.withOpacity(0.10),
                                  focusColor: controller.focusEmail.hasFocus
                                      ? Styles.primaryColor
                                      : Styles.white,
                                  hint: "Full Name",
                                  hintFontSize: 16,
                                  hintColor: Styles.solidGrey,
                                  textInputType: TextInputType.emailAddress,
                                  txtController:
                                      controller.emailTextEditingController,
                                  validatorFtn: Validators.emailValidator,
                                  textInputAction: TextInputAction.next,
                                  node: controller.focusEmail,
                                  onTap: () {},
                                  padding: 17,
                                  borderRadius: 9,
                                ),
                                const SizedBox(height: 20),
                                CustomTextField(
                                  textFieldColor: controller.focusEmail.hasFocus
                                      ? Styles.black
                                      : Styles.black,
                                  maxLines: 1,
                                  fillColor: controller.focusEmail.hasFocus
                                      ? Styles.white
                                      : Styles.greyLight.withOpacity(0.10),
                                  focusColor: controller.focusEmail.hasFocus
                                      ? Styles.primaryColor
                                      : Styles.white,
                                  hint: "User Name",
                                  hintFontSize: 16,
                                  hintColor: Styles.solidGrey,
                                  textInputType: TextInputType.emailAddress,
                                  txtController:
                                      controller.emailTextEditingController,
                                  validatorFtn: Validators.emailValidator,
                                  textInputAction: TextInputAction.next,
                                  node: controller.focusEmail,
                                  onTap: () {},
                                  padding: 17,
                                  borderRadius: 9,
                                ),
                                const SizedBox(height: 20),
                                CustomTextField(
                                  textFieldColor: controller.focusEmail.hasFocus
                                      ? Styles.black
                                      : Styles.black,
                                  maxLines: 1,
                                  fillColor: controller.focusEmail.hasFocus
                                      ? Styles.white
                                      : Styles.greyLight.withOpacity(0.10),
                                  focusColor: controller.focusEmail.hasFocus
                                      ? Styles.primaryColor
                                      : Styles.white,
                                  hint: "Email",
                                  hintFontSize: 16,
                                  suffixIcon: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.calendar_today,
                                        color: Styles.black,
                                      )),
                                  hintColor: Styles.solidGrey,
                                  textInputType: TextInputType.text,
                                  txtController:
                                      controller.emailTextEditingController,
                                  validatorFtn: Validators.emailValidator,
                                  textInputAction: TextInputAction.next,
                                  node: controller.focusEmail,
                                  onTap: () {},
                                  padding: 17,
                                  borderRadius: 9,
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    Expanded(
                                      child: CustomButton(
                                        radius: 9,
                                        borderColor:
                                            controller.buttonClicked != "Male"
                                                ? Styles.primaryColor
                                                    .withOpacity(0.3)
                                                : Styles.primaryColor,
                                        bgColor: Styles.white,
                                        onTap: () {
                                          controller.buttonClicked = "Male";
                                          controller.update();
                                        },
                                        title: "Male",
                                        fontColor:
                                            controller.buttonClicked == "Male"
                                                ? Styles.black
                                                : Styles.greyLight,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: CustomButton(
                                        radius: 9,
                                        onTap: () {
                                          controller.buttonClicked = "Female";
                                          controller.update();
                                        },
                                        borderColor:
                                            controller.buttonClicked == "Male"
                                                ? Styles.primaryColor
                                                    .withOpacity(0.3)
                                                : Styles.primaryColor,
                                        fontColor:
                                            controller.buttonClicked == "Male"
                                                ? Styles.grey
                                                : Styles.black,
                                        bgColor: Styles.white,
                                        title: "Female",
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 20),
                                CustomTextField(
                                  textFieldColor: controller.focusEmail.hasFocus
                                      ? Styles.black
                                      : Styles.black,
                                  maxLines: 1,
                                  fillColor: controller.focusEmail.hasFocus
                                      ? Styles.white
                                      : Styles.greyLight.withOpacity(0.10),
                                  focusColor: controller.focusEmail.hasFocus
                                      ? Styles.primaryColor
                                      : Styles.white,
                                  hint: "Collage",
                                  hintFontSize: 16,
                                  suffixIcon: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.calendar_today,
                                        color: Styles.black,
                                      )),
                                  hintColor: Styles.solidGrey,
                                  textInputType: TextInputType.text,
                                  txtController:
                                      controller.emailTextEditingController,
                                  textInputAction: TextInputAction.next,
                                  node: controller.focusEmail,
                                  onTap: () {},
                                  padding: 17,
                                  borderRadius: 9,
                                ),
                                const SizedBox(height: 20),
                                CustomTextField(
                                  textFieldColor: controller.focusEmail.hasFocus
                                      ? Styles.black
                                      : Styles.black,
                                  maxLines: 5,
                                  fillColor: controller.focusEmail.hasFocus
                                      ? Styles.white
                                      : Styles.greyLight.withOpacity(0.10),
                                  focusColor: controller.focusEmail.hasFocus
                                      ? Styles.primaryColor
                                      : Styles.white,
                                  hint: "About",
                                  hintFontSize: 16,

                                  hintColor: Styles.solidGrey,
                                  textInputType: TextInputType.text,
                                  txtController:
                                      controller.emailTextEditingController,
                                  textInputAction: TextInputAction.next,
                                  node: controller.focusEmail,
                                  onTap: () {},
                                  padding: 30,

                                  // maxLength: 200,
                                  borderRadius: 9,
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),

                            // SizedBox(
                            //   width: Get.width,
                            //   child: GestureDetector(
                            //     behavior: HitTestBehavior.opaque,
                            //     onTap: () {
                            //       controller.setRememberVisiblity(
                            //           !controller.rememberMe);
                            //       if (kDebugMode) {
                            //         print(controller.rememberMe);
                            //       }
                            //     },
                            //     child: Row(
                            //       children: [
                            //         Row(
                            //           children: [
                            //             Radio(
                            //                 value: controller
                            //                     .getRememberVisiblity(),
                            //                 groupValue: controller
                            //                     .getRememberVisiblity(),
                            //                 onChanged: (value) {}),
                            //             const SizedBox(
                            //               width: 10,
                            //             ),
                            //             const CustomTextWidget(
                            //               text: "Remember me",
                            //               fontSize: 13,
                            //               fontWeight: FontWeight.w600,
                            //               color: Styles.greyLight2,
                            //             ),
                            //           ],
                            //         ),
                            //         const Spacer(),
                            //         GestureDetector(
                            //           onTap: () {
                            //             Get.toNamed(Routes.forgotPassword);
                            //             // Navigator.pushNamed(
                            //             //     context, Routes.forgotPassword);
                            //           },
                            //           child: const CustomTextWidget(
                            //             text: "Forgot Password?",
                            //             fontSize: 13,
                            //             fontWeight: FontWeight.w600,
                            //             color: Styles.redNormal,
                            //           ),
                            //         )
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            const SizedBox(height: 38),

                            CustomButton(
                              title: "Continue",
                              fontColor: Styles.white,
                              fontSize: 16,
                              onTap: () {
                                Get.toNamed(Routes.bottomNavBar);
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
          ),
        );
      },
    );
  }

  // void _openCountryPickerDialog(BuildContext context) {
  //   showCountryPicker(
  //     context: context,
  //     onSelect: (Country country) {
  //       controller.selectCountry(country);
  //       // Navigator.pop(context);
  //     },

  //     // useSafeArea: true,

  //     showPhoneCode: false,
  //     countryListTheme: CountryListThemeData(
  //       inputDecoration: InputDecoration(
  //         contentPadding: const EdgeInsets.all(2),
  //         filled: true,
  //         hintText: "Search",
  //         hintStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, fontFamily: "Manrope", color: Styles.solidGrey.withOpacity(0.6)),
  //         enabledBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(9),
  //           borderSide: BorderSide(
  //             width: 0.5,
  //             color: Styles.white.withOpacity(0.5),
  //             style: BorderStyle.none,
  //           ),
  //         ),
  //         focusedBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(9),
  //           borderSide: const BorderSide(
  //             color: Styles.orangeBorder,
  //           ),
  //         ),
  //         errorBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(9),
  //           borderSide: const BorderSide(
  //             color: Color(0xFFF7F7F7),
  //           ),
  //         ),
  //         focusedErrorBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(9),
  //           borderSide: const BorderSide(
  //             color: Color(0xFFF7F7F7),
  //           ),
  //         ),
  //         border: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(9),
  //           borderSide: const BorderSide(
  //             width: 0,
  //             style: BorderStyle.none,
  //           ),
  //         ),
  //         counterStyle: TextStyle(fontFamily: "Manrope", fontSize: 12, fontWeight: FontWeight.w600, color: Styles.solidGrey.withOpacity(0.8)),
  //         prefixIcon: const Padding(
  //           padding: EdgeInsets.all(16.0),
  //           child: SvgIconComponent(
  //             icon: "search_black_2x.svg",
  //             color: Styles.greyLight,
  //           ),
  //         ),
  //         fillColor: controller.focusNumber.hasFocus ? Styles.white : Styles.greyLight.withOpacity(0.10),
  //         focusColor: controller.focusNumber.hasFocus ? Styles.orangeBorder : Styles.white,
  //       ),
  //       borderRadius: BorderRadius.circular(5),
  //       flagSize: 30.0,
  //       backgroundColor: Colors.white,
  //       textStyle: const TextStyle(
  //         fontSize: 14.0,
  //         fontFamily: "Menrope",
  //         fontWeight: FontWeight.w600,
  //       ),
  //     ),
  //   );
  // }
}
