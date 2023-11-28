import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../app/services/custom_txt_controller.dart';
import '../components/svg_icons_components.dart';
import '../utils/styles.dart';

// ignore: must_be_immutable
class CustomTextField extends GetView<CustomTxtController> {
  String? hint;
  TextInputType textInputType = TextInputType.none;
  TextInputAction textInputAction = TextInputAction.done;
  TextEditingController? txtController; // = TextEditingController();
  final FormFieldValidator? validatorFtn;
  final Function? onEditComplete;
  final Function(String)? onFieldSubmit;
  final String Function(String?)? onChangeFtn;
  String value = "";
  double? width;
  double? hintFontSize;
  int? maxLength;
  FocusNode? node;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? errorText;
  bool isPass = false;
  bool isCentered = false;
  bool readOnly = false;
  Color focusColor;
  Color? fillColor;
  Function()? onTap;
  Color? hintColor = const Color(0xFFFFFFFF).withOpacity(0.6);
  int? maxLines;
  List<TextInputFormatter>? inputFormat;
  Function()? onTapPass;
  String? initialValue;
  final bool? enabled;
  final bool obscure;
  double padding;
  double borderRadius;
  Color textFieldColor;
  AutovalidateMode autoValidateMode;
  int minLines;
  Widget? suffixWidget;
  Color? cursorColor;
  String? counterText;
  CustomTextField({
    Key? key,
    this.hint,
    this.node,
    this.prefixIcon,
    this.suffixIcon,
    this.hintFontSize = 12,
    this.textFieldColor = Styles.solidGrey,
    this.readOnly = false,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.isPass = false,
    this.obscure = false,
    this.onEditComplete,
    this.enabled,
    this.width = double.infinity,
    this.maxLines = 1,
    this.padding = 15,
    this.maxLength = 40,
    this.borderRadius = 9,
    this.errorText,
    this.onFieldSubmit,
    this.onTapPass,
    this.txtController,
    this.validatorFtn,
    this.onChangeFtn,
    this.inputFormat,
    this.focusColor = Styles.orangeBorder,
    this.fillColor,
    this.onTap,
    this.hintColor,
    this.initialValue,
    this.minLines = 1,
    this.suffixWidget,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.cursorColor = Styles.black,
    this.counterText = '',
  }) : super(key: key) {
    txtController?.addListener(onTextEdit);
    node?.addListener(() {
      controller.setFocused(node?.hasFocus);
    });
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomTxtController>(builder: (value) {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Theme(
          data: Theme.of(context).copyWith(
            primaryColor: Colors.black,
          ),
          child: TextFormField(
            minLines: minLines,
            maxLines: maxLines,
            onTap: onTap,
            maxLength: maxLength!,
            onFieldSubmitted: onFieldSubmit,
            // onEditingComplete: onEditComplete,
            autovalidateMode: autoValidateMode,
            cursorColor: cursorColor,
            enabled: enabled ?? true,
            scrollPadding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            initialValue: initialValue,
            controller: txtController,
            autofocus: false,
            obscureText: obscure,
            textInputAction: textInputAction,
            keyboardType: textInputType,
            autocorrect: false,
            focusNode: node,
            inputFormatters: inputFormat ?? const [],
            style: TextStyle(
                fontSize: 13,
                color: textFieldColor,
                fontWeight: FontWeight.normal,
                fontFamily: "Manrope"),
            decoration: InputDecoration(
              counterText: counterText,
              counterStyle: TextStyle(
                  fontFamily: "Manrope",
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Styles.solidGrey.withOpacity(0.8)),
              contentPadding: EdgeInsets.all(padding),
              errorText: errorText,
              prefixIcon: prefixIcon == null
                  ? null
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(height: 12, width: 12, child: prefixIcon),
                    ),
              //labelText:hint,
              // labelStyle:
              //     AppColors.getRegularFont(14, color: AppColors.textWhiteColorOpacity50),
              suffixIcon: !isPass
                  ? suffixWidget
                  : GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: onTapPass,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SizedBox(
                          height: 24,
                          width: 24,
                          child: SvgIconComponent(
                              icon: obscure
                                  ? node!.hasFocus
                                      ? "ic_password_invisible_2x.svg"
                                      : "ic_password_invisible_2x.svg"
                                  : node!.hasFocus
                                      ? "ic_password_visible_2x.svg"
                                      : "ic_password_visible_2x.svg"),
                          // Image.asset(
                          //   Styles.getIconImage(obscure
                          //       ? node!.hasFocus
                          //           ? "ic_password_invisible_2x.png"
                          //           : "ic_password_invisible_2x.png"
                          //       : node!.hasFocus ? "ic_password_visible_2x.png" : "ic_password_visible_2x.png"),
                          // ),
                        ),
                      )),

              filled: true,
              hintText: hint,
              focusColor: focusColor,
              fillColor: fillColor,
              hintStyle: TextStyle(
                  fontSize: hintFontSize,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Manrope",
                  color: hintColor == null
                      ? Styles.solidGrey.withOpacity(0.6)
                      : hintColor!),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  width: 0.5,
                  color: Styles.primaryColor.withOpacity(0.8),
                  style: BorderStyle.none,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  width: 0.5,
                  color: Styles.primaryColor.withOpacity(0.8),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  width: 0.5,
                  color: Styles.primaryColor.withOpacity(0.8),
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  width: 0.5,
                  color: Styles.primaryColor.withOpacity(0.8),
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  width: 0.5,
                  color: Styles.primaryColor.withOpacity(0.8),
                  style: BorderStyle.none,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  width: 0.5,
                  color: Styles.primaryColor.withOpacity(0.8),
                ),
              ),
            ),
            validator: validatorFtn,
            onChanged: onChangeFtn,
            readOnly: readOnly,
          ),
        ),
      );
    });
  }

  void onTextEdit() {
    value = txtController?.text ?? "";
    value == "" ? controller.setEmpty() : controller.setFilled();
  }
}
