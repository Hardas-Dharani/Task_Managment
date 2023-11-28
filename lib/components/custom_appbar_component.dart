// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/custom_text_component.dart';
import '../utils/styles.dart';

class CustomAppBar extends StatelessWidget {
  Function()? onLeadingPress;
  String? title;
  Widget? trailing;
  bool leading;
  Color bgColor;
  Color? backButtonColor;
  Color? trailingColor;
  Color? titleColor;
  bool centerTitle;
  Widget? leadingWidget;
  Widget? titleWidget;
  IconThemeData? iconThemeData;

  CustomAppBar(
      {Key? key,
      this.title,
      this.centerTitle = true,
      this.onLeadingPress,
      this.leading = false,
      this.titleWidget,
      this.bgColor = Styles.white,
      this.trailingColor,
      this.titleColor,
      this.trailing,
      this.leadingWidget,
      this.backButtonColor,
      this.iconThemeData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: bgColor,
      automaticallyImplyLeading: false,
      centerTitle: centerTitle,
      iconTheme: iconThemeData,
      title: title != null
          ? Padding(
              padding: EdgeInsets.only(
                left: leading == false ? 8 : 0,
              ),
              child: CustomTextWidget(
                text: title.toString(),
                color: titleColor ?? Styles.black,
                textAlign: TextAlign.center,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            )
          : titleWidget,
      leading: leading == true
          ? IconButton(
              padding: const EdgeInsets.only(left: 20),
              color: Styles.black,
              onPressed: onLeadingPress ??
                  () {
                    Get.back();
                  },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Styles.primaryColor,
              ),
            )
          : leadingWidget,
      actions: [
        trailing ?? const SizedBox.shrink(),
        // trailing == null
        // ? const SizedBox()
        // : IconButton(
        //     padding: const EdgeInsets.only(left: 0, bottom: 8),
        //     alignment: Alignment.centerLeft,
        //     onPressed: onTrailingPressed,
        //     color: Styles.black,
        //     icon: SvgIconComponent(icon: trailing!, height: 22, width: 23,color: trailingColor ?? Styles.black),)
      ],
    );
  }
}
