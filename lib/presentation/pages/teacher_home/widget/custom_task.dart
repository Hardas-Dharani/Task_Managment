import 'package:flutter/material.dart';
import 'package:task_management/data/models/task_list_model.dart';
import 'package:task_management/presentation/pages/teacher_home/controller/teacher_home_controller.dart';

import '../../../../components/custom_text_component.dart';
import '../../../../components/richtext_component.dart';
import '../../../../utils/styles.dart';

class CustomTaskWidget extends StatelessWidget {
  final TaskListModelData taskModel;

  const CustomTaskWidget({Key? key, required this.taskModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Styles.primaryColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomTextWidget(
                text: taskModel.title ?? "",
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          CustomTextWidget(
            text: 'Client: ${taskModel.user!.name}', // Display the client name
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
          const SizedBox(
            height: 5,
          ),
          CustomTextWidget(
            text: 'Category: ${taskModel.user!.college}', // Display the category
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
          const SizedBox(
            height: 5,
          ),
          CustomTextWidget(
            text: taskModel.endDate.toString(),
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              RichTextWidget(
                text: "\$${taskModel.budget}",
                textFontSize: 16,
                textFontWeight: FontWeight.bold,
                color: Styles.primaryColor,
                onTapColor: Styles.black,
                onTapText: " Price",
                onTapFontSize: 12,
              ),
              const Spacer(),
              Image.asset(
                "assets/images/icons/verify_icon.png",
                width: 15,
              ),
              const SizedBox(
                width: 10,
              ),
              const CustomTextWidget(
                text: "Payment Verified",
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: Styles.primaryColor.withOpacity(0.5),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextWidget(
            text: taskModel.description ?? "",
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
