// import 'package:connect_pro/components/custom_appbar_component.dart';
// import 'package:connect_pro/components/custom_button_component.dart';
// import 'package:connect_pro/components/custom_text_component.dart';
// import 'package:connect_pro/components/custom_tutorial_tile.dart';
// import 'package:connect_pro/components/main_scaffold_component.dart';
// import 'package:connect_pro/components/reviews_component.dart';
// import 'package:connect_pro/components/svg_icons_components.dart';
// import 'package:connect_pro/presentation/pages/consultant_detail/controller/consultant_controller.dart';
// import 'package:connect_pro/presentation/pages/video_call/controller/video_call_controller.dart';
// import 'package:connect_pro/routes/app_routes.dart';
// import 'package:connect_pro/utils/styles.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';

// class AdScreen extends GetView<VideoCallController> {
//   const AdScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//         // systemNavigationBarColor: Colors.white, // navigation bar color
//         statusBarColor: Colors.transparent, // status bar color
//         statusBarIconBrightness: Brightness.dark));
//     return Scaffold(
//       body: GetBuilder<VideoCallController>(builder: (_) {
//         return Stack(
//           children: [
//             Image.asset(
//               Styles.getCommonImage("gatorade_4x.png"),
//               fit: BoxFit.fill,
//               width: Get.width,
//             ),
//             Align(
//               alignment: Alignment.topCenter,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: Styles.screenPadding, vertical: 60),
//                 child: Container(
//                   // color: Colors.red,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const CustomTextWidget(
//                         text: "00:26",
//                         fontWeight: FontWeight.w500,
//                         fontSize: 18,
//                         color: Styles.white,
//                       ),
//                       Container(
//                           padding: const EdgeInsets.all(7.5),
//                           decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: Colors.black.withOpacity(0.4)),
//                           child: SvgIconComponent(
//                             icon: "cross_white.svg",
//                             width: 15,
//                             onTap: () {
//                               Get.offAndToNamed(Routes.writeAReview);
//                             },
//                           ))
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         );
//       }),
//     );
//   }
// }
