import 'package:flutter/material.dart';

import 'svg_icons_components.dart';

class CustomIconButton extends StatelessWidget {
  final String? icon;
  final Icon? iconIcon;
  final double? height;
  final double? iconHeight;
  final double? width;
  final double? iconWidth;
  final Color? color;
  final Color? iconColor;
  final double borderRadius;
  final double padding;
  final bool isIconString;
  final Function()? onTap;
  const CustomIconButton(
      {super.key,
      this.icon,
      required this.color,
      required this.onTap,
      this.borderRadius = 8,
      this.iconColor,
      this.padding = 14,
      this.height = 50,
      this.iconHeight = 20,
      this.width = 50,
      this.iconWidth = 20,
      this.isIconString = true,
      this.iconIcon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: height,
          width: width,
          padding: EdgeInsets.all(isIconString == true ? padding : 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: color!,
          ),
          child: isIconString == true
              ? SvgIconComponent(
                  icon: icon!,
                  width: iconWidth,
                  height: iconHeight,
                  color: iconColor,
                )
              : iconIcon),
    );
  }
}
