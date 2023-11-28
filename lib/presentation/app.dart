import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/presentation/pages/splash/splash.dart';
import 'package:task_management/utils/scroll_behavior.dart';

import '../app/services/network_binding.dart';
import '../routes/app_routing.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: const MyScrollBehavior(),
      debugShowCheckedModeBanner: false,
      initialBinding: NetworkBinding(),
      // initialRoute: Routes.onboard,
      // home: const OnBoardingScreen(),
      getPages: RoutingModule().routingList,

      home: const SplashScreen(),
    );
  }
}
