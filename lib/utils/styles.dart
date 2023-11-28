import 'package:flutter/material.dart';

enum BookingsType { scheduled, pending, completed, cancelled, disputes }

enum FileCategory { profileImage, coverImage }

enum ImageSize { oneX, twoX, threeX }

class Styles {
  static const mainScaffoldColor = Color(0xFFF4F5F6);
  static const white = Color(0xFFFFFFFF);

  static const orangeActive = Color(0xFFF99B0D);
  static const orange = Color(0xFFF68115);
  static const solidOrange = Color(0xFFD49255);
  static const orangeBorder = Color(0xFFD39554);
  static const lightOrange = Color(0xFFD49255);
  static const dividerColor = Color(0xFFE9EDEF);
  static const primaryColor = Color(0xFF246BFD);
  static const orangeGradientColor = [
    Color(0xFFFACA91),
    Color(0xFFFDB372),
    Color(0xFFD2883C)
  ];
  static const blackGradientColor = [
    Color(0xFF63748B),
    Color(0xFF243141),
    Color(0xFF23303F)
  ];
  static const inactiveColor = Color(0xFFD0DAE4);
  static const slightGreyBorder = Color(0xFFA7B9BF);
  static const slightGreyBorder2 = Color(0xFF3E4A54);
  static const solidGrey = Color(0xFF73858F);
  static const solidGrey2 = Color(0xFF798AA4);
  static const shadowColor = Color(0xFFCAD3D9);
  static const metalColor2 = Color(0xFF1A2430);
  static var solidGreyBorder = const Color(0xFF73858F).withOpacity(0.3);
  static const greySilver = Color(0xFFA0ACB3);
  static const lightSilver = Color(0xFFABB6BC);
  static const greyLight = Color(0xFFAAAFBB);
  static const greyLight2 = Color(0xFF949BAB);
  static const greyLight3 = Color(0xFFF7F7F9);
  static const greyLight4 = Color(0xFFF1F3F4);
  static const greyLight5 = Color(0xFF9D9693);
  static const grey = Color(0xFF6E7B87);
  static const starColor = Color(0xFFFFB800);

  static const homeTextField = Color(0xFF010102);
  static const black = Color(0xFF000000);
  static const black2 = Color(0xFF222F3E);
  static const metal = Color(0xFF23303F);
  static const metalColor3 = Color(0xFF222F3E);
  static List<Color> metalGradientColor = [
    // Color(0xFF63748B),
    // const Color(0xFF243141).withOpacity(0.7),
    const Color(0xFF526277),
    const Color(0xFF243141).withOpacity(0.9),
    // const Color(0xFF243141).withOpacity(0.9),
    // const Color(0xFF243141),
    const Color(0xFF243141),
    // metal
  ];

  static const green = Color(0xFF8CCE21);
  static const greenActive2 = Color(0xFF19ECB9);
  static const lightGreen = Color(0xFF8DCE21);
  static const greenActive = Color(0xFF75F90D);
  static const solidGreen = Color(0xFF28B446);
  static const greenBtn = Color(0xFF17D31F);
  static const sky = Color(0xFF27B0FB);
  static const solidRed = Color(0xFFEB001B);

  static const blue = Color(0xFF4894EB);
  static const blueLight = Color(0xFF0084FF);

  static const red = Color(0xFFE42B2B);
  static const redDark = Color(0xFFFF4141);
  static const redNormal = Color(0xFFE33C3C);

  static const yellow = Color(0xFFF8A912);

  static LinearGradient linearOrange = LinearGradient(
    colors: [
      const Color(0xFFFFC188).withOpacity(0.5),
      const Color(0xFFFFC188),
      const Color(0xFFD49255)
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static LinearGradient darkGradient = LinearGradient(
    colors: [
      const Color(0xFFD49255).withOpacity(0.5),
      const Color(0xFFD49255),
      const Color(0xFFD49255)
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static LinearGradient linearOrangeSubs = const LinearGradient(
    colors: [
      Color(0xFFFCC8A7),
      Color(0xFFD39865),
      Color(0xFFD59458),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static LinearGradient linearOrangeOpacity = LinearGradient(
    colors: [
      const Color(0xFFFFC188).withOpacity(0.3),
      const Color(0xFFFFC188).withOpacity(0.3),
      const Color(0xFFD49255).withOpacity(0.3),
      Styles.solidOrange.withOpacity(0.3),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static BoxDecoration boxDecoration = BoxDecoration(
    color: Styles.white,
    boxShadow: [
      BoxShadow(
        color: Styles.shadowColor.withOpacity(0.55),
        blurRadius: 11,
        spreadRadius: 0,
        offset: const Offset(3, -5),
      ),
    ],
  );
  static BoxDecoration boxDecoration2 = BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    color: Styles.white,
    border:
        Border.all(color: Styles.slightGreyBorder.withOpacity(0.25), width: 1),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.06),
        offset: const Offset(8, 9),
        blurRadius: 22,
        spreadRadius: 0,
      ),
    ],
  );
  static BoxDecoration boxDecoration3 = BoxDecoration(
    color: Styles.white,
    borderRadius: BorderRadius.circular(15),
    // color: Styles.white,
    border: Border.all(color: Styles.greyLight2.withOpacity(0.25), width: 1),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.06),
        offset: const Offset(8, 9),
        blurRadius: 22,
        spreadRadius: 0,
      ),
    ],
  );

  static BoxDecoration blackDecoration = BoxDecoration(
    color: Styles.metal,
    boxShadow: [
      BoxShadow(
        color: const Color(0xff0E151E).withOpacity(0.25),
        offset: const Offset(0, -19),
        blurRadius: 25,
        spreadRadius: 0,
      )
    ],
  );

  static LinearGradient linearMetal = LinearGradient(
    colors: Styles.metalGradientColor,
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static LinearGradient linearMetal2 = const LinearGradient(
    colors: [
      Color(0xFF222F3E),
      Color(0xFF222F3E),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const double screenPadding = 24;

  static getCommonImage(String imageName, {ImageSize size = ImageSize.oneX}) {
    switch (size) {
      case ImageSize.oneX:
        return "assets/images/common/$imageName";
      case ImageSize.twoX:
        return "assets/images/common/2.0.x/$imageName";
      case ImageSize.threeX:
        return "assets/images/common/3.0.x/$imageName";
    }
  }

  static getIconImage(String imageName, {ImageSize size = ImageSize.oneX}) {
    switch (size) {
      case ImageSize.oneX:
        return "assets/images/icons/$imageName";
      case ImageSize.twoX:
        return "assets/images/icons/$imageName";
      case ImageSize.threeX:
        return "assets/images/icons/$imageName";
    }
  }

  static getLogoImage(String imageName, {ImageSize size = ImageSize.oneX}) {
    switch (size) {
      case ImageSize.oneX:
        return "assets/images/logos/$imageName";
      case ImageSize.twoX:
        return "assets/images/logos/2.0.x/$imageName";
      case ImageSize.threeX:
        return "assets/images/logos/3.0.x/$imageName";
    }
  }
}
