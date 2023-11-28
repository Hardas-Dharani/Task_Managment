import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/styles.dart';
import 'custom_text_component.dart';
import 'svg_icons_components.dart';

class ExperienceTileWidget extends StatelessWidget {
  final String img;
  final String subTitle;
  final String title;
  final String date;
  final Function()? onClose;
  final bool hideClose;
  final Widget? menuWidget;
  const ExperienceTileWidget({
    Key? key,
    required this.img,
    required this.subTitle,
    required this.title,
    required this.date,
    this.onClose,
    this.hideClose = true,
    this.menuWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      // margin: const EdgeInsets.only(bottom: 30),
      width: Get.width,
      decoration: BoxDecoration(
        color: Styles.white,
        borderRadius: BorderRadius.circular(15),
        // color: Styles.white,
        border: Border.all(color: Styles.greyLight2.withOpacity(0.4), width: 0.3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            offset: const Offset(8, 9),
            blurRadius: 22,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 41,
            height: 41,
            child: SvgIconComponent(icon: img),
          ),
          const SizedBox(width: 11),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: Get.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextWidget(text: subTitle, fontSize: 12, fontWeight: FontWeight.w600, color: Styles.solidOrange),
                      hideClose
                          ? GestureDetector(
                              onTap: onClose,
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(shape: BoxShape.circle, color: Styles.solidGrey.withOpacity(0.2)),
                                child: const Icon(Icons.close, size: 14),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
                const SizedBox(height: 2),
                CustomTextWidget(text: title, fontSize: 14, fontWeight: FontWeight.w800, color: Styles.black),
                const SizedBox(height: 4),
                CustomTextWidget(text: date, fontSize: 12, fontWeight: FontWeight.w600, color: Styles.solidGrey),
              ],
            ),
          ),
          menuWidget ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
