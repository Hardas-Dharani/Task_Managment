// // ignore_for_file: unused_field

// import 'dart:async';
// import 'dart:developer';

// import 'package:agora_uikit/agora_uikit.dart';
// import 'package:connect_pro/components/custom_text_component.dart';
// import 'package:connect_pro/components/richtext_component.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../../components/custom_button_component.dart';
// import '../../../../routes/app_routes.dart';
// import '../../../../utils/styles.dart';

// const appId = "c55ac84bd5b3431094b69b73478f7c2f";
// const channel = "meeting_id#7818";
// const token =
//     "006c55ac84bd5b3431094b69b73478f7c2fIAAIA5CE4iNmTcrtjjz4yO6369TxnrFECH7CZDPnctMdcEFNT6cAAAAAIgCmQBQCnrQCZQQAAQC+7wFlAgC+7wFlAwC+7wFlBAC+7wFl";

// class VideoCallController extends GetxController {
//   int? remoteUid;
//   bool localUserJoined = false;
//   bool isCallMuted = true;
//   Timer? timer;
//   late RtcEngine engine;
//   // String callDuration='';
//   final AgoraClient client = AgoraClient(
//     agoraConnectionData: AgoraConnectionData(
//       appId: appId,
//       channelName: channel,
//       username: "user",
//     ),
//   );

//   String callDuration = '00:00';
//   int callLimit = 1; //in seconds
//   int callTime = 0; //inseconds
//   DateTime? callStartTime;

//   Future<void> initAgora() async {
//     // retrieve permissions
//     await [Permission.microphone, Permission.camera].request();

//     //create the engine
//     engine = createAgoraRtcEngine();
//     await engine.initialize(const RtcEngineContext(
//       appId: appId,
//       channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
//     ));

//     engine.registerEventHandler(
//       RtcEngineEventHandler(
//         onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
//           debugPrint("local user ${connection.localUid} joined");
//           localUserJoined = true;
//           update();
//         },
//         onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
//           callStartTime = DateTime.now();
//           remoteUid = remoteUid;

//           update();
//           startCallTimer();

//           debugPrint("remote user $remoteUid joined");
//           // setState(() {
//           // });
//         },
//         onError: (ErrorCodeType type, s) {
//           engine.release(sync: true);
//           engine.leaveChannel();
//           remoteUid = null;

//           Get.back();
//           update();

//           // setState(() {
//           log('error type: $type error $s');
//         },
//         onUserOffline: (RtcConnection connection, int remoteUid,
//             UserOfflineReasonType reason) {
//           debugPrint("remote user $remoteUid left channel");
//           engine.release(sync: true);
//           engine.leaveChannel();

//           remoteUid = null;

//           Get.back();
//           update();
//         },
//         onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
//           debugPrint(
//               '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
//         },
//       ),
//     );

//     await engine.setClientRole(
//       role: ClientRoleType.clientRoleBroadcaster,
//     );
//     await engine.setDefaultAudioRouteToSpeakerphone(false);
//     await engine.enableVideo();
//     await engine.startPreview();

//     await engine.joinChannel(
//       token: token,
//       channelId: channel,
//       uid: 0,
//       options: const ChannelMediaOptions(),
//     );
//   }

//   void muteUnmuteCall() async {
//     await engine.muteLocalAudioStream(isCallMuted);
//   }

//   @override
//   void onClose() {
//     timer?.cancel();
//     //stop listening to network state when app is closed
//   }

//   @override
//   void onInit() {
//     // initAgora();
//     startCallTimer();
//     // TODO: implement onInit
//     super.onInit();
//   }

//   Future<void> showLimitDialog() async {
//     Get.dialog(
//       Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           const SizedBox(
//             height: 50,
//           ),
//           AlertDialog(
//             shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(22))),
//             content: Column(
//               children: [
//                 RichTextWidget(
//                   text: "Session ends in ",
//                   textFontSize: 16,
//                   textFontWeight: FontWeight.w500,
//                   onTapText: "1 minutes",
//                   onTapFontSize: 16,
//                   onTapFontWeight: FontWeight.w800,
//                   onTapColor: Styles.black,
//                 ),
//                 const SizedBox(
//                   height: 12,
//                 ),
//                 FittedBox(
//                   child: Row(
//                     children: [
//                       CustomButton(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w800,
//                         fontColor: Styles.white,
//                         radius: 11,
//                         width: 153,
//                         height: 49,
//                         onTap: () async {
//                           //await engine.leaveChannel();
//                           Get.back();
//                           Get.offNamed(Routes.adScreen);
//                         },
//                         gradient: const LinearGradient(
//                           colors: [
//                             Color(0xFFFF0000),
//                             Color(0xFFFF0000),
//                             Color(0xFFFF0000)
//                           ],
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                         ),
//                         title: "End Call",
//                       ),
//                       const SizedBox(
//                         width: 12,
//                       ),
//                       CustomButton(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w800,
//                         fontColor: Styles.white,
//                         radius: 11,
//                         width: 153,
//                         height: 49,
//                         onTap: () {
//                           // Get.toNamed(Routes.paymentMethods, arguments: {
//                           //   "title": "Payment Method",
//                           //   "buttonTitle": "Add Payment Method"
//                           // });
//                         },
//                         gradient: LinearGradient(
//                           colors: [
//                             const Color(0xFFFFC188).withOpacity(0.5),
//                             const Color(0xFFFFC188),
//                             const Color(0xFFD49255)
//                           ],
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                         ),
//                         title: "Continue",
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 CustomTextWidget(
//                   text:
//                       '* If you continue the call you will be charged \$0.5 per minute.',
//                   color: Styles.solidGrey.withOpacity(0.8),
//                   fontSize: 12,
//                   fontWeight: FontWeight.w500,
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       barrierDismissible: false,
//     );
//   }

//   void startCallTimer() {
//     callStartTime = DateTime.now();

//     // Start a timer that updates call duration every second
//     timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
//       updateCallDuration();
//       if (callLimit == callTime) {
//         //muteUnmuteCall();
//         showLimitDialog();
//       }
//     });
//   }

//   void updateCallDuration() {
//     DateTime now = DateTime.now();
//     Duration callDuration = now.difference(callStartTime!);

//     int minutes = callDuration.inMinutes;
//     int seconds = callDuration.inSeconds % 60;
//     this.callDuration = '$minutes:${seconds.toString().padLeft(2, '0')}';
//     callTime = callTime + 1;
//     update();
//   }
// }
