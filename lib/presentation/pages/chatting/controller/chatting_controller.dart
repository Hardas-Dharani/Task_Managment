// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChattingController extends GetxController {
  String file='';
  TextEditingController msgTextController=TextEditingController();
  FocusNode focusSearch = FocusNode();
  ScrollController scrollController = ScrollController();

  scrollToBottom() {
    print('scrolling..');
    Future.delayed(const Duration(milliseconds: 200), () {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(microseconds: 1),
        curve: Curves.easeInOut,
      );
    });
  }
  bool isQuote=false;

  List chatList=[
    {
      'message' : 'hello there..',
      'time' : '11:26 AM',
      'isMe' : false,
      'file' : null,
      'fileType' : null,
    },
    {
      'message' : 'Hi',
      'time' : '11:26 AM',
      'isMe' : true,
      'file' : null,
      'fileType' : null,
    },
    {
      'message' : 'Lorem ipsum dolor sit amet',
      'time' : '11:26 AM',
      'isMe' : false,
      'file' : null,
      'fileType' : null,
    },
    {
      'message' : 'Lorem ipsum dolor sit amet consectetur .Vel diam tristique.',
      'time' : '11:26 AM',
      'isMe' : true,
      'file' : 'https://media.istockphoto.com/id/1268238591/photo/profile-of-a-young-engineer.webp?b=1&s=170667a&w=0&k=20&c=kAgx-RELaDzi-NJeSpxMxnHEdxARKARtXkDWPznsM30=',
      'fileType' : 'image',
    },
    {
      'message' : '',
      'time' : '11:26 AM',
      'isMe' : false,
      'file' : 'https://www.africau.edu/images/default/sample.pdf',
      'fileType' : 'pdf',
    },
    {
      'message' : '',
      'time' : '11:26 AM',
      'isMe' : true,
      'file' : 'https://www.africau.edu/images/default/sample.pdf',
      'fileType' : 'pdf',
    },
    {
      'message' : 'Lorem ipsum dolor sit amet consectetur .Vel diam tristique.',
      'time' : '11:26 AM',
      'isMe' : false,
      'file' : 'https://media.istockphoto.com/id/1268238591/photo/profile-of-a-young-engineer.webp?b=1&s=170667a&w=0&k=20&c=kAgx-RELaDzi-NJeSpxMxnHEdxARKARtXkDWPznsM30=',
      'fileType' : 'image',
    },
  ];

  @override
  void onInit() {
    scrollToBottom();
    isQuote=Get.arguments['isQuote'];
    // TODO: implement onInit
    super.onInit();
  }
}
