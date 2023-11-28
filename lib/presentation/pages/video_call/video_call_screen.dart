// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:agora_uikit/agora_uikit.dart';
// import 'package:connect_pro/components/custom_text_component.dart';
// import 'package:connect_pro/components/main_scaffold_component.dart';
// import 'package:connect_pro/components/svg_icons_components.dart';
// import 'package:connect_pro/routes/app_routes.dart';
// import 'package:connect_pro/utils/styles.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'controller/video_call_controller.dart';

// class VideoCallScreen extends GetView<VideoCallController> {
//   const VideoCallScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MainScaffold(
//       backgroundColor: const Color(0xFF161C22),
//       body: GetBuilder<VideoCallController>(initState: (v) {
//         WidgetsBinding.instance.addPostFrameCallback((_) async {
//           // controller.initAgora();
//         });
//       }, builder: (context) {
//         return Column(
//           children: [
//             if (controller.remoteUid != null)
//               Container(
//                 height: 70,
//                 color: Colors.amber,
//                 alignment: Alignment.bottomCenter,
//                 padding: const EdgeInsets.only(bottom: 20),
//                 child: CustomTextWidget(
//                   text: controller.callDuration,
//                   color: Colors.white,
//                 ),
//               ),
//             Expanded(
//               child: Stack(
//                 alignment: Alignment.bottomCenter,
//                 children: [
//                   Align(
//                       alignment: Alignment.topCenter,
//                       child: Image.asset(
//                         "assets/images/common/video_image.png",
//                         width: Get.width,
//                         height: 861,
//                         fit: BoxFit.fitWidth,
//                       )),
//                   Align(
//                       alignment: Alignment.bottomRight,
//                       child: Padding(
//                         padding: const EdgeInsets.only(right: 20, bottom: 200),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(10),
//                           child: Image.asset(
//                             "assets/images/common/video_image2.png",
//                             width: 99,
//                             height: 135,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       )),
//                   // Center(
//                   //   child: _remoteVideo(),
//                   // ),
//                   // Align(
//                   //   alignment: Alignment.centerRight,
//                   //   child: Padding(
//                   //     padding: const EdgeInsets.only(top: 120, right: 30),
//                   //     child: ClipRRect(
//                   //       borderRadius: BorderRadius.circular(12),
//                   //       child: SizedBox(
//                   //         width: 100,
//                   //         height: 150,
//                   //         child: Center(
//                   //           child: controller.localUserJoined
//                   //               ? AgoraVideoView(
//                   //                   controller: VideoViewController(
//                   //                     rtcEngine: controller.engine,
//                   //                     canvas: const VideoCanvas(uid: 0),
//                   //                   ),
//                   //                 )
//                   //               : const CircularProgressIndicator(),
//                   //         ),
//                   //       ),
//                   //     ),
//                   //   ),
//                   // ),
//                   Align(
//                     alignment: Alignment.bottomCenter,
//                     child: Container(
//                       height: 170,
//                       decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                             colors: [
//                               Styles.white.withOpacity(0.4),
//                               Styles.metal.withOpacity(0.5),
//                               Styles.black.withOpacity(0.5),
//                               Styles.black,
//                             ],
//                             begin: Alignment.topCenter,
//                             end: Alignment.bottomCenter,
//                           ),
//                           borderRadius: const BorderRadius.only(
//                             topLeft: Radius.circular(24),
//                             topRight: Radius.circular(24),
//                           )),
//                       child: Column(
//                         children: [
//                           Align(
//                             alignment: Alignment.topCenter,
//                             child: Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(vertical: 8.0),
//                               child: Container(
//                                 height: 5,
//                                 width: 50,
//                                 decoration: BoxDecoration(
//                                     color: Styles.lightSilver,
//                                     borderRadius: BorderRadius.circular(24)),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           AgoraVideoButtons(
//                             client: controller.client,
//                             addScreenSharing: false,
//                             extraButtons: [
//                               SvgIconComponent(
//                                 icon: 'mute_call.svg',
//                                 height: 80,
//                                 onTap: () {
//                                   // controller.engine.enableAudio();
//                                 },
//                               ),
//                               const SizedBox(
//                                 width: 20,
//                               ),
//                               SvgIconComponent(
//                                 icon: 'flip.svg',
//                                 height: 80,
//                                 onTap: () {
//                                   // controller.engine.switchCamera();
//                                 },
//                               ),
//                               const SizedBox(
//                                 width: 20,
//                               ),
//                               SvgIconComponent(
//                                 icon: 'end_call.svg',
//                                 height: 80,
//                                 onTap: () {
//                                   Get.offNamed(Routes.adScreen);
//                                   // controller.engine.release(sync: true);
//                                   // controller.engine.leaveChannel();
//                                   // Get.offNamed(
//                                   //   Routes.writeAReview,
//                                   // );
//                                 },
//                               ),
//                             ],
//                             enabledButtons: const [],
//                             onDisconnect: () async {
//                               controller.engine.leaveChannel();

//                               Get.offNamed(Routes.writeAReview);
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         );
//       }),
//     );
//   }

//   Widget _remoteVideo() {
//     if (controller.remoteUid != null) {
//       return AgoraVideoView(
//         controller: VideoViewController.remote(
//           rtcEngine: controller.engine,
//           canvas: VideoCanvas(uid: controller.remoteUid),
//           connection: const RtcConnection(channelId: channel),
//         ),
//       );
//     } else {
//       return const Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             'Please wait',
//             style: TextStyle(
//               color: Colors.white,
//             ),
//           ),
//           SizedBox(
//             width: 10,
//           ),
//           CircularProgressIndicator(
//             color: Styles.orangeActive,
//           ),
//         ],
//       );
//     }
//   }
// }
