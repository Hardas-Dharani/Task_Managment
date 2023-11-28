// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/styles.dart';

class SvgIconComponent extends StatelessWidget {
  final String icon;
  final double? width;
  final double? height;
  final Function()? onTap;
  final Color? color;
  const SvgIconComponent({Key? key, required this.icon, this.width, this.height, this.onTap, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        Styles.getIconImage(icon),
        height: height,
        width: width,
        color: color,
      ),
    );
  }
}

class SvgImageComponent extends StatelessWidget {
  final String icon;
  final double? width;
  final double? height;
  final Function()? onTap;
  final Color? color;
  const SvgImageComponent({Key? key, required this.icon, this.width, this.height, this.onTap, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        Styles.getCommonImage(icon),
        height: height,
        width: width,
        color: color,
      ),
    );
  }
}

class SvgFlagComponent extends StatelessWidget {
  final String icon;
  final double? width;
  final double? height;
  final Function()? onTap;
  final Color? color;
  const SvgFlagComponent({Key? key, required this.icon, this.width, this.height, this.onTap, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        child: SvgPicture.asset(
          icon,
          height: height,
          width: width,
          color: color,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
