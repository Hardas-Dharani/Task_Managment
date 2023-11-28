import 'package:flutter/material.dart';

import '../utils/styles.dart';
import 'custom_text_component.dart';

class ChipComponent extends StatelessWidget {
  String? text;
  Color color;
  Color fontColor;
  double fontSize;
  double borderRadius;
  FontWeight fontWeight;
  EdgeInsets padding;
  ChipComponent(
      {super.key,
      required this.text,
      this.color = Styles.metal,
      this.fontColor = Styles.white,
      this.fontSize = 14,
      this.borderRadius = 8,
      this.fontWeight = FontWeight.w700,
      this.padding =
          const EdgeInsets.only(left: 14, right: 14, bottom: 10, top: 10)});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: color,
      ),
      child: CustomTextWidget(
        text: text!,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: fontColor,
      ),
    );
  }
}
