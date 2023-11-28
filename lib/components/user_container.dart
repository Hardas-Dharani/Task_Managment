import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/custom_text_component.dart';
import '../../../../components/svg_icons_components.dart';
import '../../../../utils/styles.dart';

class UserContainerWidget extends StatelessWidget {
  final String img;
  final String title;
  final String subTitle;
  final bool isPremium;
  final bool productActive;
  final bool saved;
  final String rating;
  final String totalTime;
  final String duration;
  final bool durrationClose;

  const UserContainerWidget({
    Key? key,
    required this.img,
    required this.title,
    required this.subTitle,
    required this.rating,
    required this.totalTime,
    this.isPremium = false,
    this.durrationClose = false,
    this.productActive = false,
    this.saved = false,
    required this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(9),
      margin: const EdgeInsets.only(bottom: 15),
      width: Get.width,
      decoration: Styles.boxDecoration2,
      child: Row(
        children: [
          SizedBox(
            width: 93,
            height: 89,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(11),
                  child: Image.asset(
                    Styles.getCommonImage(img.toString()),
                    width: 93,
                    height: 89,
                    fit: BoxFit.contain,
                  ),
                ),

                // Align(
                //   alignment: Alignment.bottomCenter,
                //   child: Opacity(
                //     opacity: 0.60,
                //     child: Container(
                //       margin: const EdgeInsets.only(bottom: 6),
                //       width: 71,
                //       height: 22,
                //       decoration: ShapeDecoration(
                //         color: Colors.black,
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(52),
                //         ),
                //       ),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           Container(
                //             width: 8,
                //             height: 8,
                //             decoration: ShapeDecoration(
                //               color: productActive
                //                   ? Styles.greenActive
                //                   : Styles.orangeActive,
                //               shape: const OvalBorder(),
                //             ),
                //           ),
                //           const SizedBox(width: 6),
                //           CustomTextWidget(
                //               text: productActive ? "Active" : "Away",
                //               fontSize: 12,
                //               color: Styles.white,
                //               fontWeight: FontWeight.w500),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            flex: 2,
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: CustomTextWidget(text: title.toString(), fontSize: 12, fontWeight: FontWeight.w800, color: Styles.black),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  durrationClose
                      ? const SizedBox()
                      : const SvgIconComponent(
                          icon: "verified_icon.svg",
                          height: 20,
                          width: 20,
                        )
                ],
              ),
              const SizedBox(height: 4),
              CustomTextWidget(text: subTitle.toString(), fontSize: 12, fontWeight: FontWeight.w600, color: Styles.solidGrey),
              const SizedBox(height: 4),
              Row(
                children: [
                  const SvgIconComponent(icon: "yellow_star_2x.svg", width: 12, height: 12),
                  const SizedBox(width: 7),
                  CustomTextWidget(text: rating.toString(), fontSize: 12, fontWeight: FontWeight.w600, color: Styles.black),
                ],
              ),
              const SizedBox(height: 11),
              CustomTextWidget(text: duration.toString(), fontSize: 12, fontWeight: FontWeight.w700, color: Styles.black),

              // RichTextWidget(
              //     text: "\$$price",
              //     color: Styles.black,
              //     textFontSize: 14,
              //     textFontWeight: FontWeight.w700,
              //     onTapText: " /hr",
              //     onTapColor: Styles.black,
              //     onTapFontSize: 10,
              //     onTapFontWeight: FontWeight.w400),
            ]),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            width: 1,
            height: 74,
            decoration: const BoxDecoration(color: Color(0xFFE9EDEF)),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: durrationClose ? CustomTextWidget(text: totalTime.toString(), fontSize: 12, fontWeight: FontWeight.w800, color: Styles.solidOrange) : CustomTextWidget(text: totalTime.toString(), fontSize: 14, fontWeight: FontWeight.w900, color: Styles.black),
          )
        ],
      ),
    );
  }
}
