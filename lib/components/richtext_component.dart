// ignore_for_file: must_be_immutable
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../utils/styles.dart';

class RichTextWidget extends StatelessWidget {
  String? text;
  String? onTapText;
  Color color;
  Color onTapColor;
  double textFontSize;
  double onTapFontSize;
  FontWeight textFontWeight;
  FontWeight onTapFontWeight;
  TextDecoration? decoration;
  void Function()? onTap;
  RichTextWidget({
    Key? key,
    this.text,
    this.onTapText,
    this.color = Styles.black,
    this.onTapColor = Styles.blue,
    this.textFontSize = 14,
    this.onTapFontSize = 14,
    this.textFontWeight = FontWeight.normal,
    this.onTapFontWeight = FontWeight.normal,
    this.onTap,
    this.decoration = TextDecoration.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(text: text, style: TextStyle(color: color, fontSize: textFontSize, fontFamily: "Manrope", fontWeight: textFontWeight)),
          TextSpan(text: onTapText.toString(), style: TextStyle(color: onTapColor, fontSize: onTapFontSize, fontFamily: "Manrope", fontWeight: onTapFontWeight, decoration: decoration), recognizer: TapGestureRecognizer()..onTap = onTap),
        ],
      ),
    );
  }
}
