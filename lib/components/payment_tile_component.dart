// import 'package:connect_pro/utils/styles.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'custom_icon_button.dart';
// import 'custom_text_component.dart';

// class PaymentTileComponent extends StatelessWidget {
//   String? title;
//   String? subtitle;
//   Widget? widget;
//   String? cardType;
//   PaymentTileComponent(
//       {super.key, this.title, this.subtitle, this.cardType, this.widget});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(left: 17, top: 19, bottom: 19, right: 3),
//       width: Get.width,
//       decoration: Styles.boxDecoration2,
//       child: Row(
//         children: [
//           CustomIconButton(
//             icon: cardType ?? "master_card.svg",
//             padding: cardType == "apple_logo.svg" ? 11 : 8,
//             color: Styles.solidGrey.withOpacity(0.1),
//             borderRadius: 11,
//             onTap: () {},
//           ),
//           const SizedBox(
//             width: 14,
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CustomTextWidget(
//                 text: title!,
//                 fontSize: 14,
//                 fontWeight: FontWeight.w700,
//               ),
//               SizedBox(
//                 height: subtitle != "" ? 3 : 0,
//               ),
//               subtitle != ""
//                   ? CustomTextWidget(
//                       text: subtitle!,
//                       fontSize: 14,
//                       fontWeight: FontWeight.w600,
//                       color: Styles.solidGrey.withOpacity(0.7),
//                     )
//                   : const SizedBox()
//             ],
//           ),
//           const Spacer(),
//           widget ?? const SizedBox()
//         ],
//       ),
//     );
//   }
// }
