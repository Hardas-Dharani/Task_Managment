// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:io';

import 'package:flutter/material.dart';

import '../utils/styles.dart';

class MainScaffold extends StatelessWidget {
  Widget? appBar;
  Widget? drawarBar;
  Widget? floatActiveButton;
  Color backgroundColor;
  Widget body;
  Widget? bottomNavigationBar;
  bool extendBehindAppBar;
  bool isTopSafeArea;
  GlobalKey<ScaffoldState>? keyGlobal;
  bool isBottomSafeArea;
  MainScaffold(
      {Key? key,
      this.appBar,
      this.backgroundColor = Styles.white,
      this.isTopSafeArea = true,
      required this.body,
      this.floatActiveButton,
      this.keyGlobal,
      this.bottomNavigationBar,
      this.extendBehindAppBar = false,
      this.isBottomSafeArea = false,
      this.drawarBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: Platform.isAndroid ? isTopSafeArea : false,
      bottom: Platform.isAndroid ? isBottomSafeArea : false,
      child: Scaffold(
        floatingActionButton: floatActiveButton,
        key: keyGlobal,
        drawer: drawarBar,
        backgroundColor: backgroundColor,
        extendBodyBehindAppBar: extendBehindAppBar,
        appBar: appBar != null
            ? PreferredSize(
                preferredSize: const Size.fromHeight(56.0), child: appBar!)
            : null,
        body: Container(
            padding: EdgeInsets.only(
                top: appBar != null
                    ? 0
                    : Platform.isAndroid
                        ? 0
                        : MediaQuery.of(context).padding.top),
            child: body),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
