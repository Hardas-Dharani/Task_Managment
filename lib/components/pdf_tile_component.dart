import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/styles.dart';
import 'custom_text_component.dart';
import 'svg_icons_components.dart';

class PdfTileWidget extends StatelessWidget {
  final String img;

  final String title;
  final String date;
  final Function()? onClose;
  const PdfTileWidget({
    Key? key,
    required this.img,
    required this.title,
    required this.date,
    this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17),
      margin: const EdgeInsets.only(bottom: 15),
      width: Get.width,
      decoration: BoxDecoration(
        color: Styles.greyLight.withOpacity(0.13),
        borderRadius: BorderRadius.circular(11),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 41,
            height: 41,
            child: SvgIconComponent(icon: img),
          ),
          const SizedBox(width: 11),
          Expanded(
            child: SizedBox(
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 2),
                      CustomTextWidget(text: title, fontSize: 14, fontWeight: FontWeight.w700, color: Styles.black),
                      const SizedBox(height: 4),
                      CustomTextWidget(text: date, fontSize: 12, fontWeight: FontWeight.w600, color: Styles.solidGrey),
                    ],
                  ),
                  GestureDetector(
                    onTap: onClose,
                    child: Container(
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Styles.solidGrey.withOpacity(0.2)),
                      child: const Icon(Icons.close_rounded, size: 17,color: Styles.solidGrey,),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
