// import 'package:connect_pro/utils/styles.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// import 'custom_text_component.dart';
// import 'svg_icons_components.dart';

// class ReviewsComponent extends StatelessWidget {
//   final String? leading;
//   final String? title;
//   final String? subtitle;
//   final double? rating;
//   final String? description;
//   const ReviewsComponent(
//       {super.key,
//       required this.leading,
//       required this.title,
//       required this.subtitle,
//       required this.rating,
//       required this.description});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(height: 25,),
//         Column(
//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CircleAvatar(
//                   radius: 23,
//                   backgroundImage: AssetImage(
//                     Styles.getCommonImage(leading!),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 12,
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     const SizedBox(
//                       height: 4,
//                     ),
//                     CustomTextWidget(
//                       text: title!,
//                       fontWeight: FontWeight.w700,
//                       fontSize: 14,
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     CustomTextWidget(
//                       text: subtitle!,
//                       fontSize: 12,
//                       fontWeight: FontWeight.w600,
//                       color: Styles.solidGrey,
//                     ),
//                   ],
//                 ),
//                 const Spacer(),
//                 RatingBar(
//                   initialRating: rating!,
//                   direction: Axis.horizontal,
//                   allowHalfRating: true,
//                   ignoreGestures: true,
//                   itemCount: 5,
//                   itemSize: 12,
//                   ratingWidget: RatingWidget(
//                     full: const SvgIconComponent(icon: 'star_icon_yellow.svg'),
//                     half: const SvgIconComponent(icon: 'star_icon.svg'),
//                     empty: const SvgIconComponent(icon: 'star_icon.svg'),
//                   ),
//                   itemPadding:
//                       const EdgeInsets.symmetric(horizontal: 2.5, vertical: 4),
//                   onRatingUpdate: (rating) {
//                     if (kDebugMode) {
//                       print(rating);
//                     }
//                   },
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 18,
//             ),
//             CustomTextWidget(
//               text:
//                   description!,
//               fontSize: 12,
//               fontWeight: FontWeight.w500,
//               color: Styles.solidGrey,
//               lineHeight: 1.3,
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//         Divider(
//           thickness: 1,
//           color: Styles.solidGreyBorder,
//         ),
//       ],
//     );
//   }
// }
