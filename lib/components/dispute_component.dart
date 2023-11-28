import 'package:flutter/material.dart';

import '../utils/styles.dart';
import 'custom_text_component.dart';
import 'richtext_component.dart';

class DisputeWidget extends StatelessWidget {
  final String img;
  final String title;
  final String subTitle;
  final Widget? widget;
  final String date;
  final String bookingId;
  final String price;
  final String time;
  const DisputeWidget({
    Key? key,
    required this.img,
    required this.title,
    required this.subTitle,
    required this.date,
    required this.widget,
    required this.bookingId,
    required this.price,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Styles.white,
        border: Border.all(color: Styles.greyLight2.withOpacity(0.4), width: 0.3),
        borderRadius: BorderRadius.circular(11),
        boxShadow: [
          BoxShadow(
            color: const Color(0x00979797).withOpacity(0.1),
            offset: const Offset(-1, 1),
            blurRadius: 17,
            spreadRadius: 1,
          )
        ],
      ),
      child: Column(
        children: [
          Row(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextWidget(text: title, fontSize: 12, fontWeight: FontWeight.w800, color: Styles.black),
                            const SizedBox(height: 3),
                            CustomTextWidget(text: subTitle, fontSize: 12, fontWeight: FontWeight.w600, color: Styles.solidGrey),
                          ],
                        ),
                        widget ?? const SizedBox.shrink()
                      ],
                    ),
                    const SizedBox(height: 2),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          const Divider(color: Styles.solidGrey, thickness: 0.2),
          const SizedBox(height: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichTextWidget(
                        text: "Booking ID ",
                        color: Styles.black,
                        textFontSize: 14,
                        textFontWeight: FontWeight.w700,
                        onTapText: bookingId,
                        onTapColor: Styles.solidOrange,
                        onTapFontSize: 14,
                        onTapFontWeight: FontWeight.w700,
                      ),
                      const SizedBox(height: 3),
                      CustomTextWidget(text: date, fontSize: 12, fontWeight: FontWeight.w500, color: Styles.solidGrey),
                    ],
                  ),
                  RichTextWidget(
                    text: price,
                    color: Styles.black,
                    textFontSize: 12,
                    textFontWeight: FontWeight.w700,
                    onTapText: " ($time)",
                    onTapColor: Styles.black,
                    onTapFontSize: 12,
                    onTapFontWeight: FontWeight.w500,
                  ),
                ],
              ),
              const SizedBox(height: 2),
            ],
          ),
        ],
      ),
    );
  }
}
