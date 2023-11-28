// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomButton extends StatelessWidget {
  void Function()? onTap;
  String? title;
  double? fontSize;
  double radius;
  double? height;
  double? width;
  FontWeight? fontWeight;
  Color? fontColor;
  Color? bgColor;
  Widget? icon;
  bool isIcon;
  Gradient? gradient;
  Color? borderColor;
  double? borderWidth;
  CustomButton({
    Key? key,
    this.onTap,
    this.title,
    this.borderColor,
    this.borderWidth,
    this.fontSize = 16,
    this.radius = 24,
    this.height = 45,
    this.width = 300,
    this.fontWeight = FontWeight.normal,
    this.fontColor = Styles.black,
    this.bgColor = Styles.primaryColor,
    this.icon,
    this.gradient,
    this.isIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: bgColor,
          boxShadow: [
            BoxShadow(
                color: Styles.primaryColor.withOpacity(0.5),
                blurRadius: 2,
                spreadRadius: 2,
                offset: const Offset(0, 2))
          ],
          border: borderColor != null
              ? Border.all(width: borderWidth ?? 1, color: borderColor!)
              : null,
          gradient: gradient,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon ?? const SizedBox(),
              isIcon ? const SizedBox(width: 13.19) : const SizedBox(),
              Text(title.toString(),
                  style: TextStyle(
                      fontFamily: "Manrope",
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                      color: fontColor)),
            ],
          ),
        ),
      ),
    );
  }
}
