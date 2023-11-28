import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

bool isStatusBarDark = true;

void darkStatusBar() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0xFF526277),
    statusBarBrightness: Brightness.light,
  ));
}

void lightStatusBar() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  ));
}

void onBackScreen() {
  isStatusBarDark ? darkStatusBar() : lightStatusBar();
}
