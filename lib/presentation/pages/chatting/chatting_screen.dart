import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/custom_appbar_component.dart';
import '../../../components/custom_button_component.dart';
import '../../../components/custom_text_component.dart';
import '../../../components/custom_textfield_component.dart';
import '../../../components/main_scaffold_component.dart';
import '../../../components/svg_icons_components.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/styles.dart';
import 'controller/chatting_controller.dart';

class ChattingScreen extends GetView<ChattingController> {
  const ChattingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      appBar: CustomAppBar(
        leading: true,
        bgColor: Styles.white,
        backButtonColor: Styles.black,
        centerTitle: false,
        leadingWidget: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: Get.height * 50 / 812,
                width: Get.width * 50 / 420,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.orange,
                      radius: 22,
                      backgroundImage: NetworkImage(Get.arguments['image']),
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: true ? Styles.green : Styles.greySilver,
                              border:
                                  Border.all(width: 1, color: Colors.white)),
                          child: const Text(''),
                        )),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomTextWidget(
                        text: Get.arguments['name'],
                        fontWeight: FontWeight.w700,
                      ),
                      if (Get.arguments['isVerified'])
                        const SizedBox(
                          width: 10,
                        ),
                      if (Get.arguments['isVerified'])
                        const SvgIconComponent(icon: 'verified_new.svg'),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextWidget(
                    text: Get.arguments['role'],
                    color: Styles.orangeBorder,
                    fontSize: 12,
                  ),
                ],
              ),
            ],
          ),
        ),
        trailing: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SvgIconComponent(
            icon: 'menu.svg',
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Styles.screenPadding),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const SizedBox(
                            height: 40,
                          ),
                          const Row(
                            children: [
                              SvgIconComponent(icon: 'mute.svg'),
                              SizedBox(
                                width: 10,
                              ),
                              CustomTextWidget(
                                text: 'Mute',
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                              showModalBottomSheet(
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20)),
                                  ),
                                  builder: (context) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: Styles.screenPadding),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          const SizedBox(
                                            height: 33,
                                          ),
                                          SizedBox(
                                              width: 75,
                                              height: 75,
                                              child: Image.asset(
                                                  Styles.getCommonImage(
                                                      "angel_herwitz.png"))
                                              // SvgImageComponent(
                                              //   icon: 'angel_herwitz.png',
                                              //   width: 75,
                                              //   height: 75,
                                              // ),
                                              ),
                                          const SizedBox(height: 24),
                                          const CustomTextWidget(
                                            textAlign: TextAlign.center,
                                            text:
                                                'Lorem ipsum dolor sit amet consectetur. Maecenas amet arcu et aenean bibendum odio tristique parturient. Nibh porttitor ornare purus etiam vulputate.',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: Styles.solidGrey,
                                          ),
                                          const SizedBox(height: 26),
                                          CustomButton(
                                            onTap: () {
                                              Get.back();
                                            },
                                            radius: 9,
                                            height: 48,
                                            bgColor: Styles.red,
                                            fontSize: 14,
                                            title: "Block",
                                            fontWeight: FontWeight.w800,
                                            fontColor: Styles.white,
                                          ),
                                          const SizedBox(height: 20),
                                        ],
                                      ),
                                    );
                                  });
                              // Get.back();
                            },
                            child: const Row(
                              children: [
                                SvgIconComponent(icon: 'block.svg'),
                                SizedBox(
                                  width: 10,
                                ),
                                CustomTextWidget(
                                  text: 'Block User',
                                  fontWeight: FontWeight.w700,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    );
                  });
            },
          ),
        ),
      ),
      body: GetBuilder<ChattingController>(builder: (context) {
        return Stack(
          children: [
            SingleChildScrollView(
              controller: controller.scrollController,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Styles.screenPadding),
                child: Column(
                  children: [
                    SizedBox(
                      height: controller.isQuote ? 60 : 20,
                    ),
                    Center(
                        child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Styles.solidGrey.withOpacity(0.1),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      child: const CustomTextWidget(
                        text: 'Today',
                        fontSize: 12,
                      ),
                    )),
                    ListView.separated(
                      itemCount: controller.chatList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (
                        context,
                        index,
                      ) {
                        return messageWidget(
                            time: controller.chatList[index]['time'],
                            msg: controller.chatList[index]['message'],
                            file: controller.chatList[index]['file'],
                            fileType: controller.chatList[index]['fileType'],
                            isMe: controller.chatList[index]['isMe']);
                      },
                      separatorBuilder: (
                        context,
                        index,
                      ) {
                        return const SizedBox(
                          height: 15,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
            if (controller.isQuote)
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.quoteDetail);
                },
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Styles.mainScaffoldColor,
                    ),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgIconComponent(icon: 'qoute.svg'),
                        SizedBox(
                          width: 10,
                        ),
                        CustomTextWidget(
                          text: 'View Quote Detail',
                          color: Styles.metal,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Styles.screenPadding),
                child: Container(
                  padding: const EdgeInsets.only(bottom: 15, top: 10),
                  color: Colors.white,
                  child: CustomTextField(
                    maxLines: 1,
                    cursorColor: Styles.solidGrey,
                    fillColor: Styles.greyLight3,
                    hint: "Write a message",
                    // focusColor: Styles.solidGrey,
                    hintColor: Styles.black.withOpacity(0.4),
                    textInputType: TextInputType.name,
                    txtController: controller.msgTextController,
                    textInputAction: TextInputAction.next,
                    node: controller.focusSearch,
                    suffixWidget: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgIconComponent(icon: 'attachment.svg'),
                        SizedBox(
                          width: 20,
                        ),
                        SvgIconComponent(icon: 'send.svg'),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    onTap: () {},

                    borderRadius: 24,
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget messageWidget({
    required bool isMe,
    required String? msg,
    required String? file,
    required String? fileType,
    required String? time,
  }) {
    return GestureDetector(
      onTap: () {
        if (file != null && fileType == 'pdf') {
          controller.file = file;
          controller.update();

          Get.toNamed(Routes.viewFile);
        }
      },
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          file == null
              ? Container(
                  decoration: BoxDecoration(
                    color:
                        isMe ? Styles.metal : Styles.solidGrey.withOpacity(0.1),
                    borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.circular(10),
                      bottomRight:
                          isMe ? const Radius.circular(10) : Radius.zero,
                      topRight: isMe ? Radius.zero : const Radius.circular(10),
                      topLeft: const Radius.circular(10),
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: CustomTextWidget(
                    text: msg ?? '',
                    fontSize: 13,
                    color: isMe ? Styles.white : Styles.black,
                  ),
                )
              : fileType == 'image'
                  ? Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Styles.solidGrey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              image: NetworkImage(file), fit: BoxFit.cover)),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        color: isMe
                            ? Styles.metal
                            : Styles.solidGrey.withOpacity(0.1),
                        borderRadius: BorderRadius.only(
                          bottomLeft: const Radius.circular(10),
                          bottomRight:
                              isMe ? const Radius.circular(10) : Radius.zero,
                          topRight:
                              isMe ? Radius.zero : const Radius.circular(10),
                          topLeft: const Radius.circular(10),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SvgIconComponent(
                            icon: 'pdf_2x.svg',
                            height: 35,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          CustomTextWidget(
                            text: file.split('/').last,
                            fontSize: 13,
                            color: isMe ? Styles.white : Styles.black,
                          ),
                        ],
                      ))
        ],
      ),
    );
  }
}
