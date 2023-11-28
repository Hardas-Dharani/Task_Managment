// import 'package:connect_pro/components/custom_text_component.dart';
// import 'package:connect_pro/components/main_scaffold_component.dart';
// import 'package:connect_pro/components/richtext_component.dart';
// import 'package:connect_pro/components/svg_icons_components.dart';
// import 'package:connect_pro/utils/styles.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
// import '../../../components/custom_button_component.dart';
// import '../../../components/custom_text_component.dart';
// import '../../../components/main_scaffold_component.dart';
// import '../../../components/svg_icons_components.dart';
// import '../../../routes/app_routes.dart';
// import '../../../utils/styles.dart';
// import '../../../utils/validator.dart';
// import '../signin/controller/signin_controller.dart';
// import 'controller/verification_controller.dart';

// class VerificationScreen extends GetView<VerificationController> {
//   const VerificationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MainScaffold(
//       body: GetBuilder<VerificationController>(
//         init: VerificationController(),
//         // initState: (v) {
//         //   // WidgetsBinding.instance.addPostFrameCallback((_) {});
//         // },
//         builder: (_) {
//           return GestureDetector(
//             onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
//             child: Container(
//               color: Colors.transparent,
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Container(
//                       height: 200,
//                       width: Get.width,
//                       padding: const EdgeInsets.symmetric(horizontal: Styles.screenPadding, vertical: 20),
//                       decoration: BoxDecoration(gradient: Styles.linearMetal),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           GestureDetector(
//                               onTap: () {
//                                 Get.back();
//                               },
//                               child: const SvgIconComponent(icon: "appbar_back_2x.svg", height: 20, width: 21.25)),
//                           const CustomTextWidget(
//                             text: "Enter \nVerfication Code",
//                             fontSize: 32,
//                             color: Styles.white,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: Styles.screenPadding),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           const SizedBox(height: 32),
//                           Form(
//                             key: controller.otpFormKey,
//                             child: SizedBox(
//                               width: 258,
//                             child: PinCodeTextField(
//                                 animationType: AnimationType.fade,
//                                 appContext: context,
//                                 pastedTextStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontFamily: "Manrope", fontSize: 13),
//                                 length: 4,
//                                 validator: Validators.otpValidator,
//                                 pinTheme: PinTheme(
//                                   shape: PinCodeFieldShape.box,
//                                   borderRadius: BorderRadius.circular(9),
//                                   fieldHeight: 55,
//                                   fieldWidth: 52,
//                                   activeFillColor: Styles.greyLight.withOpacity(0.10),
//                                   activeColor: Styles.white,
//                                   selectedFillColor: Colors.white,
//                                   selectedColor: Styles.orangeBorder,
//                                   inactiveFillColor: Styles.greyLight.withOpacity(0.10),
//                                   inactiveColor: Colors.transparent,
//                                 ),
//                                 cursorColor: Colors.black,
//                                 animationDuration: const Duration(milliseconds: 300),
//                                 enableActiveFill: true,
//                                 controller: controller.otpFieldController,
//                                 keyboardType: TextInputType.number,
//                                 boxShadows: const [
//                                   BoxShadow(
//                                     offset: Offset(0, 1),
//                                     color: Colors.black12,
//                                     blurRadius: 10,
//                                   )
//                                 ],
//                                 onCompleted: (v) {
//                                   debugPrint("Completed");
//                                 },
//                                 // onTap: () {
//                                 //   print("Pressed");
//                                 // },
//                                 onChanged: (value) {
//                                   // debugPrint(value);
//                                   // setState(() {
//                                   //   currentText = value;
//                                   // });
//                                 },
//                                 beforeTextPaste: (text) {
//                                   debugPrint("Allowing to paste $text");
//                                   return true;
//                                 },
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 39),
//                           CustomButton(
//                             gradient: Styles.linearOrange,
//                             title: "Submit",
//                             fontColor: Colors.white,
//                             width: Get.width,
//                             height: 49,
//                             radius: 8,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w700,
//                             onTap: () {
//                               FocusManager.instance.primaryFocus?.unfocus();
//                               Get.toNamed(Routes.resetPassword);
                          
//                             },
//                           ),
//                           const SizedBox(height: 53.25),
//                           const CustomTextWidget(
//                             text: "We sent a 4 digit code to your email",
//                             fontSize: 15,
//                             color: Styles.greyLight2,
//                             fontWeight: FontWeight.w500,
//                             lineHeight: 1.42,
//                           ),
//                           RichTextWidget(
//                             text: "nolan_bergson@gmail.com ",
//                             onTapText: " Change Email",
//                             color: Styles.blue,
//                             textFontSize: 16,
//                             textFontWeight: FontWeight.w500,
//                             onTapColor: Styles.metal,
//                             decoration: TextDecoration.underline,
//                             onTapFontSize: 16,
//                             onTapFontWeight: FontWeight.w500,
//                             onTap: () {},
//                           ),
//                           const SizedBox(height: 67),
//                           const CustomTextWidget(
//                             text: "Resend Code",
//                             fontSize: 16,
//                             color: Styles.metal,
//                             fontWeight: FontWeight.w500,
//                             decoration: TextDecoration.underline,
//                             lineHeight: 1.42,
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
