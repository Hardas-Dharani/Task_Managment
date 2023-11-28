// import 'package:connect_pro/components/svg_icons_components.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../../components/custom_text_component.dart';
// import '../../../../utils/styles.dart';

// class CustomTileComponent extends StatelessWidget {
//   final String video;
//   final String title;
//   final String subTitle;
//   final String? chipText;
//   final bool? showClose;
//   final Color chipColor;
//   final Color chipTextColor;
//   final Widget? menuWidget;
//   final Function()? onCloseTap;

//   const CustomTileComponent({
//     Key? key,
//     this.showClose = false,
//     this.chipText,
//     this.onCloseTap,
//     this.chipColor = Styles.lightGreen,
//     this.chipTextColor = Styles.white,
//     required this.video,
//     required this.title,
//     required this.subTitle,
//     this.menuWidget,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 20),
//       padding: const EdgeInsets.all(10),
//       width: Get.width,
//       decoration: Styles.boxDecoration3,
//       child: Row(
//         children: [
//           SizedBox(
//             width: 89,
//             height: 89,
//             child: Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(11),
//                   child: Image.asset(
//                     Styles.getCommonImage(video.toString()),
//                     width: 89,
//                     height: 89,
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.center,
//                   child: Container(
//                       alignment: Alignment.center,
//                       margin: const EdgeInsets.only(bottom: 6),
//                       width: 40,
//                       height: 40,
//                       decoration: ShapeDecoration(
//                         color: Colors.black.withOpacity(chipText == "Lock" ? 0.4 : 0.6),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(52),
//                         ),
//                       ),
//                       child: chipText == "Lock"
//                           ? Image.asset(
//                               Styles.getIconImage("play_icon_light.png"),
//                               height: 16,
//                             )
//                           : Image.asset(
//                               Styles.getIconImage("play_icon.png"),
//                             )),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 15),
//           Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 if (chipText != null)
//                   SizedBox(
//                     width: Get.width,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         chipText == "Lock"
//                             ? const SvgIconComponent(icon: "lock_icon.svg")
//                             : chipText == "Unlock"
//                                 ? Container(
//                                     height: 19,
//                                     // width: chipText != null ? 120 : 41,
//                                     alignment: Alignment.centerLeft,
//                                     padding: const EdgeInsets.symmetric(horizontal: 7),
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10),
//                                       color: chipColor,
//                                     ),
//                                     child: Row(
//                                       children: [
//                                         const SvgIconComponent(icon: "unlock_icon.svg"),
//                                         const SizedBox(
//                                           width: 4,
//                                         ),
//                                         CustomTextWidget(
//                                           textAlign: TextAlign.left,
//                                           color: chipTextColor,
//                                           text: chipText!,
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w700,
//                                         ),
//                                       ],
//                                     ),
//                                   )
//                                 : Container(
//                                     height: 19,
//                                     // width: chipText != null ? 120 : 41,
//                                     alignment: Alignment.centerLeft,
//                                     padding: const EdgeInsets.symmetric(horizontal: 7),
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10),
//                                       color: chipColor,
//                                     ),
//                                     child: CustomTextWidget(
//                                       textAlign: TextAlign.left,
//                                       color: chipTextColor,
//                                       text: chipText!,
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w700,
//                                     ),
//                                   ),
//                         showClose == true
//                             ? GestureDetector(
//                                 onTap: onCloseTap,
//                                 child: Container(
//                                   width: 20,
//                                   height: 20,
//                                   decoration: BoxDecoration(shape: BoxShape.circle, color: Styles.solidGrey.withOpacity(0.2)),
//                                   child: const Icon(
//                                     Icons.close,
//                                     size: 14,
//                                   ),
//                                 ),
//                               )
//                             : const SizedBox(),
//                       ],
//                     ),
//                   ),
//                 const SizedBox(
//                   height: 4,
//                 ),
//                 CustomTextWidget(text: title.toString(), fontSize: 12, fontWeight: FontWeight.w800, color: Styles.black),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 CustomTextWidget(text: subTitle.toString(), fontSize: 12, lineHeight: 1.25, fontWeight: FontWeight.w600, color: Styles.solidGrey),
//                 const SizedBox(width: 5),
//               ],
//             ),
//           ),
//           menuWidget ?? const SizedBox.shrink(),
//         ],
//       ),
//     );
//   }
// }
