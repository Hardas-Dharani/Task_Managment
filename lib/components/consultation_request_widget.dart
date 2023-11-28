
import 'package:flutter/material.dart';

import '../utils/styles.dart';
import 'custom_text_component.dart';

class ConsultationRequestWidget extends StatelessWidget {
  final String img;
  final String title;
  final String subTitle;
  final String date;
  final String price;
  final Widget? buttonWidget;
  Function()? onTap;
   ConsultationRequestWidget({
    Key? key,
    required this.img,
    required this.title,
    required this.subTitle,
    required this.date,
    required this.price,
    this.buttonWidget,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(12),
      decoration: Styles.boxDecoration2,
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                Container(
                  width: 46,
                  height: 46,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(Styles.getCommonImage(img)),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextWidget(text: title, fontSize: 12, fontWeight: FontWeight.w800, color: Styles.black),
                          CustomTextWidget(text: date, fontSize: 12, fontWeight: FontWeight.w500, color: Styles.solidGrey),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextWidget(text: subTitle, fontSize: 12, fontWeight: FontWeight.w600, color: Styles.solidGrey),
                          CustomTextWidget(text: price, fontSize: 12, fontWeight: FontWeight.w700, color: Styles.black),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          buttonWidget ?? const SizedBox.shrink()
        ],
      ),
    );
  }
}
