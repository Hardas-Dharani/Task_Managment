import 'package:flutter/material.dart';
import 'package:task_management/components/svg_icons_components.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const SvgIconComponent(icon: "check_box.svg");
  }
}
// Theme(
// data: ThemeData(
// unselectedWidgetColor:
// Styles.solidGrey.withOpacity(0.5),
// ),
// child: Checkbox(
// value: controller.selectedLanguages.contains(
// controller.languages[index],
// ),
// onChanged: (bool? value) {
// if (controller.selectedLanguages
//     .contains(controller.languages[index])) {
// controller.selectedLanguages
//     .remove(controller.languages[index]);
// } else {
// controller.selectedLanguages
//     .add(controller.languages[index]);
// }
// controller.update();
// },
// activeColor: Styles.orangeBorder,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(5)),
// ),
// ),
