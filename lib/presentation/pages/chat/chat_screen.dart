import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/custom_appbar_component.dart';
import '../../../components/custom_text_component.dart';
import '../../../components/custom_textfield_component.dart';
import '../../../components/main_scaffold_component.dart';
import '../../../components/svg_icons_components.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/styles.dart';
import 'controller/chat_controller.dart';

class ChatScreen extends GetView<ChatController> {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: MainScaffold(
        appBar: CustomAppBar(
          title: 'Message',
          leading: true,
          bgColor: Styles.white,
          backButtonColor: Styles.black,
          // centerTitle: false,
          onLeadingPress: () {
            Get.back();
          },
        ),
        body: GetBuilder<ChatController>(builder: (context) {
          return DefaultTabController(
            length: 2,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Styles.screenPadding),
                  child: CustomTextField(
                    maxLines: 1,
                    cursorColor: Styles.solidGrey,
                    fillColor: Styles.greyLight3,
                    hint: "Search",
                    focusColor: Styles.solidGrey,
                    hintColor: Styles.black.withOpacity(0.4),
                    textInputType: TextInputType.name,
                    txtController: controller.searchTextEditingController,
                    textInputAction: TextInputAction.next,
                    node: controller.focusSearch,
                    onTap: () {},
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(2.0),
                      child: SvgIconComponent(
                          icon: "search_2x.svg", color: Styles.solidGrey),
                    ),
                    borderRadius: 9,
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  color: Styles.white,
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
                      return chatTile(
                        name: 'Justin Levin',
                        lastMessage: 'Hello there..',
                        unread: index,
                        time: index == 0 ? "40mins" : "Jul 23, 08:00 PM",
                        // time: '4${index}mins',
                        isOnline: index == 1,
                        isQuote: false,
                        isVerified: index == 1,
                        image:
                            'https://media.istockphoto.com/id/1483322758/photo/man-fasten-metal-profile-frame-to-the-wall-for-draywall-bulkhead.webp?b=1&s=170667a&w=0&k=20&c=AE86ltSi7GmoSswzGmr813hZkTIyjg8QxNn2TRORiYE=',
                      );
                    },
                    separatorBuilder: (
                      context,
                      index,
                    ) {
                      return const Divider(
                        color: Styles.greyLight,
                        height: 20,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget chatTile(
      {required String name,
      required String time,
      required String lastMessage,
      required int unread,
      required String image,
      required bool isQuote,
      bool isVerified = false,
      required bool isOnline}) {
    return ListTile(
      onTap: () {
        Get.toNamed(
          Routes.chatting,
          arguments: {
            'image':
                'https://media.istockphoto.com/id/1483322758/photo/man-fasten-metal-profile-frame-to-the-wall-for-draywall-bulkhead.webp?b=1&s=170667a&w=0&k=20&c=AE86ltSi7GmoSswzGmr813hZkTIyjg8QxNn2TRORiYE=',
            'name': name,
            'role': 'Plumber',
            'isVerified': isVerified,
            'isQuote': isQuote,
          },
        );
      },
      contentPadding: EdgeInsets.zero,
      leading: SizedBox(
        height: Get.height * 50 / 812,
        width: Get.width * 50 / 375,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              backgroundColor: Colors.orange,
              radius: 25,
              backgroundImage: NetworkImage(image),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isOnline ? Styles.green : Styles.greySilver,
                  border: Border.all(
                    width: 1,
                    color: Colors.white,
                  ),
                ),
                child: const Text(''),
              ),
            ),
          ],
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Flexible(
                    child: CustomTextWidget(
                      text: name,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  if (isVerified)
                    const SizedBox(
                      width: 10,
                    ),
                  if (isVerified)
                    const SvgIconComponent(icon: 'verified_new.svg'),
                ],
              ),
            ),
            Text(time,
                style: TextStyle(
                  fontSize: 12,
                  color: Styles.solidGrey.withOpacity(0.6),
                )),
            // CustomText(
            //   text: controller.chatHomeModel?.data?.groupList?[index].messageTime!,
            //   fontSize: 12,
            //   fontWeight: FontWeight.w600,
            //   color: AppColors.containerGreyColor2
            //       .withOpacity(0.6),
            // ),
          ],
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Row(
          children: [
            Expanded(
              child: CustomTextWidget(
                text: lastMessage,
                fontSize: 12,
                color: Styles.solidGrey,
              ),
            ),
            // const Spacer(),
            (unread) == 0
                ? const SizedBox()
                : Container(
                    alignment: Alignment.center,
                    height: Get.height * 20 / 812,
                    width: Get.width * 20 / 375,
                    decoration: const BoxDecoration(
                        color: Styles.red, shape: BoxShape.circle),
                    child: CustomTextWidget(
                      text: unread.toString(),
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      textAlign: TextAlign.center,
                      color: Styles.white,
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
