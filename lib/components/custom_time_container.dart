// import 'package:connect_pro/domain/entities/available_slot_model.dart';
// import 'package:connect_pro/utils/styles.dart';
// import 'package:flutter/material.dart';
// import 'custom_text_component.dart';

// class CustomTimeContainer extends StatelessWidget {
//   TimesOfTheDay? slots;
//   double width;
//   double height;
//   CustomTimeContainer({
//     super.key,
//     required this.slots,
//     this.height = 39,
//     this.width = 99,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(
//           height: 12,
//         ),
//         const CustomTextWidget(
//           text: "Morning",
//           fontSize: 14,
//           fontWeight: FontWeight.w700,
//         ),
//         const SizedBox(
//           height: 12,
//         ),
//         Wrap(
//           spacing: 15,
//           runSpacing: 15,
//           children: List.generate(slots!.morningSlots.length, (index) {
//             return GestureDetector(
//               onTap: () {
//                 if (slots!.morningSlots[index].isAvailable == true) {}
//               },
//               child: Container(
//                 alignment: Alignment.center,
//                 height: height,
//                 width: width,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     color: slots!.morningSlots[index].isAvailable == false
//                         ? Styles.solidGrey.withOpacity(0.2)
//                         : null,
//                     border: slots!.morningSlots[index].isAvailable == false
//                         ? Border.all(width: 0, color: Colors.transparent)
//                         : Border.all(width: 1, color: Styles.solidOrange)),
//                 child: CustomTextWidget(
//                   text: slots!.morningSlots[index].time!,
//                   fontWeight: FontWeight.w800,
//                   fontSize: 12,
//                   color: slots!.morningSlots[index].isAvailable == false
//                       ? Styles.solidGrey.withOpacity(0.5)
//                       : Styles.black,
//                 ),
//               ),
//             );
//           }),
//         ),
//         const SizedBox(
//           height: 19,
//         ),
//         const SizedBox(
//           height: 12,
//         ),
//         const CustomTextWidget(
//           text: "Noon",
//           fontSize: 14,
//           fontWeight: FontWeight.w700,
//         ),
//         const SizedBox(
//           height: 12,
//         ),
//         Wrap(
//           spacing: 15,
//           runSpacing: 15,
//           children: List.generate(slots!.noonSlots.length, (index) {
//             return GestureDetector(
//               onTap: () {
//                 if (slots!.noonSlots[index].isAvailable == true) {
//                   //selectedSlot = slots!.noonSlots[index];
//                   //isSelected = true;
//                 }
//               },
//               child: Container(
//                 alignment: Alignment.center,
//                 height: height,
//                 width: width,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     color: slots!.noonSlots[index].isAvailable == false
//                         ? Styles.solidGrey.withOpacity(0.2)
//                         : null,
//                     border: slots!.noonSlots[index].isAvailable == false
//                         ? Border.all(width: 0, color: Colors.transparent)
//                         : Border.all(width: 1, color: Styles.solidOrange)),
//                 child: CustomTextWidget(
//                   text: slots!.noonSlots[index].time!,
//                   fontWeight: FontWeight.w800,
//                   fontSize: 12,
//                   color: slots!.noonSlots[index].isAvailable == false
//                       ? Styles.solidGrey.withOpacity(0.5)
//                       : Styles.black,
//                 ),
//               ),
//             );
//           }),
//         ),
//         const SizedBox(
//           height: 19,
//         ),
//         const SizedBox(
//           height: 12,
//         ),
//         const CustomTextWidget(
//           text: "Evening",
//           fontSize: 14,
//           fontWeight: FontWeight.w700,
//         ),
//         const SizedBox(
//           height: 12,
//         ),
//         Wrap(
//           spacing: 15,
//           runSpacing: 15,
//           children: List.generate(slots!.eveningSlots.length, (index) {
//             return GestureDetector(
//               onTap: () {
//                 if (slots!.eveningSlots[index].isAvailable == true) {}
//               },
//               child: Container(
//                 alignment: Alignment.center,
//                 height: height,
//                 width: width,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     color: slots!.eveningSlots[index].isAvailable == false
//                         ? Styles.solidGrey.withOpacity(0.2)
//                         : null,
//                     border: slots!.eveningSlots[index].isAvailable == false
//                         ? Border.all(width: 0, color: Colors.transparent)
//                         : Border.all(width: 1, color: Styles.solidOrange)),
//                 child: CustomTextWidget(
//                   text: slots!.eveningSlots[index].time!,
//                   fontWeight: FontWeight.w800,
//                   fontSize: 12,
//                   color: slots!.eveningSlots[index].isAvailable == false
//                       ? Styles.solidGrey.withOpacity(0.5)
//                       : Styles.black,
//                 ),
//               ),
//             );
//           }),
//         ),
//         const SizedBox(
//           height: 19,
//         ),
//       ],
//     );
//   }
// }
