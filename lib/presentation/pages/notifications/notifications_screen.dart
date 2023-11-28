import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/custom_appbar_component.dart';
import '../../../components/custom_text_component.dart';
import '../../../components/main_scaffold_component.dart';
import '../../../components/svg_icons_components.dart';
import '../../../utils/styles.dart';
import 'controller/notifications_controller.dart';

class NotificationComponent extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final String? time;

  const NotificationComponent(
      {super.key, this.title, this.subTitle, this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: Styles.boxDecoration2,
      width: Get.width,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Styles.mainScaffoldColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const SvgIconComponent(
              icon: 'notification_2x.svg',
              color: Styles.black,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
                text: title ?? '',
                fontWeight: FontWeight.w500,
              ),
              if (subTitle != null)
                const SizedBox(
                  height: 6,
                ),
              if (subTitle != null)
                CustomTextWidget(
                  text: subTitle ?? '',
                  decoration: TextDecoration.underline,
                  color: Styles.blue,
                ),
              const SizedBox(
                height: 6,
              ),
              CustomTextWidget(
                text: time ?? '',
                fontSize: 12,
                color: Styles.greyLight,
              )
            ],
          ))
        ],
      ),
    );
  }
}

class NotificationScreen extends GetView<NotificationController> {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: MainScaffold(
        appBar: CustomAppBar(
          title: 'Notifications',
          leading: true,
          bgColor: Styles.white,
          backButtonColor: Styles.black,
          centerTitle: false,
          onLeadingPress: () {
            Get.back();
          },
        ),
        body: GetBuilder<NotificationController>(builder: (context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Styles.screenPadding),
                  child: ListView.separated(
                    itemCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (
                      context,
                      index,
                    ) {
                      return NotificationComponent(
                        title: index == 2
                            ? 'Dispute has been resolved'
                            : index == 1
                                ? 'Video consultancy started with Aaron Smith.'
                                : 'Your consultancy with Aron Smith is in 15 minutes',
                        time: index == 2 ? 'Mar 16' : '2 hrs ago',
                        subTitle:
                            index == 2 ? 'Click to check the status' : null,
                      );
                    },
                    separatorBuilder: (
                      context,
                      index,
                    ) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
